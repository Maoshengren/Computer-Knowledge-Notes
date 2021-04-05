### 3.2 Socket Address Structures

**IPv4 Socket Address Structure**

> An **`IPv4`** socket address structure, commonly called an "Internet socket address structure," is named **`sockaddr_in`** and is defined by including the <netinet/in.h> header.  

```c
struct in_addr {
    in_addr_t s_addr; /* 32-bit IPv4 address */
    				/* network byte ordered */
};
struct sockaddr_in {
    uint8_t sin_len; 			/* length of structure (16) */
    sa_family_t sin_family; 	/* AF_INET */
    //AF_INET is an address family that is used to designate the type of 	     //addresses that your socket can communicate with 
    in_port_t sin_port; 		/* 16-bit TCP or UDP port number */
    						  /* network byte ordered */
    struct in_addr sin_addr; 	/* 32-bit IPv4 address */
    						  /* network byte ordered */
    char sin_zero[8]; 		    /* unused */
};
```

- The four socket functions that pass a socket address structure from the process to the kernel, **bind**, **connect**, **sendto**, and **sendmsg**, all go through the **sockargs** function in a Berkeley-derived implementation (p. 452 of TCPv2). 

```c
The bind() function takes the following arguments:
socket
	Specifies the file descriptor of the socket to be bound.
address
	Points to a sockaddr structure containing the address to be bound to the 	 socket. The length and format of the address depend on the address family 	   of the socket.
address_len
	Specifies the length of the sockaddr structure pointed to by the address 	 argument.
```

- This function copies the socket address structure from the process and explicitly sets its **sin_len**
  member to the size of the structure that was passed as an argument to these four functions. 

- The five socket functions that pass a socket address structure from the kernel to the process, **accept**, **recvfrom**, **recvmsg**, **getpeername**, and **getsockname**, all set the **sin_len** member before returning to the process.

- Almost all implementations add the sin_zero member so that all socket address structures are at least 16 bytes in size.

- The **in_addr_t** datatype must be an unsigned integer type of at least 32 bits, **in_port_t** must be an unsigned integer type of at least 16 bits, and **sa_family_t** can be any unsigned integer type. 

![image-20210318103803784](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210318103803784.png)

***

**Generic Socket Address Structure**

> A socket address structures is always passed by **reference** when passed as an argument to any socket functions. 
>
> But any socket function that takes one of these pointers as an argument must deal with socket address structures from any of the supported protocol families.

- A problem arises in how to declare the type of pointer that is passed. With ANSI C, the solution is simple: void * is the generic pointer type. 
- But, the socket functions predate ANSI C and the solution chosen in 1982 was to define a generic socket address structure in the <sys/socket.h> header.

````c
struct sockaddr {
    uint8_t sa_len;
    sa_family_t sa_family; 	 /* address family: AF_xxx value */
    char sa_data[14]; 		/* protocol-specific address */
};
````

- The socket functions are then defined as taking a pointer to the generic socket address structure, as shown here in the ANSI C function prototype for the bind function:

```c
int bind(int, struct sockaddr *, socklen_t);
```

This requires that any calls to these functions must cast the pointer to the protocol-specific
socket address structure to be a pointer to a generic socket address structure. For
example,

```c
struct sockaddr_in serv; /* IPv4 socket address structure */
/* fill in serv{} */
bind(sockfd, (struct sockaddr *) &serv, sizeof(serv));
```

**IPv6 Socket Address Structure**

> The IPv6 socket address is defined by including the <netinet/in.h> header

```c
struct in6_addr {
    uint8_t s6_addr[16];  		/* 128-bit IPv6 address */
    						  /* network byte ordered */
};
#define SIN6_LEN /* required for compile-time tests */
struct sockaddr_in6 {
    uint8_t sin6_len; 			/* length of this struct (28) */
    sa_family_t sin6_family; 	/* AF_INET6 */
    in_port_t sin6_port; 		/* transport layer port# */
    /* network byte ordered */
    uint32_t sin6_flowinfo; 	/* flow information, undefined */
    struct in6_addr sin6_addr; 	/* IPv6 address */
    /* network byte ordered */
    uint32_t sin6_scope_id; 	/* set of interfaces for a scope */
};
```

- The extensions to the sockets API for IPv6 are defined in **RFC 3493** 

- The **SIN6_LEN** constant must be defined if the system supports the length member for socket address structures.
- The IPv6 family is **AF_INET6**, whereas the IPv4 family is AF_INET.
- The members in this structure are ordered so that if the sockaddr_in6 structure is 64-bit aligned, so is the 128-bit sin6_addr member. On some 64-bit processors, data accesses of 64-bit values are optimized if stored on a 64-bit boundary.
- The **sin6_flowinfo** member is divided into two fields:
  - The low-order 20 bits are the flow label
  - The high-order 12 bits are reserved.

- The **sin6_scope_id** identifies the scope zone in which a scoped address is meaningful, most commonly an interface index for a link-local address.

**New Generic Socket Address Structure**

> A new generic socket address structure was defined as part of the IPv6 sockets API, to overcome some of the shortcomings of the existing **struct sockaddr**. 
>
> Unlike the struct sockaddr, the new struct **sockaddr_storage** is large enough to hold any socket address type supported by the system. 

```c
struct sockaddr_storage {
    uint8_t ss_len; /* length of this struct (implementation dependent) */
    sa_family_t ss_family; /* address family: AF_xxx value */
    /* implementation-dependent elements to provide:
     * a) alignment sufficient to fulfill the alignment requirements of
     * all socket address types that the system supports.
     * b) enough storage to hold any type of socket address that the
     * system supports.
     */
};
```

