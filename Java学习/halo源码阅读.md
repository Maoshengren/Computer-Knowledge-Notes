**问题**

`run.halo.app.exception.ThemeNotFoundException: Default theme: caicai_anatole was not found!`
`at run.halo.app.repository.ThemeRepositoryImpl.lambda$getActivatedThemeProperty$0(ThemeRepositoryImpl.java:86) ~[main/:na]`

- 问题是找不到default theme
- 打开对应的文件目录发现themes的目录为空
- 找到github上对应的目录发现需要下载另一个仓库的theme代码

![image-20210317110627161](C:\Users\13793\Desktop\学习笔记\Java学习\image-20210317110627161.png)

我以为放在工作目录的anatole下就可以解决这个问题，发现还是一样的报错。

终于解决了！

![image-20210317114004320](C:\Users\13793\Desktop\学习笔记\Java学习\image-20210317114004320.png)

我找到了这个函数，然后打断点调试，看看workdir到底在哪，终于找到了，不是在当前的工作目录下，而是在C盘用户里的.halo文件，里面/template/themes/anatole里面为空，所以找不到主题，现在从github把资源下载下来解压到那个文件夹，再次运行就成功了。

***

- 已经注册的账号重新登录时，触发了这个类

```java
public class BadRequestException extends AbstractHaloException {

    public BadRequestException(String message) {
        super(message);
    }

    public BadRequestException(String message, Throwable cause) {
        super(message, cause);
    }

    @Override
    public HttpStatus getStatus() {
        return HttpStatus.BAD_REQUEST;
    }
}

//看一下继承关系
public abstract class AbstractHaloException extends RuntimeException;

/*
RuntimeException is the superclass of those exceptions that can be thrown during the normal operation of the Java Virtual Machine.
RuntimeException and its subclasses are unchecked exceptions. Unchecked exceptions do not need to be declared in a method or constructor's throws clause if they can be thrown by the execution of the method or constructor and propagate outside the method or constructor boundary.
*/
public class RuntimeException extends Exception;

/*
The class Exception and its subclasses are a form of Throwable that indicates conditions that a reasonable application might want to catch.
The class Exception and any subclasses that are not also subclasses of RuntimeException are checked exceptions. Checked exceptions need to be declared in a method or constructor's throws clause if they can be thrown by the execution of the method or constructor and propagate outside the method or constructor boundary.
*/
public class Exception extends Throwable;

/*
	The Throwable class is the superclass of all errors and exceptions in the Java language. Only objects that are instances of this class (or one of its subclasses) are thrown by the Java Virtual Machine or can be thrown by the Java throw statement. Similarly, only this class or one of its subclasses can be the argument type in a catch clause. For the purposes of compile-time checking of exceptions, Throwable and any subclass of Throwable that is not also a subclass of either RuntimeException or Error are regarded as checked exceptions.
	Instances of two subclasses, Error and Exception, are conventionally used to indicate that exceptional situations have occurred. Typically, these instances are freshly created in the context of the exceptional situation so as to include relevant information (such as stack trace data).
	A throwable contains a snapshot of the execution stack of its thread at the time it was created. It can also contain a message string that gives more information about the error. Over time, a throwable can suppress other throwables from being propagated. Finally, the throwable can also contain a cause: another throwable that caused this throwable to be constructed. 
	A cause can be associated with a throwable in two ways: via a constructor that takes the cause as an argument, or via the initCause(Throwable) method. New throwable classes that wish to allow causes to be associated with them should provide constructors that take a cause and delegate (perhaps indirectly) to one of the Throwable constructors that takes a cause.
	By convention, class Throwable and its subclasses have two constructors, one that takes no arguments and one that takes a String argument that can be used to produce a detail message. Further, those subclasses that might likely have a cause associated with them should have two more constructors, one that takes a Throwable (the cause), and one that takes a String (the detail message) and a Throwable (the cause).
*/
public class Throwable implements Serializable;

//抛出异常的方法
public Throwable(String message) {
    fillInStackTrace();
    detailMessage = message;
}

//最顶层的父方法
public synchronized Throwable fillInStackTrace() {
    if (stackTrace != null ||
        backtrace != null /* Out of protocol state */ ) {
        fillInStackTrace(0);
        stackTrace = UNASSIGNED_STACK;
    }
    return this;
}

//打印异常信息
private void printStackTrace(PrintStreamOrWriter s) {
        // Guard against malicious overrides of Throwable.equals by
        // using a Set with identity equality semantics.
        Set<Throwable> dejaVu = Collections.newSetFromMap(new IdentityHashMap<>());
        dejaVu.add(this);

        synchronized (s.lock()) {
            // Print our stack trace
            s.println(this);
            StackTraceElement[] trace = getOurStackTrace();
            for (StackTraceElement traceElement : trace)
                s.println("\tat " + traceElement);

            // Print suppressed exceptions, if any
            for (Throwable se : getSuppressed())
                se.printEnclosedStackTrace(s, trace, SUPPRESSED_CAPTION, "\t", dejaVu);

            // Print cause, if any
            Throwable ourCause = getCause();
            if (ourCause != null)
                ourCause.printEnclosedStackTrace(s, trace, CAUSE_CAPTION, "", dejaVu);
        }
    }
```

