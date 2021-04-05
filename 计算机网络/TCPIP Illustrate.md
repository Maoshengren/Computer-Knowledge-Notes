## 1. Introduction

![image-20210328105409181](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210328105409181.png)

***

## 3. Link Layer

**3.2.2 The Ethernet Frame Format**

![image-20210329213854125](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210329213854125.png)

- The Ethernet frame begins with a **Preamble** area used by the receiving interface’s circuitry to determine when a frame is arriving and to determine the amount of time between encoded bits (called **clock recovery**). 
  - The preamble is a recognizable pattern (0xAA typically), which the receiver can use to “recover the clock” by the time the **start frame delimiter** (SFD) is found. The SFD has the fixed value 0xAB.

- This basic frame format includes 48-bit (6-byte) Destination (DST) and Source (SRC) Address fields. 
- Following the source address is a **Type** field that doubles as a **Length** field. Ordinarily, it identifies the type of data that follows the header. Popular values used with TCP/IP networks include IPv4 (0x0800), IPv6 (0x86DD), and ARP (0x0806).

- The final field of the Ethernet frame format follows the payload area and provides an integrity check on the frame.
  - To use an n-bit CRC for detection of data transmission in error, the message to be checked is first appended with n 0 bits, forming the **augmented message**. 
  - Then, the augmented message is divided (using modulo-2 division) by an (n+1)-bit value called the **generator polynomial**,(provided by ITU) which acts as the divisor. 
  - The value placed in the CRC field of the message is the one’s complement(二进制反码) of the remainder of this division (the quotient is discarded). 

- There is both a minimum and a maximum size of Ethernet frames. The minimum is 64 bytes, requiring a minimum data area (payload) length of **48** bytes (no tags).
  - In cases where the payload is smaller, pad bytes (value 0) are appended to the end of the payload portion to ensure that the minimum length is enforced.