![image-20210318220813086](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210318220813086.png)

***

### 3.3 Value-Result Arguments

> We mentioned that when a socket address structure is passed to any socket function, it is always passed by reference.
>
> But the way in which the length is passed depends on which direction the structure is being passed: from the process to the kernel, or vice versa.

***

### 3.4 Byte Ordering Functions

> We refer to the byte ordering used by a given system as the host byte order. 
>
> The program shown prints the host byte order. 

````c
int
main(int argc, char **argv)
{
	union {
	  short  s;
      char   c[sizeof(short)];
    } un;

	un.s = 0x0102;
	printf("%s: ", CPU_VENDOR_OS);
	if (sizeof(short) == 2) {
		if (un.c[0] == 1 && un.c[1] == 2)
			printf("big-endian\n");
		else if (un.c[0] == 2 && un.c[1] == 1)
			printf("little-endian\n");
		else
			printf("unknown\n");
	} else
		printf("sizeof(short) = %d\n", sizeof(short));

	exit(0);
}
````

- The string CPU_VENDOR_OS is determined by the GNU autoconf program when the software in this book is configured, and it identifies the CPU type, vendor, and OS release.

***

### 3.5 Byte Manipulation Functions

- **bzero** sets the specified number of bytes to 0 in the destination. We often use this function to initialize a socket address structure to 0. 
- **bcopy** moves the specified number of bytes from the source to the destination. 
- **bcmp** compares two arbitrary byte strings. 

![image-20210319090114329](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210319090114329.png)

![image-20210319090147749](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210319090147749.png)

- **memset** sets the specified number of bytes to the value **c** in the destination. 
- **memcpy** is similar to bcopy, but the order of the two pointer arguments is swapped. 
  - **bcopy** correctly handles overlapping fields, while the behavior of memcpy is undefined if the source and destination overlap. 
  - The ANSI C **memmove** function must be used when the fields overlap.

- **memcmp** compares two arbitrary byte strings and returns 0 if they are identical. 
  - The comparison is done assuming the two unequal bytes are unsigned chars.

***

### 3.6 inet_aton, inet_addr, and inet_ntoa Functions

>We will describe two groups of address conversion functions in this section and the next.
>
>They convert Internet addresses between ASCII strings (what humans prefer to use) and network byte ordered binary values (values that are stored in socket address structures).

- **`inet_aton`, `inet_ntoa`, and `inet_addr`** convert an IPv4 address from a dotted-decimal string (e.g., "206.168.112.96") to its 32-bit network byte ordered binary value. 

- The newer functions, **inet_pton** and **inet_ntop**, handle both IPv4 and IPv6 addresses. 

![image-20210319090638682](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210319090638682.png)

- An undocumented feature of **inet_aton** is that if addrptr is a null pointer, the function still performs its validation of the input string but does not store any result.

***

### 3.7 `inet_pton` and `inet_ntop` Functions

>These two functions are new with IPv6 and work with both IPv4 and IPv6 addresses. We use these two functions throughout the text. 
>
>The letters "p" and "n" stand for **presentation** and **numeric**. 
>
>The presentation format for an address is often an ASCII string and the numeric format is the binary value that goes into a socket address structure.

![image-20210319091846669](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210319091846669.png)

- The **family** argument for both functions is either AF_INET or AF_INET6. 
  - If family is not supported, both functions return an error with errno set to EAFNOSUPPORT.

- The first function tries to convert the string pointed to by strptr, storing the binary result through the pointer addrptr. 
- **inet_ntop** does the reverse conversion, from numeric (addrptr) to presentation (strptr).
  - The len argument is the size of the destination, to prevent the function from overflowing the caller's buffer. 

- To help specify this size, the following two definitions are defined by including the <netinet/in.h> header:

```c
#define INET_ADDRSTRLEN 16 	/* for IPv4 dotted-decimal */
#define INET6_ADDRSTRLEN 46 /* for IPv6 hex string */
```

A simple version of the two functions

```c
const char *
inet_ntop(int family, const void *addrptr, char *strptr, size_t len)
{
	const u_char *p = (const u_char *) addrptr;

	if (family == AF_INET) {
		char	temp[INET_ADDRSTRLEN];

		snprintf(temp, sizeof(temp), "%d.%d.%d.%d",
				 p[0], p[1], p[2], p[3]);
		if (strlen(temp) >= len) {
			errno = ENOSPC;
			return (NULL);
		}
		strcpy(strptr, temp);
		return (strptr);
	}
	errno = EAFNOSUPPORT;
	return (NULL);
}

int
inet_pton(int family, const char *strptr, void *addrptr)
{
    if (family == AF_INET) {
    	struct in_addr  in_val;

        if (inet_aton(strptr, &in_val)) {
            memcpy(addrptr, &in_val, sizeof(struct in_addr));
            return (1);
        }
		return(0);
    }
	errno = EAFNOSUPPORT;
    return (-1);
}
```

***

### 3.8 `sock_ntop` and Related Functions

>A basic problem with inet_ntop is that it requires the caller to pass a pointer to a binary address. This address is normally contained in a socket address structure, requiring the caller to know the format of the structure and the address family. That is, to use it, we must write code of the form
>
>````c
>struct sockaddr_in addr;
>inet_ntop(AF_INET, &addr.sin_addr, str, sizeof(str));
>````

- This makes our code protocol-dependent. 

- To solve this, we will write our own function named sock_ntop that takes a pointer to a socket address structure, looks inside the structure, and calls the appropriate function to return the presentation format of the address.

![image-20210319093343529](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210319093343529.png)

***

