# Advanced Programming In Unix

## Thread

### 11.2 Thread Concepts

>A typical UNIX process can be thought of as having a single thread of control: 
>
>Each process is doing only one thing at a time. With multiple threads of control, we can design our programs to do more than one thing at a time within a single process, with each thread handling a separate task. 
>
>A program can be simplified using threads ***regardless of the number of processors***, because the number of processors doesn’t affect the program structure.

- The feature test macro for POSIX threads is _POSIX_THREADS. 
- Applications can either use this in an #ifdef test to determine at compile time whether threads are supported or call sysconf with the _SC_THREADS constant to determine this at runtime. 

### 11.3 Thread Identification

>Just as every process has a process ID, every thread has a thread ID. Unlike the process ID, which is unique in the system, the thread ID has significance only ***within the context of the process*** to which it belongs.

- A thread ID is represented by the **`pthread_t data`** type. Implementations are allowed to use a structure to represent the pthread_t data type, so portable implementations can’t treat them as integers. 

```c
#include <pthread.h>
int pthread_equal(pthread_t tid1, pthread_t tid2);
									Returns: nonzero if equal, 0 otherwise
```

- A consequence of allowing the pthread_t data type to be a structure is that there is no portable way to print its value. 
  - A thread can obtain its own thread ID by calling the pthread_self function.

```c
#include <pthread.h>
pthread_t pthread_self(void);
								Returns: the thread ID of the calling thread
```

>For example, a master thread might place work assignments on a queue and use the thread ID to control which jobs go to each worker thread. 
>
>A single master thread places new jobs on a work queue. A pool of three worker threads removes jobs from the queue. Instead of allowing each thread to process whichever job is at the head of the queue, the master thread controls job assignment by placing the ID of the thread that should process the job in each job structure. Each worker thread then removes only jobs that are tagged with its own thread ID.

<img src="C:\Users\13793\Desktop\学习笔记\操作系统概念\image-20201126225221529.png" alt="image-20201126225221529" style="zoom:50%;" />

### 11.4 Thread Creation

- Threads can be created by calling the pthread_create function.

```c
#include <pthread.h>
int pthread_create(pthread_t *restrict tidp,
                    const pthread_attr_t *restrict attr,
                    void *(*start_rtn)(void *), void *restrict arg);
								    Returns: 0 if OK, error number on failure
```

- The memory location pointed to by **tidp** is set to the thread ID of the newly created thread when pthread_create returns successfully. 
- The **attr** argument is used to customize various thread attributes. 
  -  We’ll set this to NULL to create a thread with the default attributes.
- The newly created thread starts running at the address of the **start_rtn** function. 
  - This function takes a single argument, **arg**, which is a typeless pointer. 
  - If you need to pass more than one argument to the start_rtn function, then you need to store them in a ***structure*** and pass the address of the structure in arg.

**Example**

- The code below creates one thread and prints the process and thread IDs of the new thread and the initial thread.

```c
#include "apue.h"
#include <pthread.h>
pthread_t ntid;
void printids(const char *s)
{
    pid_t pid;
    pthread_t tid;
    pid = getpid();
    tid = pthread_self();
    printf("%s pid %lu tid %lu (0x%lx)\n", s, (unsigned long)pid,
    (unsigned long)tid, (unsigned long)tid);
}
void * thr_fn(void *arg)
{
    printids("new thread: ");
    return((void *)0);
}
int main(void)
{
    int err;
    err = pthread_create(&ntid, NULL, thr_fn, NULL);
    if (err != 0)
    	err_exit(err, "can’t create thread");
    printids("main thread:");
    sleep(1);
    exit(0);
}
```

- The first is the need to **sleep** in the main thread. 
  - If it doesn’t sleep, the main thread might exit, thereby terminating the entire process before the new thread gets a chance to run. 
  - This behavior is dependent on the operating system’s threads implementation and scheduling algorithms.

***

### 11.5 Thread Termination

>If any thread within a process calls `exit`, `_Exit`, or `_exit`, then the entire process terminates. 
>
>Similarly, when the default action is to terminate the process, a signal sent to a thread will terminate the entire process 

- A single thread can exit in three ways, thereby stopping its flow of control, without terminating the entire process.
  - The thread can simply return from the start routine. The return value is the thread’s exit code.
  - The thread can be canceled by another thread in the same process.
  - The thread can call pthread_exit.

