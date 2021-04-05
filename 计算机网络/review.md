### TCP

<img src=".\image-20201119155835823.png" alt="image-20201119155835823" style="zoom:50%;" />

TCP的数据段结构

- RST字段用于消除两个TCP同时想建立连接

三次握手：

- 客户端先发送TCP报文给服务端，将SYN设置为1，随机选取一个初始序列号
- 服务端接受到报文后，将SYN设置为1，也随机选取一个初始序列号，同时把acknowledge设置为初始值+1
- 客户端收到后，将SYN设置为0，同时将acknowledge设置为服务端的isn+1，同时可以包含一些请求数据
- 连接建立完成

四次挥手：

- client发送FIN设置为1的报文给server
- server收到后，发送ACK报文为client
- server发送FIN设置为1的报文给client
- client发送ACK给server

***

​          TCP A 																						             TCP B
1. CLOSED                                                                                                       LISTEN
2. SYN-SENT --> <SEQ=100><CTL=SYN>                                                  --> SYN-RECEIVED
 3. ESTABLISHED <--     <SEQ=300><ACK=101><CTL=SYN,ACK>        <-- SYN-RECEIVED
4. ESTABLISHED --> <SEQ=101><ACK=301><CTL=ACK>                      -->ESTABLISHED
5. ESTABLISHED --> <SEQ=101><ACK=301><CTL=ACK><DATA>        --> ESTABLISHED

![image-20210315221647601](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210315221647601.png)

三次握手的**主要原因**是防止旧的重复连接初始化引起混乱

- 为了解决这个问题，设计了一种特殊的控制信息reset
  - 如果server接收到了之前的SYN，并作出ACK，client收到后会设置reset，并使server返回到LISTEN状态

- 如果接收的TCP处于非同步状态(即SYN-SENT，SYN-RECEIVED)，它在接收到可接受的reset后返回LISTEN。
- 如果TCP处于一种同步状态(ESTABLISHED，FIN-WAIT-1, FIN-WAIT-2, CLOSE-WAIT, CLOSING, LAST-ACK, TIME-WAIT)，它中止连接并通知用户。

![image-20210315222626776](C:\Users\13793\Desktop\学习笔记\计算机网络\image-20210315222626776.png)

如果一方崩溃的情况下的反应

***

**关闭连接**

- The user initiates by telling the TCP to CLOSE the connection
- The remote TCP initiates by sending a FIN control signal
- Both users CLOSE simultaneously

**Case 1: Local user initiates the close**

- In this case, a FIN segment can be constructed and placed on the outgoing segment queue. No further SENDs from the user will be accepted by the TCP, and it enters the **FIN-WAIT-1 state**. 
- RECEIVEs are allowed in this state. 
- All segments preceding and including FIN will be **retransmitted** **until acknowledged**.
- When the other TCP has both acknowledged the FIN and sent a FIN of its own, the first TCP can ACK this FIN. 
- Note that a TCP receiving a FIN will ACK but not send its own FIN until its user has CLOSED the connection also.

**Case 2: TCP receives a FIN from the network**

- If an unsolicited FIN arrives from the network, the receiving TCP can ACK it and tell the user that the connection is closing. 
- The user will respond with a CLOSE, upon which the TCP can send a FIN to the other TCP after sending any remaining data. 
- The TCP then waits until its own FIN is acknowledged whereupon it deletes the connection. 
- If an ACK is not forthcoming, after the user timeout the connection is aborted and the user is told.

**Case 3: both users close simultaneously**

- A simultaneous CLOSE by users at both ends of a connection causes FIN segments to be exchanged. 
- When all segments preceding the FINs have been processed and acknowledged, each TCP can ACK the FIN it has received. 
- Both will, upon receiving these ACKs, delete the connection.

***