### 3.9 `readn`, `writen`, and `readline` Functions

![image-20210320091259586](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320091259586.png)

```c
ssize_t						/* Read "n" bytes from a descriptor. */
readn(int fd, void *vptr, size_t n)
{
	size_t	nleft;
	ssize_t	nread;
	char	*ptr;

	ptr = vptr;
	nleft = n;
	while (nleft > 0) {
		if ( (nread = read(fd, ptr, nleft)) < 0) {
			if (errno == EINTR)
				nread = 0;		/* and call read() again */
			else
				return(-1);
		} else if (nread == 0)
			break;				/* EOF */

		nleft -= nread;
		ptr   += nread;
	}
	return(n - nleft);		/* return >= 0 */
}
/* end readn */

ssize_t
Readn(int fd, void *ptr, size_t nbytes)
{
	ssize_t		n;

	if ( (n = readn(fd, ptr, nbytes)) < 0)
		err_sys("readn error");
	return(n);
}
```

***

## 4. Elementary TCP Sockets

<img src="C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320100509803.png" alt="image-20210320100509803" style="zoom:50%;" />

### 4.2 `socket` Function

>To perform network I/O, the first thing a process must do is call the socket function, specifying the type of communication protocol desired 

![image-20210320101156626](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320101156626.png)

<img src="C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320101223253.png" alt="image-20210320101223253" style="zoom:67%;" />

**type** of socket for `socket` function

<img src="C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320101308506.png" alt="image-20210320101308506" style="zoom: 67%;" />

**protocol** of sockets for `AF_INET` or `AF_INET6`

<img src="C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320101340909.png" alt="image-20210320101340909" style="zoom:67%;" />

- On success, the socket function returns a small non-negative integer value, similar to a file descriptor. We call this a socket descriptor, or a sockfd. 
- To obtain this socket descriptor, all we have specified is a protocol family (IPv4, IPv6, or Unix) and the socket type (stream, datagram, or raw). 

**`AF_xxx` Versus `PF_xxx`**

- The "AF_" prefix stands for "address family" and the "PF_" prefix stands for "protocol family." 

***

### 4.3 `connect` Function

> The connect function is used by a TCP client to establish a connection with a TCP server.

![image-20210320103937575](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320103937575.png)

- `sockfd` is a socket descriptor returned by the socket function. 
- The second and third arguments are a pointer to a socket address structure and its size

- The client does not have to call bind (which we will describe in the next section) before calling connect: the kernel will **choose both an ephemeral port and the source IP address** if necessary.

***

- In the case of a TCP socket, the connect function initiates TCP's three-way handshake
- The function returns only when the connection is established or an error occurs. 
- There are several different error returns possible.
  - If the client TCP receives no response to its SYN segment, **`ETIMEDOUT`** is returned.
  - If the server's response to the client's SYN is a reset (RST), this indicates that no process is waiting for connections on the server host at the port specified.(i.e., the server process is probably not running)
    - This is a hard error and the error **`ECONNREFUSED`** is returned to the client as soon as the RST is received
  - If the client's SYN elicits an ICMP "destination unreachable" from some intermediate router, this is considered a soft error. 
    - The client kernel saves the message but keeps sending SYNs with the same time between each SYN as in the first scenario. 
    - If no response is received after some fixed amount of time (75 seconds for 4.4BSD), the saved ICMP error is returned to the process as either `EHOSTUNREACH` or `ENETUNREACH`.

***

### 4.4 `bind` Function

>The `bind` function assigns a local protocol address to a socket. 
>
>With the Internet protocols, the protocol address is the combination of either a 32-bit IPv4 address or a 128-bit IPv6 address, along with a 16-bit TCP or UDP port number.

![image-20210320110525929](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320110525929.png)

- The bind function has nothing to do with names. 
- bind assigns a protocol address to a socket, and what that protocol address means depends on the protocol.

- The second argument is a pointer to a protocol-specific address, and the third argument is the size of this address structure. 
- With TCP, calling bind lets us specify a port number, an IP address, both, or neither.

***

- Servers `bind` their well-known port when they start. 
  - If a TCP client or server does not do this, the kernel chooses an ephemeral port for the socket when either connect or listen is called. 
  - It is normal for a TCP client to let the kernel choose an ephemeral port, unless the application requires a reserved port 
  - But it is rare for a TCP server to let the kernel choose an ephemeral port, since servers are known by their well-known port.

- A process can `bind` a specific IP address to its socket. 
  - The IP address must belong to an interface on the host. 
  - For a TCP client, this assigns the source IP address that will be used for IP datagrams sent on the socket. 
  - For a TCP server, this restricts the socket to receive incoming client connections destined only to that IP address.
  - Normally, a **TCP client** does **not bind an IP address to its socket**. 
    - The kernel chooses the source IP address when the socket is connected, based on the outgoing interface that is used, which in turn is based on the route required to reach the server 
  - If a **TCP server** does not bind an IP address to its socket, the kernel uses the destination IP address of the client's SYN as the server's source IP address 

- If we specify a port number of **0**, the kernel chooses an ephemeral port when bind is called. 

  - But if we specify a **wildcard IP address**, the kernel does not choose the local IP address until either the socket is connected (TCP) or a datagram is sent on the socket (UDP).
  - With IPv4, the wildcard address is specified by the constant **`INADDR_ANY`**, whose value is normally 0. 

  ````c
  struct sockaddr_in servaddr;
  servaddr.sin_addr.s_addr = htonl (INADDR_ANY); /* wildcard */
  ````