- @NonNULL 作用

```java
@NonNULL
/**
 * Denotes that a parameter, field or method return value can never be null.
 * <p>
 * This is a marker annotation and it has no specific attributes.
 */
```



- Project Lombok is a java library that automatically plugs into your editor and build tools, spicing up your java.
- Never write another getter or equals method again, with one annotation your class has a fully featured builder, Automate your logging variables, and much more.

```java
public class Mountain{
    private String name;
    private double longitude;
    private String country;
}
```

- 要使用这个对象,必须还要写一些getter和setter方法,可能还要写一个构造器、equals方法、或者hash方法.这些方法很冗长而且没有技术含量,我们叫它**样板式代码**.
  lombok的主要作用是通过一些注解，消除样板式代码，像这样：

```text
@Data
public class Mountain{
    private String name;
    private double longitude;
    private String country;
}
```

然后可以看到这个类自动生成了这些方法

![img](https://pic1.zhimg.com/80/a2bed7a1f670361d93f1c51208d200fe_720w.jpg?source=1940ef5c)



常见的一些注解:

```java
val
Finally! Hassle-free final local variables.

var
Mutably! Hassle-free local variables.

@NonNull
or: How I learned to stop worrying and love the NullPointerException.

@Cleanup
Automatic resource management: Call your close() methods safely with no hassle.

@Getter/@Setter
Never write public int getFoo() {return foo;} again.

@ToString
No need to start a debugger to see your fields: Just let lombok generate a toString for you!

@EqualsAndHashCode
Equality made easy: Generates hashCode and equals implementations from the fields of your object..

@NoArgsConstructor, @RequiredArgsConstructor and @AllArgsConstructor
Constructors made to order: Generates constructors that take no arguments, one argument per final / non-nullfield, or one argument for every field.

@Data
All together now: A shortcut for @ToString, @EqualsAndHashCode, @Getter on all fields, and @Setter on all non-final fields, and @RequiredArgsConstructor!

@Value
Immutable classes made very easy.

@Builder
... and Bob's your uncle: No-hassle fancy-pants APIs for object creation!

@SneakyThrows
To boldly throw checked exceptions where no one has thrown them before!

@Synchronized
synchronized done right: Don't expose your locks.

@With
Immutable 'setters' - methods that create a clone but with one changed field.

@Getter(lazy=true)
Laziness is a virtue!

@Log
Captain's Log, stardate 24435.7: "What was that line again?"

experimental
Head to the lab: The new stuff we're working on.
```