```c
#include <pthread.h>
void pthread_exit(void *rval_ptr);
```

- The **rval_ptr** argument is a typeless pointer, similar to the single argument passed to the start routine.
- This pointer is available to other threads in the process by calling the **`pthread_join`** function.

```c
#include <pthread.h>
int pthread_join(pthread_t thread, void **rval_ptr);
								   Returns: 0 if OK, error number on failure
```

- The calling thread will block until the specified thread calls **pthread_exit**, returns from its start routine, or is canceled. If the thread simply returned from its start routine, **rval_ptr** will contain the return code. 
- If the thread was canceled, the memory location specified by rval_ptr is set to PTHREAD_CANCELED.
- By calling pthread_join, we automatically place the thread with which we’re joining in the detached state (discussed shortly) so that its resources can be recovered. 
- If the thread was already in the detached state, pthread_join can fail, returning EINVAL, although this behavior is implementation-specific.
- If we’re not interested in a thread’s return value, we can set rval_ptr to NULL. In this case, calling pthread_join allows us to wait for the specified thread, but does not retrieve the thread’s termination status.

**Example**

Figure 11.3 shows how to fetch the exit code from a thread that has terminated.

```c
#include "apue.h"
#include <pthread.h>
void * thr_fn1(void *arg)
{
    printf("thread 1 returning\n");
    return((void *)1);
}
void * thr_fn2(void *arg)
{
    printf("thread 2 exiting\n");
	pthread_exit((void *)2);
}
int main(void)
{
    int err;
    pthread_t tid1, tid2;
    void *tret;
    err = pthread_create(&tid1, NULL, thr_fn1, NULL);
    if (err != 0)
    	err_exit(err, "can’t create thread 1");
    err = pthread_create(&tid2, NULL, thr_fn2, NULL);
    if (err != 0)
    	err_exit(err, "can’t create thread 2");
    err = pthread_join(tid1, &tret);
    if (err != 0)
    	err_exit(err, "can’t join with thread 1");
    printf("thread 1 exit code %ld\n", (long)tret);
    err = pthread_join(tid2, &tret);
    if (err != 0)
    	err_exit(err, "can’t join with thread 2");
    printf("thread 2 exit code %ld\n", (long)tret);
    exit(0);
}
```

***

The program in Figure 11.4 shows the problem with using an automatic variable (allocated on the stack) as the argument to pthread_exit.

```c
#include "apue.h"
#include <pthread.h>
struct foo {
	int a, b, c, d;
};
void printfoo(const char *s, const struct foo *fp)
{
    printf("%s", s);
    printf(" structure at 0x%lx\n", (unsigned long)fp);
    printf(" foo.a = %d\n", fp->a);
    printf(" foo.b = %d\n", fp->b);
    printf(" foo.c = %d\n", fp->c);
    printf(" foo.d = %d\n", fp->d);
}
void * thr_fn1(void *arg)
{
    struct foo foo = {1, 2, 3, 4};
    printfoo("thread 1:\n", &foo);
    pthread_exit((void *)&foo);
}
void * thr_fn2(void *arg)
{
    printf("thread 2: ID is %lu\n", (unsigned long)pthread_self());
    pthread_exit((void *)0);
}
int main(void)
{
    int err;
    pthread_t tid1, tid2;
    struct foo *fp;
    err = pthread_create(&tid1, NULL, thr_fn1, NULL);
    if (err != 0)
    	printf("can’t create thread 1");
    err = pthread_join(tid1, (void *)&fp);
    if (err != 0)
    	printf("can’t join with thread 1");
    sleep(1);
    
    printf("parent starting second thread\n");
    err = pthread_create(&tid2, NULL, thr_fn2, NULL);
    if (err != 0)
    	printf("can’t create thread 2");
    sleep(1);
    printfoo("parent:\n", fp);
    exit(0);
}
```

- 在编译的时候，需要链接静态库，lpthread
- 输出为：

```c
thread 1:
    structure at 0x7f2c83682ed0
    foo.a = 1
    foo.b = 2
    foo.c = 3
    foo.d = 4
parent starting second thread
thread 2: ID is 139829159933696
parent:
    structure at 0x7f2c83682ed0
    foo.a = -2090321472
    foo.b = 32556
    foo.c = 1
    foo.d = 0
```

- One thread can request that another in the same process be canceled by calling the **pthread_cancel** function.