- While this works with IPv4, where an IP address is **a 32-bit value that can be represented as a simple numeric constant** (0 in this case),

  - We cannot use this technique with IPv6, since the 128-bit IPv6 address is stored in a structure. (In C we cannot represent a constant structure on the right-hand side of an assignment.) 
  - To solve this problem, we write

  ```c
  struct sockaddr_in6 serv;
  serv.sin6_addr = in6addr_any; /* wildcard */
  ```

- If we tell the kernel to choose an ephemeral port number for our socket, notice that bind does not return the chosen value. 
  - Indeed, it cannot return this value since the second argument to bind has the const qualifier. 
  - To obtain the value of the ephemeral port assigned by the kernel, we must call **`getsockname`** to return the protocol address.

****

### 4.5 `listen` Function

- The listen function is called only by a TCP server and it performs two actions:
  - When a socket is created by the socket function, it is assumed to be an active socket, that is, a client socket that will issue a connect. 
    - The **`listen`** function converts an **unconnected socket** into a **passive socket**, indicating that the kernel should accept incoming connection requests directed to this socket. 
  - The second argument to this function specifies **the maximum number** of connections the kernel should **queue** for this socket.

![image-20210320122358331](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320122358331.png)

>This function is normally called after both the **`socket`** and **`bind`** functions and must be called before calling the **`accept`** function.

- To understand the backlog argument, we must realize that for a given listening socket, the kernel maintains two queues:
  - An incomplete connection queue, which contains an entry for each SYN that has arrived from a client for which the server is awaiting completion of the TCP three-way handshake. 
  - A completed connection queue, which contains an entry for each client with whom the TCP three-way handshake has completed. 

<img src="C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320140412988.png" alt="image-20210320140412988" style="zoom:67%;" />

- The **`backlog`** argument to the listen function has historically specified the **maximum value** for the sum of both queues.

- Data that arrives after the three-way handshake completes, but before the server calls **`accept`**, should be queued by the server TCP, up to the size of the connected socket's receive buffer.

***

### 4.6 `accept` Function

>`accept` is called by a TCP server to return the next completed connection from the front of the completed connection queue.

![image-20210320143214817](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320143214817.png)

- The **`cliaddr`** and **`addrlen`** arguments are used to return the protocol address of the connected peer process (the client). 
  - Before the call, we set the integer value referenced by **`*addrlen`** to the size of the socket address structure pointed to by **`cliaddr`**; 
  - On return, this integer value contains the actual number of bytes stored by the kernel in the socket address structure.

- If accept is successful, its return value is a brand-new **descriptor** automatically created by the kernel. 
  - This new descriptor refers to the TCP connection with the client. 
  - When discussing accept, we call the first argument to `accept` the **listening socket** .
  - and we call the return value from `accept` the **connected socket**. 

***

### 4.7 `fork` and `exec` Functions

>Before describing how to write a concurrent server in the next section, we must describe the Unix fork function. This function (including the variants of it provided by some systems) is the only way in Unix to create a new process.

![image-20210320145726907](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320145726907.png)

- The reason fork returns 0 in the child, instead of the parent's process ID, is because a child has only one parent and it can always obtain the parent's process ID by calling **`getppid`**. 
  - A parent, on the other hand, can have any number of children, and there is **no way** to obtain the process IDs of its children. 
  - If a parent wants to keep track of the process IDs of all its children, it must record the return values from **`fork`**.

**There are two typical uses of `fork`:**

- A process makes a copy of itself so that one copy can handle one operation while the other copy does another task. This is typical for network servers. 

- A process wants to execute another program. 
  - Since the only way to create a new process is by calling fork, the process first calls fork to make a copy of itself,
  - and then one of the copies (typically the child process) calls **`exec`** to replace itself with the new program.  This is typical for programs such as shells.
- **`exec`** replaces the current process image with the new program file, and this new program normally starts at the **`main`** function. 
- The process ID does not change. We refer to the process that calls exec as the **`calling process`** and the newly executed program as the **`new program`**.

![image-20210320150412831](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320150412831.png)

- The differences in the six **`exec`** functions are: 
  - whether the program file to execute is specified by a **`filename`** or a **`pathname`**
  - whether the arguments to the new program are **listed one by one** or referenced through an **array of pointers**
  - whether the environment of the calling process is **passed** to the new program or whether a new environment is **specified**.

- Normally, only **`execve`** is a system call within the kernel and the other five are library functions that call execve.

<img src="C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320150641400.png" alt="image-20210320150641400" style="zoom:67%;" />

***

### 4.8 Concurrent Servers

>When a client request can take longer to service, we do not want to tie up a single server with one client;
>
>we want to handle multiple clients at the same time. The simplest way to write a concurrent server under Unix is to **`fork`** a child process to handle each client.

```c
pid_t pid;
int listenfd, connfd;
listenfd = Socket( ... );
/* fill in sockaddr_in{} with server's well-known port */
Bind(listenfd, ... );
Listen(listenfd, LISTENQ);
for ( ; ; ) {
    connfd = Accept (listenfd, ... ); /* probably blocks */
    if( (pid = Fork()) == 0) {
        Close(listenfd); /* child closes listening socket */
        doit(connfd); /* process the request */
        Close(connfd); /* done with this client */
        exit(0); /* child terminates */
    }
    Close(connfd); /* parent closes connected socket */
}
```

- When a connection is established, **`accept`** returns, the server calls **`fork`**, and the child process services the client (on **`connfd`**, the connected socket) and the parent process waits for another connection (on listenfd, the listening socket). 
- The parent closes the connected socket since the child handles the new client.

***

### 4.9 `close` Function

>The normal Unix **`close`** function is also used to close a socket and terminate a TCP connection.

![image-20210320151748971](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320151748971.png)

