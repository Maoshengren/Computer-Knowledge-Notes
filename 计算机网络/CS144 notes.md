### 2.3 Listening and connecting

- In one terminal window, run `netcat -v -l -p 9090` on your VM. 
  - The **nc (or netcat)** utility is used for just about anything under the sun involving TCP, UDP, or UNIX domain sockets.  
    - It can open TCP connections, send UDP packets, listen on arbitrary TCP and UDP ports, do port scanning, and deal with both IPv4 and IPv6.  
  - Unlike telnet(1), nc scripts nicely, and separates error messages onto standard error instead of sending them to standard output, as telnet(1) does with some.

- Leave netcat running. In another terminal window, run `telnet localhost 9090`



### 3.2 Modern C++: mostly safe but still fast and low-level

- The lab assignments will be done in a contemporary C++ style that uses recent (2011) features to program as safely as possible. 
- For references to this style, please see the C++ Core Guidelines (http://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines).

- The basic idea is to make sure that every object is designed to have the smallest possible public interface, has a lot of internal safety checks and is hard to use improperly, and knows how to clean up after itself. We want to avoid “paired” operations (e.g. malloc/free, or new/delete), where it might be possible for the second half of the pair not to happen.

In particular, we would like you to:

- Use the language documentation at https://en.cppreference.com as a resource.
- Never use malloc() or free().
- Never use new or delete.
- Essentially never use raw pointers (*), and use “smart” pointers (unique ptr or shared ptr) only when necessary. (You will not need to use these in CS144.)
- Avoid templates, threads, locks, and virtual functions. (You will not need to use these in CS144.)
- Avoid C-style strings (char *str) or string functions (strlen(), strcpy()). These are pretty error-prone. Use a std::string instead.
- Never use C-style casts (e.g., (FILE *)x). Use a C++ static cast if you have to (you generally will not need this in CS144).
- Prefer passing function arguments by const reference (e.g.: const Address & address).
- Make every variable const unless it needs to be mutated.
- Make every method const unless it needs to mutate the object.
- Avoid global variables, and give every variable the smallest scope possible.
- Before handing in an assignment, please run make format to normalize the coding style.





### Lab 0 writeup

=============
My name: [your name here]



My SUNet ID:[your sunetid here]



This lab took ne about [n] hours to do. 



I [did/did not] attend the lab sess#



My secret code from section 2.1 was: [code here]

- optional: I had unexpected difficulty with: [describe]



- optional: I think you could make this lab better by: [describe]



- optional: I was surprised by: [describe]



- optional: I'm not sure about:[describe]