```c
#include <pthread.h>
int pthread_cancel(pthread_t tid);
								    Returns: 0 if OK, error number on failure
```

- A thread can arrange for functions to be called when it exits.
  - The functions are known as thread ***cleanup handlers***.
  - More than one cleanup handler can be established for a thread. 
  - The handlers are recorded in a stack, which means that they are executed in the reverse order from that with which they were registered.

```c
#include <pthread.h>
void pthread_cleanup_push(void (*rtn)(void *), void *arg);
void pthread_cleanup_pop(int execute);
```

- The **pthread_cleanup_push** function schedules the cleanup function, rtn, to be called with the single argument, arg, when the thread performs one of the following actions:
  - Makes a call to ***pthread_exit***
  - Responds to a cancellation request
  - Makes a call to ***pthread_cleanup_pop*** with a nonzero execute argument
- If the ***execute*** argument is set to ***zero***, the cleanup function is not called. 
  - In either case, pthread_cleanup_pop removes the cleanup handler established by the last call to pthread_cleanup_push.
- A restriction with these functions is that, because they can be implemented as macros, they must be used in ***matched pairs within the same scope in a thread***. 

**Example**

```c
#include "apue.h"
#include <pthread.h>
void cleanup(void *arg)
{
	printf("cleanup: %s\n", (char *)arg);
}
void * thr_fn1(void *arg)
{
    printf("thread 1 start\n");
    pthread_cleanup_push(cleanup, "thread 1 first handler");
    pthread_cleanup_push(cleanup, "thread 1 second handler");
    printf("thread 1 push complete\n");
    if (arg)
    	return((void *)1);
    pthread_cleanup_pop(0);
    pthread_cleanup_pop(0);
    return((void *)1);
}
void * thr_fn2(void *arg)
{
    printf("thread 2 start\n");
    pthread_cleanup_push(cleanup, "thread 2 first handler");
    pthread_cleanup_push(cleanup, "thread 2 second handler");
    printf("thread 2 push complete\n");
    if (arg)
    	pthread_exit((void *)2);
    pthread_cleanup_pop(0);
    pthread_cleanup_pop(0);
    pthread_exit((void *)2);
}
int main(void)
{
    int err;
    pthread_t tid1, tid2;
    void *tret;
    err = pthread_create(&tid1, NULL, thr_fn1, (void *)1);
    if (err != 0)
    	printf("can’t create thread 1");
    err = pthread_create(&tid2, NULL, thr_fn2, (void *)1);
    if (err != 0)
    	printf("can’t create thread 2");
    err = pthread_join(tid1, &tret);
    if (err != 0)
    	prtinf("can’t join with thread 1");
    printf("thread 1 exit code %ld\n", (long)tret);
    err = pthread_join(tid2, &tret);
    if (err != 0)
    	printf("can’t join with thread 2");
    printf("thread 2 exit code %ld\n", (long)tret);
    exit(0);
}
```

output:

```
thread 1 start
thread 1 push complete
thread 2 start
thread 2 push complete
cleanup: thread 2 second handler
cleanup: thread 2 first handler
thread 1 exit code 1
thread 2 exit code 2
```

- Thus, if the thread ***terminates by returning*** from its start routine, its cleanup handlers are not called, although this behavior varies among implementations. 
- Also note that the cleanup handlers are called in the reverse order from which they were installed.

>In the Single UNIX Specification, ***returning while in between a matched pair*** of calls to pthread_cleanup_push and pthread_cleanup_pop results in **undefined behavior.** 
>
>The only portable way to return in between these two functions is to call **pthread_exit**.

![image-20201128103114866](C:\Users\13793\Desktop\学习笔记\操作系统概念\image-20201128103114866.png)

> Thread’s underlying storage can be reclaimed immediately on termination if the thread has been detached. 
>
> After a thread is detached, we can’t use the pthread_join function to wait for its termination status, because calling pthread_join for a detached thread results in undefined behavior. 
>
> We can detach a thread by calling **pthread_detach**.

```c
#include <pthread.h>
int pthread_detach(pthread_t tid);
								    Returns: 0 if OK, error number on failure
```

***

### **11.6 Thread Synchronization**

> When multiple threads of control share the same memory, we need to make sure that each thread sees a consistent view of its data. 