- The default action of close with a TCP socket is to mark the socket as closed and return to the process immediately. 
- The socket descriptor is no longer usable by the process: It cannot be used as an argument to read or write. 
- But, TCP will try to **send any data that is already queued** to be sent to the other end, and after this occurs, the normal TCP connection termination sequence takes place.

**Descriptor Reference Counts**

- When the parent process in our concurrent server closes the connected socket, this just **decrements the reference count** for the descriptor. 
- Since the reference count was still greater than 0, this call to close did not initiate TCP's four-packet connection termination sequence. 
- This is the behavior we want with our concurrent server with the connected socket that is shared between the parent and child.

We must also be aware of what happens in our concurrent server if the parent does not call close for each connected socket returned by accept. 

- First, the parent will eventually **run out of descriptors**, as there is usually a limit to the number of descriptors that any process can have open at any time. 
- But more importantly, none of the client connections will be terminated. When the child closes the connected socket, its reference count will go from 2 to 1 and it will remain at 1 since the parent never closes the connected socket.
- This will prevent TCP's connection termination sequence from occurring, and the connection will remain open.

***

### 4.10 `getsockname` and `getpeername` Functions

>These two functions return either the local protocol address associated with a socket ( **`getsockname`**) or the foreign protocol address associated with a socket (**`getpeername`**).

![image-20210320152302390](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210320152302390.png)

- These two functions are required for the following reasons:
  - After **`connect`** successfully returns in a TCP client that does not call bind, **`getsockname`** returns the local **IP address** and local **port number** assigned to the connection by the kernel.
  - After calling **`bind`** with a port number of 0 (telling the kernel to choose the local port number), **`getsockname`** returns the local port number that was assigned.
  - When a server is **`exec`**ed by the process that calls **`accept`**, the only way the server can obtain the identity of the client is to call **`getpeername`**.

***

## 5. TCP Client/Server Example

### 5.2 TCP Echo Server: `main` Function

```c
#define	SA	struct sockaddr

int
main(int argc, char **argv)
{
	int					listenfd, connfd;
	pid_t				childpid;
	socklen_t			 clilen;
	struct sockaddr_in	  cliaddr, servaddr;

	listenfd = Socket(AF_INET, SOCK_STREAM, 0);

	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family      = AF_INET;
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servaddr.sin_port        = htons(SERV_PORT);

	Bind(listenfd, (SA *) &servaddr, sizeof(servaddr));

	Listen(listenfd, LISTENQ);

	for ( ; ; ) {
		clilen = sizeof(cliaddr);
		connfd = Accept(listenfd, (SA *) &cliaddr, &clilen);

		if ( (childpid = Fork()) == 0) {	/* child process */
			Close(listenfd);	/* close listening socket */
			str_echo(connfd);	/* process the request */
			exit(0);
		}
		Close(connfd);			/* parent closes connected socket */
	}
}
```

***

### 5.3 TCP Echo Server: `str_echo` Function

```c
void
str_echo(int sockfd)
{
	ssize_t			n;
	struct args		args;
	struct result	result;

	for ( ; ; ) {
		if ( (n = Readn(sockfd, &args, sizeof(args))) == 0)
			return;		/* connection closed by other end */

		result.sum = args.arg1 + args.arg2;
		Writen(sockfd, &result, sizeof(result));
	}
}
```

***

### 5.4 TCP Echo Client: `main` Function

```c
int
main(int argc, char **argv)
{
	int					sockfd;
	struct sockaddr_in	servaddr;

	if (argc != 2)
		err_quit("usage: tcpcli <IPaddress>");

	sockfd = Socket(AF_INET, SOCK_STREAM, 0);

	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(SERV_PORT);
	Inet_pton(AF_INET, argv[1], &servaddr.sin_addr);

	Connect(sockfd, (SA *) &servaddr, sizeof(servaddr));

	str_cli(stdin, sockfd);		/* do it all */

	exit(0);
}
```

***

### 5.5 TCP Echo Client: `str_cli` Function

```c
void
str_cli(FILE *fp, int sockfd)
{
	char			sendline[MAXLINE];
	struct args		args;
	struct result	result;

	while (Fgets(sendline, MAXLINE, fp) != NULL) {

		if (sscanf(sendline, "%ld%ld", &args.arg1, &args.arg2) != 2) {
			printf("invalid input: %s", sendline);
			continue;
		}
		Writen(sockfd, &args, sizeof(args));

		if (Readn(sockfd, &result, sizeof(result)) == 0)
			err_quit("str_cli: server terminated prematurely");

		printf("%ld\n", result.sum);
	}
}
```

***

### 5.8 POSIX Signal Handling

> A signal is a **notification** to a process that an event has occurred. Signals are sometimes called **`software interrupts`**. 
>
> Signals usually occur asynchronously. By this we mean that a process doesn't know ahead of time exactly when a signal will occur.

- Signals can be sent
  - By one process to another process (or to itself)
  - By the kernel to a process

- Every signal has a **disposition**, which is also called the action associated with the signal.
  - We set the disposition of a signal by calling the **`sigaction`** function
  - We can provide a function that is called whenever a specific signal occurs. This function is called a **signal handler** and this action is called catching a signal. The two signals **`SIGKILL`** and **`SIGSTOP`** cannot be caught. 
  - We can ignore a signal by setting its disposition to **`SIG_IGN`**. The two signals SIGKILL and SIGSTOP cannot be ignored.
  - We can set the default disposition for a signal by setting its disposition to **`SIG_DFL`**.

```c
//The normal function prototype for signal is complicated by the level of nested parentheses.
void (*signal (int signo, void (*func) (int))) (int);

//To simplify this, we define the Sigfunc type in our unp.h header as
typedef void Sigfunc(int);

Sigfunc *
signal(int signo, Sigfunc *func)
{
	struct sigaction	act, oact;

	act.sa_handler = func;
	sigemptyset(&act.sa_mask);
	act.sa_flags = 0;
	if (signo == SIGALRM) {
#ifdef	SA_INTERRUPT
		act.sa_flags |= SA_INTERRUPT;	/* SunOS 4.x */
#endif
	} else {
#ifdef	SA_RESTART
		act.sa_flags |= SA_RESTART;		/* SVR4, 44BSD */
#endif
	}
	if (sigaction(signo, &act, &oact) < 0)
		return(SIG_ERR);
	return(oact.sa_handler);
}
/* end signal */

Sigfunc *
Signal(int signo, Sigfunc *func)	/* for our signal() function */
{
	Sigfunc	*sigfunc;

	if ( (sigfunc = signal(signo, func)) == SIG_ERR)
		err_sys("signal error");
	return(sigfunc);
}
```

- 

- **`SA_RESTART`** is an optional flag. When the flag is set, a system call interrupted by this signal will be automatically restarted by the kernel. 

***

### 5.9 Handling `SIGCHLD` Signals

>The purpose of the zombie state is to maintain information about the child for the parent to fetch at some later time. 
>
>This information includes the process ID of the child, its termination status, and information on the resource utilization of the child

- If a process terminates, and that process has children in the zombie state, the parent process ID of all the zombie children is set to 1 (the init process), which will inherit the children and clean them up 

**Handling Zombies**

- Obviously we do not want to leave zombies around. They take up space in the kernel and eventually we can run out of processes. 
- Whenever we `fork` children, we must wait for them to prevent them from becoming zombies. 
  - To do this, we establish a signal handler to catch **`SIGCHLD`**, and within the handler, we call wait. 

```c
void
sig_chld(int signo)
{
	pid_t	pid;
	int		stat;

	pid = wait(&stat);
	printf("child %d terminated\n", pid);
	return;
}
```

- The purpose of this example is to show that when writing network programs that catch signals, we must be **cognizant of interrupted system calls**, and we must handle them. 
- In this specific example, running under Solaris 9, the signal function provided in the standard C library does not cause an interrupted system call to be automatically restarted by the kernel. 

***

**Handling Interrupted System Calls**

>We used the term "**slow system call**" to describe **`accept`**, and we use this term for any system call that can block forever. That is, the system call need never return. Most networking functions fall into this category. 

- To handle an interrupted **`accept`**, we change the call to accept in Figure 5.2, the beginning of the for loop, to the following: 

```c
for ( ; ; ) {
    clilen = sizeof (cliaddr);
    if ( (connfd = accept (listenfd, (SA *) &cliaddr, &clilen)) < 0) {
        if (errno == EINTR)
        	continue; /* back to for () */
        else
        	err_sys ("accept error");
}
```

- Notice that we call **`accept`** and not our wrapper function **`Accept`**, since we must handle the failure of the function ourselves.

- There is one function that we cannot restart: **`connect`**. If this function returns EINTR, we cannot call
  it again, as doing so will return an immediate error. 
  - When connect is interrupted by a caught signal and is not automatically restarted, we must call **`select`** to wait for the connection to complete. as we will describe in Section 16.3.

***

### 5.10 `wait` and `waitpid` Functions

![image-20210322090122227](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210322090122227.png)

- **`wait`** and **`waitpid`** both return two values: 
  - the return value of the function is the **process ID** of the terminated child
  - and the **termination status** of the child (an integer) is returned through the **`statloc`** pointer. 
- If there are no terminated children for the process calling wait, but the process has one or more children that are still executing, then **`wait`** blocks until the first of the existing children terminates.

- **`waitpid`** gives us more control over which process to wait for and whether or not to block.
  - First, the **`pid`** argument lets us specify the process ID that we want to wait for.
  - A value of -1 says to wait for the first of our children to terminate. 
  - The options argument lets us specify additional options. The most common option is **`WNOHANG`**. This option tells the kernel not to block if there are no terminated children.

**Difference between `wait` and `waitpid`**

> We now illustrate the difference between the wait and waitpid functions when used to clean up terminated children. To do this, we modify our TCP client as shown in Figure 5.9. The client establishes five connections with the server and then uses only the first one (sockfd[0]) in the call to str_cli. The purpose of establishing multiple connections is to **spawn multiple children** from the concurrent server.

```c
int
main(int argc, char **argv)
{
	int					i, sockfd[5];
	struct sockaddr_in	servaddr;

	if (argc != 2)
		err_quit("usage: tcpcli <IPaddress>");

	for (i = 0; i < 5; i++) {
		sockfd[i] = Socket(AF_INET, SOCK_STREAM, 0);

		bzero(&servaddr, sizeof(servaddr));
		servaddr.sin_family = AF_INET;
		servaddr.sin_port = htons(SERV_PORT);
		Inet_pton(AF_INET, argv[1], &servaddr.sin_addr);

		Connect(sockfd[i], (SA *) &servaddr, sizeof(servaddr));
	}

	str_cli(stdin, sockfd[0]);		/* do it all */

	exit(0);
}
```

- When the client terminates, all open descriptors are closed automatically by the kernel (we do not call close, only exit), and all five connections are terminated at about the same time. 
- This causes five FINs to be sent, one on each connection, which in turn causes all five server children to terminate at about the same time. 
- This causes five **`SIGCHLD`** signals to be delivered to the parent at about the same time