- To solve this problem, the threads have to use a lock that will allow only one thread to access the variable at a time. 
  - If it wants to read the variable, thread B acquires a lock. Similarly, when thread A updates the variable, it acquires the same lock. 
  - Thus thread B will be unable to read the variable until thread A releases the lock.

<img src="C:\Users\13793\Desktop\学习笔记\操作系统概念\b.png" style="zoom:50%;" />

>We also need to synchronize two or more threads that might try to modify the same variable at the same time. 
>
>Consider the case in which we increment a variable (Figure 11.9). 
>
>The increment operation is usually broken down into three steps.

- Read the memory location into a register.
- Increment the value in the register.
- Write the new value back to the memory location.

<img src="C:\Users\13793\Desktop\学习笔记\操作系统概念\Q$TO06SAVWH3B]}BGFZ1824.png" alt="img" style="zoom:50%;" />

**Mutexes**

> We can protect our data and ensure access by only one thread at a time by using the pthreads mutual-exclusion interfaces. 
>
> A mutex is basically a lock that we ***set (lock) before accessing a shared resource*** and ***release (unlock) when we’re done***. 
>
> If more than one thread is blocked when we unlock the mutex, then all threads blocked on the lock will be made runnable, and the first one to run will be able to set the lock. 
>
> The others will see that the mutex is still locked and go back to waiting for it to become available again.

- A mutex variable is represented by the **pthread_mutex_t** data type. 
- Before we can use a mutex variable, we must first initialize it by either setting it to the constant **PTHREAD_MUTEX_INITIALIZER** (for statically allocated mutexes only) or calling **pthread_mutex_init**. 
- If we allocate the mutex dynamically (by calling malloc, for example), then we need to call **pthread_mutex_destroy** before freeing the memory.

```c
#include <pthread.h>
int pthread_mutex_init(pthread_mutex_t *restrict mutex,
						const pthread_mutexattr_t *restrict attr);
int pthread_mutex_destroy(pthread_mutex_t *mutex);
							    Both return: 0 if OK, error number on failure
```

- To initialize a mutex with the default attributes, we set attr to NULL.

- To lock a mutex, we call **pthread_mutex_lock**. 
  - If the mutex is already locked, the calling thread will block until the mutex is unlocked. To unlock a mutex, we call **pthread_mutex_unlock**.

```c
#include <pthread.h>
int pthread_mutex_lock(pthread_mutex_t *mutex);
int pthread_mutex_trylock(pthread_mutex_t *mutex);
int pthread_mutex_unlock(pthread_mutex_t *mutex);
								 All return: 0 if OK, error number on failure
```

>If a thread can’t afford to block, it can use **pthread_mutex_trylock** to lock the mutex conditionally. 
>
>If the mutex is unlocked at the time pthread_mutex_trylock is called, then pthread_mutex_trylock will lock the mutex without blocking and return 0. 
>
>Otherwise, pthread_mutex_trylock will fail, returning EBUSY without locking the mutex.

**Example**

- Figure 11.10 illustrates a mutex used to protect a data structure. 
- When more than one thread needs to access a dynamically allocated object, we can embed a reference count in the object to ensure that we don’t free its memory before all threads are done using it.

```c
#include <stdlib.h>
#include <pthread.h>
struct foo {
    int f_count;
    pthread_mutex_t f_lock;
    int f_id;
	/* ... more stuff here ... */
};
struct foo * foo_alloc(int id) /* allocate the object */
{
    struct foo *fp;
    if ((fp = malloc(sizeof(struct foo))) != NULL) {
        fp->f_count = 1;
        fp->f_id = id;
        if (pthread_mutex_init(&fp->f_lock, NULL) != 0) {
            free(fp);
            return(NULL);
        }
        /* ... continue initialization ... */
    }
    return(fp);
}
void foo_hold(struct foo *fp) /* add a reference to the object */
{
    pthread_mutex_lock(&fp->f_lock);
    fp->f_count++;
    pthread_mutex_unlock(&fp->f_lock);
}
void foo_rele(struct foo *fp) /* release a reference to the object */
{
    pthread_mutex_lock(&fp->f_lock);
    if (--fp->f_count == 0) { /* last reference */
        pthread_mutex_unlock(&fp->f_lock);
        pthread_mutex_destroy(&fp->f_lock);
        free(fp);
    } 
    else {
    	pthread_mutex_unlock(&fp->f_lock);
    }
}
```