- Establishing a signal handler and calling **`wait`** from that handler are insufficient for preventing zombies. 
  - The problem is that all five signals are generated before the signal handler is executed, and the signal handler is executed only one time because Unix signals are normally not queued. Furthermore, this problem is nondeterministic. 
- The correct solution is to call **`waitpid`** instead of wait. 
  - This version works because we call waitpid within a loop, fetching the status of any of our children that have terminated. 
  - We must specify the **`WNOHANG`** option: This tells waitpid not to block if there are running children that have not yet terminated.

```c
void
sig_chld(int signo)
{
	pid_t	pid;
	int		stat;

	while ( (pid = waitpid(-1, &stat, WNOHANG)) > 0)
		printf("child %d terminated\n", pid);
	return;
}

//tcpcliserv/tcpserv04.c
int
main(int argc, char **argv)
{
	int					listenfd, connfd;
	pid_t				childpid;
	socklen_t			 clilen;
	struct sockaddr_in	cliaddr, servaddr;
	void				sig_chld(int);

	listenfd = Socket(AF_INET, SOCK_STREAM, 0);

	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family      = AF_INET;
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servaddr.sin_port        = htons(SERV_PORT);

	Bind(listenfd, (SA *) &servaddr, sizeof(servaddr));

	Listen(listenfd, LISTENQ);

	Signal(SIGCHLD, sig_chld);	/* must call waitpid() */

	for ( ; ; ) {
		clilen = sizeof(cliaddr);
		if ( (connfd = accept(listenfd, (SA *) &cliaddr, &clilen)) < 0) {
			if (errno == EINTR)
				continue;		/* back to for() */
			else
				err_sys("accept error");
		}

		if ( (childpid = Fork()) == 0) {	/* child process */
			Close(listenfd);	/* close listening socket */
			str_echo(connfd);	/* process the request */
			exit(0);
		}
		Close(connfd);			/* parent closes connected socket */
	}
}
```

***

### 5.11 Connection Abort before `accept` Returns

>There is another condition similar to the interrupted system call example in the previous section that can cause **`accept`** to return a nonfatal error, in which case we should just call accept again. 
>
>The sequence of packets shown in Figure 5.13 has been seen on busy servers (typically busy Web servers).

<img src="C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210322092237095.png" alt="image-20210322092237095" style="zoom:50%;" />

- Here, the three-way handshake completes, the connection is established, and then the client TCP sends an RST (reset). On the server side, the connection is queued by its TCP, waiting for the server process to call `accept` when the RST arrives. Sometime later, the server process calls accept.

***

### 5.12 Termination of Server Process

>We will now start our client/server and then kill the server child process. This simulates the crashing of the server process, so we can see what happens to the client. 

1. We start the server and client and type one line to the client to verify that all is okay. That line is echoed normally by the server child.
2. We find the process ID of the server child and kill it. As part of process termination, all open descriptors in the child are closed. 
   - This causes a **`FIN`** to be sent to the client, and the client TCP responds with an **`ACK`**. This is the first half of the TCP connection termination.
3. The **`SIGCHLD`** signal is sent to the server parent and handled correctly (Figure 5.12).
4. Nothing happens at the client. The client TCP receives the FIN from the server TCP and responds with an ACK, but the problem is that the client process is blocked in the call to **`fgets`** waiting for a line from the terminal.
5. Running **`netstat`** at this point shows the state of the sockets.

![image-20210322093802123](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210322093802123.png)

- We can still type a line of input to the client. Here is what happens at the client starting from Step 1:

`another line 							//we then type a second line to the client
str_cli : server terminated prematurely`

- When we type "another line," **`str_cli`** calls writen and the client TCP sends the data to the server. 

- This is allowed by TCP because the receipt of the FIN by the client TCP only indicates that the server process has closed its end of the connection and will not be sending any more data. 
- The receipt of the FIN does not tell the client TCP that the server process has terminated. 

- When the server TCP receives the data from the client, it responds with an RST since the process that had that socket open has terminated. We can verify that the RST was sent by watching the packets with **`tcpdump`**.

- The client process will not see the RST because it calls readline immediately after the call to writen and readline returns 0 (EOF) immediately because of the FIN that was received in Step 2. 
  - Our client is not expecting to receive an EOF at this point so it quits with the error message "server terminated prematurely."

>The problem in this example is that the client is blocked in the call to fgets when the FIN arrives on the socket. 
>
>The client is really working with two descriptors the socket and the user input and instead of blocking on input from only one of the two sources (as str_cli is currently coded), it should block on input from either source. 

***

### 5.13 `SIGPIPE` Signal

> What happens if the client ignores the error return from readline and writes more data to the server? 

- The rule that applies is: When a process writes to a socket that has received an RST, the **`SIGPIPE`** signal is sent to the process. 
- The default action of this signal is to terminate the process, so the process must catch the signal to avoid being involuntarily terminated.

- If the process either catches the signal and returns from the signal handler, or ignores the signal, the write operation returns **`EPIPE`**.

```c
void
str_cli(FILE *fp, int sockfd)
{
	char	sendline[MAXLINE], recvline[MAXLINE];

	while (Fgets(sendline, MAXLINE, fp) != NULL) {

		Writen(sockfd, sendline, 1);
		sleep(1);
		Writen(sockfd, sendline+1, strlen(sendline)-1);

		if (Readline(sockfd, recvline, MAXLINE) == 0)
			err_quit("str_cli: server terminated prematurely");

		Fputs(recvline, stdout);
	}
}
```

- 8-10 All we have changed is to call writen two times: the first time the first byte of data is written to the socket, followed by a pause of one second, followed by the remainder of the line. 
- The intent is for the first writen to elicit the RST and then for the second writen to generate **`SIGPIPE`**.

***

### 5.14 Crashing of Server Host

- The following steps take place:
  - When the server host crashes, nothing is sent out on the existing network connections. That is, we are assuming the host crashes and is not shut down by an operator.
  - We type a line of input to the client, it is written by writen, and is sent by the client TCP as a data segment. The client then blocks in the call to readline, waiting for the echoed reply.
  - If we watch the network with **`tcpdump`**, we will see the client TCP continually retransmitting the data segment, *trying* to receive an `ACK` from the server. 

- The solution is to place a timeout on the call to readline

***

**5.15 Crashing and Rebooting of Server Host**

- We start the server and then the client. We type a line to verify that the connection is established.
- The server host crashes and reboots.
- We type a line of input to the client, which is sent as a TCP data segment to the server host.
- When the server host reboots after crashing, its TCP loses all information about connections that existed before the crash. Therefore, the server TCP responds to the received data segment from the client with an RST.
- Our client is blocked in the call to readline when the RST is received, causing readline to return the error **`ECONNRESET`**.

***

## 6. I/O Multiplexing: The `select` and `poll` Functions

- I/O multiplexing is typically used in networking applications in the following scenarios:
  - When a client is handling multiple descriptors (normally interactive input and a network socket), I/O multiplexing should be used. This is the scenario we described previously.
  - It is possible, but rare, for a client to handle multiple sockets at the same time. We will show an example of this using select in **Section 16.5** in the context of a Web client.
  - If a TCP server handles both a listening socket and its connected sockets, I/O multiplexing is normally used
  - If a server handles both TCP and UDP, I/O multiplexing is normally used. We will show an example of this in **Section 8.15**.
  - If a server handles multiple services and perhaps multiple protocols (e.g., the inetd daemon that we will describe in **Section 13.5**), I/O multiplexing is normally used.

***

### 6.2 I/O Models

> Before describing select and poll, we need to step back and look at the bigger picture, examining the basic differences in the five I/O models that are available to us under Unix:

- blocking I/O
- nonblocking I/O
- I/O multiplexing (`select` and `poll`)
- signal driven I/O (`SIGIO`)
- asynchronous I/O (the POSIX `aio_`functions)

As we show in all the examples in this section, there are normally two distinct phases for
an input operation:

1. Waiting for the data to be ready

2. Copying the data from the kernel to the process

**Nonblocking I/O Model**

> When we set a socket to be nonblocking, we are telling the kernel "when an I/O operation that I request cannot be completed without putting the process to sleep, do not put the process to sleep, but return an error instead." 

- The first three times that we call **`recvfrom`**, there is no data to return, so the kernel immediately returns an error of **`EWOULDBLOCK`** instead. 
- The fourth time we call recvfrom, a datagram is ready, it is copied into our application buffer, and recvfrom returns successfully. We then process the data.

<img src="C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210323152056441.png" alt="image-20210323152056441" style="zoom:67%;" />

- When an application sits in a loop calling recvfrom on a nonblocking descriptor like this, it is called **polling**. 
- The application is continually polling the kernel to see if some operation is ready. 
- This is often a waste of CPU time, but this model is occasionally encountered, normally on systems dedicated to one function.

***

**I/O Multiplexing Model**

> With I/O multiplexing, we call select or poll and block in one of these two system calls, instead of blocking in the actual I/O system call. 

<img src="C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210323152309524.png" alt="image-20210323152309524" style="zoom:67%;" />

- We block in a call to **select**, waiting for the datagram socket to be readable. 
- When select returns that the socket is readable, we then call **recvfrom** to copy the datagram into our application buffer.

>the advantage in using select, which we will see later in this chapter, is that we can wait for more than one descriptor to be ready.

***

**Signal-Driven I/O Model**

> We can also use signals, telling the kernel to notify us with the **`SIGIO`** signal when the descriptor is ready. 

- We first enable the socket for signal-driven I/O (as we will describe in Section 25.2) and install a signal handler using the **`sigaction`** system call. 
- The return from this system call is immediate and our process continues; it is not blocked. 
- When the datagram is ready to be read, the **SIGIO** signal is generated for our process. 

***

**Asynchronous I/O Model**

- In general, these functions work by telling the kernel to start the operation and to notify us when the entire operation (including the copy of the data from the kernel to our buffer) is complete. 
  - The main difference between this model and the signal-driven I/O model is that with signal-driven I/O, the kernel tells us when an I/O operation can be **initiated**, but with asynchronous I/O, the kernel tells us when an I/O operation is **complete**.

- We call **`aio_read`** (the POSIX asynchronous I/O functions begin with **aio_** or **lio_**) and pass the kernel the **descriptor**, **buffer pointer**, **buffer size** (the same three arguments for **`read`**), **file offset** (similar to **`lseek`**), and how to notify us when the entire operation is complete. 
- This system call returns immediately and our process is not blocked while waiting for the I/O to complete. 
- We assume in this example that we ask the kernel to generate some signal when the operation is complete. This signal is not generated until the data has been copied into our application buffer, which is different from the signal-driven I/O model.

***

### 6.3 `select` Function

> This function allows the process to instruct the kernel to **wait** for any one of multiple events **to occur** and to **wake up the process** only when one or more of these events occurs or when a specified amount of time has passed.

- That is, we tell the kernel what descriptors we are interested in (for reading, writing, or an exception condition) and how long to wait. 
  - The descriptors in which we are interested are not restricted to sockets; 
  - **any descriptor** can be tested using select.

![image-20210323154430890](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210323154430890.png)