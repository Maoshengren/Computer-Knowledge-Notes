# Java数据结构

### 查看源代码方法：

Ctrl+p 在输入文本框中加一个#，如：

```
#ArrayList
```

## Java IO

**OutputStream class**

OutputStream class is an abstract class. It is the superclass of all classes representing an output stream of bytes. An output stream accepts output bytes and sends them to some sink.

**Useful methods of OutputStream**

| Method                                             | Description                                                  |
| :------------------------------------------------- | :----------------------------------------------------------- |
| 1) public void **write(int)** throws IOException   | is used to write a byte to the current output stream.        |
| 2) public void **write(byte[])**throws IOException | is used to write an array of byte to the current output stream. |
| 3) public void **flush()**throws IOException       | flushes the current output stream.                           |
| 4) public void **close()**throws IOException       | is used to close the current output stream.                  |

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210312101934355.png" alt="image-20210312101934355" style="zoom:67%;" />

**InputStream class**

InputStream class is an abstract class. It is the superclass of all classes representing an input stream of bytes.

**Useful methods of InputStream**

| Method                                              | Description                                                  |
| :-------------------------------------------------- | :----------------------------------------------------------- |
| 1) public abstract int **read()**throws IOException | reads the **next byte of data** from the input stream. It returns -1 at the end of the file. |
| 2) public int **available()**throws IOException     | returns an estimate of the number of bytes that can be read from the current input stream. |
| 3) public void **close()**throws IOException        | is used to close the current input stream.                   |

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210312102349884.png" alt="image-20210312102349884" style="zoom:67%;" />

### FileOutputStream

> Java **FileOutputStream** is an output stream used for writing data to a file.

- If you have to write primitive values into a file, use FileOutputStream class. 
- You can write byte-oriented as well as character-oriented data through FileOutputStream class. 
- But, for character-oriented data, it is preferred to use **FileWriter** than FileOutputStream.

```java
public class FileOutputStream extends OutputStream  
```

**Class Method**

| Method                                       | Description                                                  |
| :------------------------------------------- | :----------------------------------------------------------- |
| protected void **finalize()**                | It is used to clean up the connection with the file output stream. |
| void **write(byte[] ary)**                   | It is used to write **ary.length** bytes from the byte [array](https://www.javatpoint.com/array-in-java) to the file output stream. |
| void **write(byte[] ary, int off, int len)** | It is used to write **len** bytes from the byte array starting at offset **off** to the file output stream. |
| void **write(int b)**                        | It is used to write the specified byte to the file output stream. |
| FileChannel getChannel()                     | It is used to return the file channel object associated with the file output stream. |
| FileDescriptor getFD()                       | It is used to return the file descriptor associated with the stream. |
| void close()                                 | It is used to closes the file output stream.                 |

**Java FileOutputStream Example 1: write byte**

```java
import java.io.FileOutputStream;  
public class FileOutputStreamExample {  
    public static void main(String args[]){    
           try{    
             FileOutputStream fout=new FileOutputStream("D:\\testout.txt");    
             fout.write(65);    
             fout.close();    
             System.out.println("success...");    
            }catch(Exception e){System.out.println(e);}    
      }    
}  
```

**write string**

```java
import java.io.FileOutputStream;  
public class FileOutputStreamExample {  
    public static void main(String args[]){    
           try{    
             FileOutputStream fout=new FileOutputStream("D:\\testout.txt");    
             String s="Welcome to javaTpoint.";    
             byte b[]=s.getBytes();//converting string into byte array    
             fout.write(b);    
             fout.close();    
             System.out.println("success...");    
            }catch(Exception e){System.out.println(e);}    
      }    
}  
```

### FileInputStream

> Java FileInputStream class obtains input bytes from a [file](https://www.javatpoint.com/java-file-class). 

- It is used for reading byte-oriented data (streams of raw bytes) such as image data, audio, video etc. 
- You can also read character-stream data. 

- But, for reading streams of characters, it is recommended to use [FileReader](https://www.javatpoint.com/java-filereader-class) class.

```java
public class FileInputStream extends InputStream 
```

| Method                               | Description                                                  |
| :----------------------------------- | :----------------------------------------------------------- |
| int available()                      | It is used to return the estimated number of bytes that can be read from the input stream. |
| int read()                           | It is used to read the byte of data from the input stream.   |
| int read(byte[] b)                   | It is used to read up to **b.length** bytes of data from the input stream. |
| int read(byte[] b, int off, int len) | It is used to read up to **len** bytes of data from the input stream. |
| long skip(long x)                    | It is used to skip over and discards x bytes of data from the input stream. |
| FileChannel getChannel()             | It is used to return the unique FileChannel object associated with the file input stream. |
| FileDescriptor getFD()               | It is used to return the [FileDescriptor](https://www.javatpoint.com/java-filedescriptor-class) object. |
| protected void finalize()            | It is used to ensure that the close method is call when there is no more reference to the file input stream. |
| void close()                         | It is used to closes the [stream](https://www.javatpoint.com/java-8-stream). |

**read single character**

```java
import java.io.FileInputStream;  
public class DataStreamExample {  
     public static void main(String args[]){    
         try{    
             FileInputStream fin=new FileInputStream("D:\\testout.txt");    
             int i=fin.read();  
             System.out.print((char)i);    

             fin.close();    
         }catch(Exception e){System.out.println(e);}    
     }    
} 
```

**read all characters**

```java
import java.io.FileInputStream;  
public class DataStreamExample {  
     public static void main(String args[]){    
         try{    
             FileInputStream fin=new FileInputStream("D:\\testout.txt");    
             int i=0;    
             while((i=fin.read())!=-1){    
             	System.out.print((char)i);    
         	}    
         	fin.close();    
         }catch(Exception e){System.out.println(e);}    
     }    
}  
```

### BufferedOutputStream

> Java **BufferedOutputStream** [class](https://www.javatpoint.com/object-and-class-in-java) is used for buffering an output stream.

- It internally uses buffer to store data. It adds more efficiency than to write data directly into a stream. So, it makes the performance fast.

For adding the buffer in an OutputStream, use the BufferedOutputStream class. 

Let's see the syntax for adding the buffer in an OutputStream:

```java
OutputStream os= new BufferedOutputStream(new FileOutputStream("D:\\IO Package\\testout.txt")); 
```

```java
public class BufferedOutputStream extends FilterOutputStream  
```

| Constructor                                     | Description                                                  |
| :---------------------------------------------- | :----------------------------------------------------------- |
| BufferedOutputStream(OutputStream os)           | It creates the new buffered output stream which is used for writing the data to the specified output stream. |
| BufferedOutputStream(OutputStream os, int size) | It creates the new buffered output stream which is used for writing the data to the specified output stream with a specified buffer size. |

| Method                                 | Description                                                  |
| :------------------------------------- | :----------------------------------------------------------- |
| void write(int b)                      | It writes the specified byte to the buffered output stream.  |
| void write(byte[] b, int off, int len) | It write the bytes from the specified byte-input stream into a specified byte [array](https://www.javatpoint.com/array-in-java), starting with the given offset |
| void flush()                           | It flushes the buffered output stream.                       |

**Example of BufferedOutputStream class:**

- In this example, we are writing the textual information in the BufferedOutputStream object which is connected to the [FileOutputStream](https://www.javatpoint.com/java-fileoutputstream-class) [object](https://www.javatpoint.com/object-and-class-in-java). 
- The flush() flushes the data of one stream and send it into another. It is required if you have connected the one stream with another.

```java
package com.javatpoint;  
import java.io.*;  
public class BufferedOutputStreamExample{    
    public static void main(String args[]) throws Exception{    
         FileOutputStream fout = new FileOutputStream("D:\\testout.txt");    
         BufferedOutputStream bout = new BufferedOutputStream(fout);    
         String s = "Welcome to javaTpoint.";    
         byte b[] = s.getBytes();    
         bout.write(b);    
         bout.flush();    
         bout.close();    
         fout.close();    
         System.out.println("success");    
    }    
}  
```

### SequenceInputStream

> [Java](https://www.javatpoint.com/java-tutorial) SequenceInputStream [class](https://www.javatpoint.com/object-class) is used to read data from multiple [streams](https://www.javatpoint.com/java-8-stream). 
>
> It reads data sequentially (one by one)

***

**ByteArrayOutputStream** 

> Java **ByteArrayOutputStream** class is used to **write common data** into **multiple files**. In this stream, the data is written into a byte [array](https://www.javatpoint.com/array-in-java) which can be written to multiple streams later.

- The ByteArrayOutputStream holds a copy of data and forwards it to multiple streams.

- The buffer of ByteArrayOutputStream automatically grows according to data.

***

**ByteArrayInputStream**

> The **ByteArrayInputStream** is composed of two words: ByteArray and InputStream. 
>
> As the name suggests, it can be used to read byte [array](https://www.javatpoint.com/array-in-java) as input stream.

- Java ByteArrayInputStream [class](https://www.javatpoint.com/object-and-class-in-java) contains an internal buffer which is used to **read byte array** as stream. In this stream, the data is read from a byte array.

- The buffer of ByteArrayInputStream automatically grows according to data.

***



### Java Writer

- It is an [abstract](https://www.javatpoint.com/abstract-class-in-java) class for writing to character streams. 
- The methods that a subclass must implement are **write**(char[], int, int), **flush**(), and **close**(). 
- Most subclasses will override some of the methods defined here to provide higher efficiency, functionality or both.

```java
import java.io.*;  
public class WriterExample {  
    public static void main(String[] args) {  
        try {  
            Writer w = new FileWriter("output.txt");  
            String content = "I love my country";  
            w.write(content);  
            w.close();  
            System.out.println("Done");  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
}  
```

***

### Java Reader

- Java Reader is an [abstract]() class for reading character streams. 
- The only methods that a subclass must implement are **read**(char[], int, int) and **close**(). 

### FileWriter

- Java **FileWriter** class is used to write character-oriented data to a [file](https://www.javatpoint.com/java-file-class). 
- It is character-oriented class which is used for file handling in [java](https://www.javatpoint.com/java-tutorial).

> Unlike FileOutputStream class, you don't need to convert string into byte [array](https://www.javatpoint.com/array-in-java) because it provides method to write string directly.

```java
public class FileWriter extends OutputStreamWriter 
```

| Constructor             | Description                                                  |
| :---------------------- | :----------------------------------------------------------- |
| FileWriter(String file) | Creates a new file. It gets file name in [string](https://www.javatpoint.com/java-string). |
| FileWriter(File file)   | Creates a new file. It gets file name in File [object](https://www.javatpoint.com/object-and-class-in-java). |

| Method                      | Description                                     |
| :-------------------------- | :---------------------------------------------- |
| void **write**(String text) | It is used to write the string into FileWriter. |
| void **write**(char c)      | It is used to write the char into FileWriter.   |
| void **write**(char[] c)    | It is used to write char array into FileWriter. |
| void **flush**()            | It is used to flushes the data of FileWriter.   |
| void **close**()            | It is used to close the FileWriter.             |

***

**FileReader Class**

- Java FileReader class is used to read data from the file. 
- It returns data in byte format like [FileInputStream](https://www.javatpoint.com/java-fileinputstream-class) class.

```java
public class FileReader extends InputStreamReader  
```

| Method       | Description                                                  |
| :----------- | :----------------------------------------------------------- |
| int read()   | It is used to return a character in ASCII form. It returns -1 at the end of file. |
| void close() | It is used to close the FileReader class.                    |

***

### PrintStream

- The PrintStream class provides methods to write data to another stream. 
- The PrintStream class automatically flushes the data so there is no need to call flush() method. 
- Moreover, its methods don't throw IOException.

```java
public class PrintStream extends FilterOutputStream implements Closeable. Appendable   
```









## 1.泛型

- **泛型可以使我们在编译时而不是在运行时检测出错误**
- 泛型( generic)可以参数化类型。
- 这个能力使我们可以定义带泛型类型的类或方法，随后编译器会用具体的类型来替换它
  - 例如，Java 定义了一个泛型类ArrayList用于存储泛型类型的元素。基于这个泛型类，可以创建用于保存字符串的ArrayList对象，以及保存数字的ArrayList对象。
  - 这里，字符串和数字是取代泛型类型的具体类型。
- 使用泛型的主要优点是能够在编译时而不是在运行时检测出错误。
- 泛型类或方法允许用户指定可以和这些类或方法一起工作的对象类型。如果试图使用一个不相容的对象，编译器就会检测出这个错误。

### 1.1动机和优点

- 使用Java泛型的动机是在编译时检测出错误

![image-20200728093857936](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728093857936.png)

- 这里的\<T\>表示形式泛型类型( formal generic type)，随后可以用一个实际具体类型( actual concrete type) 来替换它。
- 替换泛型类型称为泛型实例化( generic instantiation)。按照惯例，像E或T这样的单个大写字母用于表示形式泛型类型。

***

![image-20200728094052344](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728094052344.png)

- 图19-2b中的语句将c声明为一个引用变量，它的类型是Comparable\<Date\>
- 然后调用compareTo方法来比较Date对象和一个字符串
- 这样的代码会产生编译错误，因为传递给compareTo方法的参数必须是Date类型的。
- 由于这个错误可以在编译时而不是运行时被检测到，因而泛型类型使程序更加可靠。

***

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728094159856.png" alt="image-20200728094159856" style="zoom:67%;" />

- 例如，下面的语句创建一一个字符串的线性表:
  `ArrayList<String> list = new ArrayList<>();`

- 现在，就只能向该线性表中添加字符串。例如，
  `list.add("Red");`

- 如果试图向其中添加非字符串，就会产生编译错误。例如，下面的语句就是不合法的，因为list只能包含字符串:
  `list.add(new Integer(1));`
- 泛型类型必须是引用类型。不能使用int、double或char这样的基本类型来替换泛型
  类型。例如，下面的语句是错误的:
  `ArrayList<int> intList = new ArrayList<>();`
  - 为了给int值创建一个ArrayList对象，必须使用
    `ArrayList<Integer> intList = new ArrayList<>();`
  - 可以在intList中加入一个int值。例如，
    `intList.add(5);`

***

### 1.2定义泛型类和接口

- 可以为类或者接口定义泛型
- 当使用类来创建对象，或者使用类或接口来声明引用变量时，必须指定具体的类型。

 - 如图19-4所示，在程序清单19-1中实现它。我们修改11.13节中的栈类，将元素类型通用化为泛型。新的名为GenericStack的栈类

![image-20200728150947116](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728150947116.png)

```java
import java.util.ArrayList;

public class GenericStack<E> {
    private ArrayList<E> list = new ArrayList<>();

    public int getSize(){
        return list.size();
    }

    public E peek(){
        return list.get(getSize() - 1);
    }

    public void push(E o){
        list.add(o);
    }

    public E pop(){
        E o = list.get(getSize() - 1);
        list.remove(getSize() - 1);
        return o;
    }

    public boolean isEmpty(){
        return list.isEmpty();
    }

    @Override
    public String toString(){
        return "stack: " + list.toString();
    }   
}
```

先添加字符串，再添加整数即会报错：

```java
GenericStack<String>stack1 = new GenericStack<>();
stack1.push("London");
stack1.push("Paris");
stack1.push ("Berlin");
stack1.push("1234");
GenericStack<Integer> stack2 = new GenericStack<>();
stack2.push(1);
stack2.push(2);
stack2.push(3);
System.out.println(stack1.toString());
System.out.println(stack2.toString());
```

> 注意:有时候，泛型类可能会有多个参数。在这种情况下，应将所有参数一起放在尖括号中，并用逗号分隔开，比如<E1,E2,E3>

`public class String implements Comparable<String>`

> 注意:可以定义一个类或接口作为泛型类或者泛型接口的子类型。例如，在JavaAPI中，**java.lang.String** 类被定义为实现 Comparable接口，如下所示:

`public class String implement Comparable<String>`

***

### 1.3泛型方法

- 可以为静态方法定义泛型类型
- 可以定义泛型接口（如Comparable接口）和泛型类（如GenericStack），也可以使用泛型类型来定义泛型方法

```java
public class GenericMethodDemo {
    public static void main(String[] args) {
        Integer[] integers = {1,2,3,4,5};
        String[] strings = {"Longdon","Shanghai","Beijing"};

        GenericMethodDemo.<Integer>print(integers);
        GenericMethodDemo.<String>print(strings);
    }

    public static <E> void print(E[] list){
        for(int i = 0; i < list.length; i++){
            System.out.print(list[i] + " ");
        }
        System.out.println();
    }
}
```

> **10~14行定义了泛型print方法**
> 为了声明泛型方法，**将泛型类型\<E\>置于方法头中关键字static之后**。例如，
> 为了调用泛型方法，**需要将实际类型放在尖括号内作为方法名的前缀**。例如，
>
> ```java
> public static <E> void print(E[] list)
> GenericMethodDemo.<Integer>print(integers);
> GenericMethodDemo.<String>print(strings);
> ```
>
> 或者如下简单调用:
>
> `print(integers;
> print(strings);`
>
> 在后面一种情况中，实际类型没有明确指定。编译器自动发现实际类型。

- 可以将泛型指定为另外一种类型的子类型。这样的泛型类型称为受限的(bounded）

```java
public class BoundedTypeDemo{
    public static void main(String[] args ) {
        Rectangle rectangle = new Rectang1e(2，2);
        Circle circle = new Circle(2）;
        System. out.println("'Same area?“+
        equalArea(rectangle，circle));
    }
public static <E extends Geometricobject> boolean equalArea(E object1，E object2){
    return object1.getArea()== object2.getArea();
    }
}
```

 - 注意：非受限泛型类型\<E\>等同于\<E extends Object> o

- 为了定义一个类为泛型类型，需要将泛型类型放在类名之后，例如，GenericStack\<E>。

***

### 1.4对一个对象数组排序

- 可以开发一个泛型方法，对一个Comparable对象数组进行排序。
- 本节提供一个泛型方法，对一个Comparable对象数组进行排序。
- 这些对象是Comparable接口的实例，它们使用compareTo方法进行比较。
- 为了测试该方法，程序对一个整数数组、一个双精度数字数组、一个字符数组以及一个字符串数组分别进行了排序

```java
public class GenericSort {
    public static void main(String[] args) {
        Integer[] integers = {6,2,4,9,8,3};
        Double[] doubles = {6.9, 3.4, 5.6, 7.7};
        Character[] characters = {'f','b','t','c'};
        String[] strings = {"London","Shanghai","Beijing","Wuhan"};

        sort(integers);
        sort(doubles);
        sort(characters);
        sort(strings);
        printList(integers);
        printList(doubles);
        printList(characters);
        printList(strings);
    }
    public static <E extends Comparable<E>> void sort(E[] list){
        E currentmin;
        int currentminIndex;
        for(int i = 0; i < list.length; i++){
            currentmin = list[i];
            currentminIndex = i;
            for(int j = i + 1; j < list.length; j++){
                if(currentmin.compareTo(list[j]) > 0){
                    currentmin = list[j];
                    currentminIndex = j;
                }
            }
            if(currentminIndex != i){
                list[currentminIndex] = list[i];
                list[i] = currentmin;
            }  
        }
    }
    public static void printList(Object[] list){
        for(int i = 0; i < list.length; i++)
            System.out.println(list[i]);
        System.out.println();
    }
}
```

***

### 1.5原始类型和向后兼容

- 没有指定具体类型的泛型类和泛型接口被称为原始类型，用于和早期的Java版本向后兼容

- 可以使用泛型类而无须指定具体类型，如下所示:
  `GenericStack stack = new GenericStack()); // raw type`
  它大体等价于下面的语句:

  `GenericStack<Object> stack = new GenericStack<Object>()`

- 像这样不带类型参数的GenericStack和ArrayList泛型类称为**原始类型(rawtype)**

- 使用原始类型可以向后兼容Java的早期版本。

  - 例如，从JDK 1.5开始，在java.lang.Comparable中使用了泛型类型，但是，许多代码仍然使用原始类型Comparable

```java
public class Max {
    /** Return the maximum of two objects */
    public static Comparable max(Comparable o1，Comparable o2) {
        if (o1.compareTo(o2) > 0)
        	return o1;
        else
        	return o2;
    }
}
```

***

### 1.6通配泛型

- 可以使用非受限通配、受限通配或者下限通配来对一个泛型类型指定范围。
- 通配泛型是什么?为什么需要通配泛型?
- 该例子定义了一个泛型max方法，该方法可以找出数字栈中的最大数(第12 ~ 22行)
- main方法创建了一个整数对象栈，然后向该栈添加三个整数，最后调用max方法找出该栈中的最大数字

***

```java
public class WildCardNeedDemo {
    public static void main(String[] args) {
        GenericStack<Integer> intstack = new GenericStack<>();
        intstack.push(1);
        intstack.push(3);
        intstack.push(-2);
        System.out.print("The max value is : " + max(intstack));
    }
    public static double max(GenericStack<? extend Number> stack){
        double max = stack.pop().doubleValue();
        while(!stack.isEmpty()){
            double value = stack.pop().doubleValue();
            if(value > max)
                max = value;
        }
        return max;
    }
}
```

- 为了避免这个问题，可以使用通配泛型类型。

- 通配泛型类型有三种形式 ? ，? extends T  或者  ? superT ，其中T是泛型类型

  - 第一种形式 ? 称为非受限通配 (unbounded wildcard)，它和 ? extends Object是一样的
  - 第二种形式 ? extends T 称为受限通配 ( bounded wildcard)，表示T或T的一个子类型
  - 第三种形式 ? super T 称为下限通配 (lower-bound wildcard)，表示 T 或 T 的一个父类型。

- 使用下面的语句替换程序清单19-7中的第12行，就可以修复上面的错误: 
  `public static double max (GenericStack< ? extends Number > stack) `

- `<? extends Number>`是一个表示Number或Number的子类型的通配类型。因此，调用

  `max(new GenericStack<Integer>())或max(new GenericStack<Doub1e>())`都是合法的。

***

- 什么时候需要<? super T>通配符呢?
- 该例创建了一个字符串栈stack1 (第3行)和一个对象栈stack2 (第4行)，然后调用add(stack1, stack2)
  (第8行)将stack1中的字符串添加到stack2中
- 在第13行使用`GenericStack<? super T>`来声明栈stack2。
- 如果用\<T>代替<? super T>， 那么在第8行的`add(stack1, stack2)` 上就会产生一个编译错误，因为stack1的类型为`GenericStack<String>`，而stack2的类型为`GenericStack<0bject>`
- <? super T> 表示类型T或T的父类型。object 是String的父类型。

```java
public class SuperCardDemo {
    public static void main(String[] args) {
        GenericStack<String> stack1 = new GenericStack<>();
        GenericStack<Object> stack2 = new GenericStack<>();
        stack2.push("java");
        stack2.push("14.01");
        stack1.push("sun");
        stack1.push("Oracle");
        add(stack1,stack2);
        SuperCardDemo.print(stack2);
    }
    public static <T> void add(GenericStack<T> stack1, GenericStack<? super T> stack2){
        while(!stack1.isEmpty())
            stack2.push(stack1.pop());
    }
    public static void print(GenericStack<?> list){
        while(!list.isEmpty())
            System.out.println(list.pop() + " ");
    }
}
```

![image-20200728203943373](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728203943373.png)

***

### 1.7消除泛型和对泛型的限制

- 编译器可使用泛型信息， 但这些信息在运行时是不可用的。这被称为类型消除。
  - 泛型是使用一种称为类型消除(typeerasure)的方法来实现的。
  - 编译器使用泛型类型信息来编译代码，但是随后会消除它。
  - 因此，泛型信息在运行时是不可用的。这种方法可以使泛型代码向后兼容使用原始类型的遗留代码
- 泛型存在于编译时。一旦编译器确认泛型类型是安全使用的，就会将它转换为原始类型
- 例如，编译器会检查图a的代码里泛型是否被正确使用，然后将它翻译成如图b所示的在运行时使用的等价代码。图b中的代码使用的是原始类型。

![image-20200728204626206](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728204626206.png)

![image-20200728204710639](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728204710639.png)

![image-20200728204801449](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728204801449.png)

- 非常需要注意的是，不管实际的具体类型是什么，泛型类是被它的所有实例所共享的。
  假定按如下方式创建list1和list2:
  `ArrayList<String> list1 = new ArrayList<>();
  ArrayList<Integer> 1ist2 = new ArrayList<>();`
- 尽管在编译时ArrayList\<String>和ArrayList\<Integer>是两种类型，但是，在运行时
  只有一个ArrayList类会被加载到JVM中。list1和list2都是ArrayList的实例，因此，
  下面两条语句的执行结果都为true:
  `System . out. println(1ist1 instanceof ArrayList);
  System. out. println(1ist2 instanceof ArrayList);`
- 然而表达式list1 instanceof ArrayList\<String> 是错误的。由于Arraylist\<String>并没有在JVM中存储为单独一个类，所以，在运行时使用它是毫无意义的

***

- **限制1:不能使用new E()**

  不能使用泛型类型参数创建实例。例如，下面的语句是错误的:
  `E object = new E();`
  出错的原因是运行时执行的是new E()， 但是运行时泛型类型E是不可用的。

- **限制2:不能使用new E[]**
  不能使用泛型类型参数创建数组。例如，下面的语句是错误的:
  `E[] elements = new E[capacity];`

  - 可以通过创建一个Object类型的数组，然后将它的类型转换为E[]来规避这个限制

  `E[] elements = (E[])new Object [capacity];`

  - 但是，类型转换到(E[])会导致一个免检的编译警告。该警告会出现是因为编译器无法确保在运行时类型转换是否能成功
  - 例如，如果E是String,而new 0bject[]是Integer对象的数组，那么`(String[])(new Object[]) `将会导致ClassCastException异常
  - 使用泛型类创建泛型数组也是不允许的。例如，下 面的代码是错误的: 
    `ArrayList<String>[] list = new ArrayList<String>[10];`
    可以使用下面的代码来规避这种限制:
    `ArrayList<String>[] list = (ArrayList<String>[])newArrayList[10];`
    然而，你依然会得到一个编译警告

- **限制3:在静态上下文中不允许类的参数是泛型类型**
  由于泛型类的所有实例都有相同的运行时类，所以泛型类的静态变量和方法是被它的所有实例所共享的。因此，在静态方法、数据域或者初始化语句中，为类引用泛型类型参数是非法的。例如，下面的代码是非法的:

  ```java
  public class Test<E> {
      public static void m(E o1) { // illegal
      }
      public static E o1; // illegal
      static {
      	E o2; // illegal 
      }
  }
  ```

***

### 1.8泛型矩阵类

- 使用泛型类型来计算矩阵运算的类
- 对于所有矩阵，除了元素类型不同以外，它们的加法和乘法操作都是类似的。
- 因此，可以设计一个父类，不管它们的元素类型是什么，该父类描述所有类型的矩阵共享的通用操作，还可以创建若千个适用于指定矩阵类型的子类
- 这里的示例学习给出了两种类型int和Rational的实现。对于int类型而言，包装类Integer应该用于将一个int类型的值包装到一个对象中，从而对象被传递给方法进行操作

***

- 该类的类图如图19-7所示。
  - 方法`addMatrix`和方法`multiplyMatrix`将泛型类型E\[][]的两个矩阵进行相加和相乘
  - 静态方法printResult显示矩阵、操作以及它们的结果
  - 方法add、multiply和zero都是抽象的，因为它们的实现依赖于数组元素的特定类型

![image-20200728222741238](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728222741238.png)

- IntegerMatrix和RationalMatrix是GenericMatrix的具体子类。这两个类实现了在GenericMatrix类中定义的add、multiply 和zero方法

***

```java
package Genericity;

public abstract class GenericMatrix<E extends Number> {
    //抽象方法，将两个矩阵元素相加
    protected abstract E add(E o1, E o2);
    //抽象方法，将两个矩阵元素相乘
    protected abstract E multiply(E o1, E o2);
    //抽象方法，将矩阵元素定义为0
    protected abstract E zero();

    //矩阵加法运算
    public E[][] addMatrix(E[][] matrix1,E[][] matrix2){
        //检查边界
        if((matrix1.length != matrix2.length) || (matrix1[0].length != matrix2.length))
            throw new RuntimeException("The matrix doesn't hava same size.");

        E[][] result = (E[][])new Number[matrix1.length][matrix1[0].length];

        //进行加法运算
        for(int i = 0; i < matrix1.length; i++)
            for(int j = 0; j < matrix1[i].length; j++)
                result[i][j] = add(matrix1[i][j],matrix2[i][j]);
        return result;
    }

    //矩阵乘法运算
    public E[][] multiplyMatrix(E[][] matrix1, E[][] matrix2){
        //检查边界
        if(matrix1.length != matrix2[0].length)
            throw new RuntimeException("The matrices do not have compable length");

        E[][] result = (E[][]) new Number[matrix1.length][matrix2[0].length];

        //进行乘法运算
        for(int i = 0; i < result.length; i++){
            for(int j = 0; j < result[0].length; j++){
                result[i][j] = zero();

                for(int k = 0; k < result.length; k++){
                    result[i][j] = add(result[i][j], multiply(matrix1[i][k], matrix2[k][i]));
                }
            }
        }
        return result;
    }

    //打印矩阵，运算符operation，和结果
    public static void printResult(Number[][] m1, Number[][] m2, Number[][] m3, char op){
        for(int i = 0; i < m1.length; i++){
            //打印第一个矩阵
            for(int j = 0; j < m1[0].length; j++)
                System.out.print(" " + m1[i][j]);

            if(i == m1.length/2)
                System.out.print(" " + op + " ");
            else 
                System.out.print("  ");

            //打印第二个矩阵
            for(int j = 0; j < m1[0].length; j++)
                System.out.print(" " + m2[i][j]);

            if(i == m1.length/2)
                System.out.print(" = ");
            else 
                System.out.print("  ");

            for(int j = 0; j < m3.length; j++)
                System.out.print(m3[i][j] + " ");

            System.out.println();
        }
    }
}
```

- 程序清单19-10实现了GenericMatrix类。 第1行的\<E extends. Number> 指明该泛型类
  型是Number的子类型。
- 三个抽象方法add、multiply和zero在第3、6和9行定义。这些方法是抽象的，因为在不知道元素的确切类型时我们是不能实现它们的。
- addMatrix方法(第12 ~ 30行)和mu1tip1yMatrix方法(第33~ 57行)实现了两个矩阵的相加和相乘
- 所有这些方法都必须是非静态的，因为它们使用的是泛型类型E来表示类
- printResult方法(第60~ 84行)是静态的，因为它没有绑定到特定的实例
- 矩阵元素的类型是Number的泛型子类。这样就可以使用任意Number子类的对象，只要在子类中实现了抽象方法add、 multiply和zero即可
- addMatrix和mu1tiplyMatrix方法(第12~ 57行)是具体的方法。只要在子类中实现了add、multiply和zero方法，就可以使用它们。
- addMatrix和multip1yMatrix方法在进行操作之前检查矩阵的边界。如果两个矩阵的边界不匹配，那么程序会抛出一个异常(第16和36行)。

***

```java
package Genericity;

public class TestIntegerMatrix {
    public static void main(String[]args) {
        Integer[][] m1 = new Integer[][]{{1, 2, 3},{4, 5, 6},{1, 1, 1}};
        Integer[][] m2 = new Integer[][]{{1, 1, 1},{2, 2, 2},{0, 0, 0}};
        
        IntegerMatrix integerMatrix = new IntegerMatrix();
        System.out.println("\nm1 + m2 is: ");
        GenericMatrix.printResult(m1, m2, integerMatrix.addMatrix(m1,m2),'+');
        System.out.println("\nm1 * m2 is: ");
        GenericMatrix.printResult(m1, m2, integerMatrix.multiplyMatrix(m1,m2), '*');
    }
}
```

- 程序清单19-11实现了IntegerMatrix类。该类在第1行继承了`GenericMatrix <Integer>`。

- 在泛型实例化之后，`GenericMatrix<Integer>`中的add方法就成为

  `Integer add(Integero1,Integer o2)`

- 该程序实现了Integer对象的add、multiply和zero方法

- 因为这些方法只能被addMatrix和multiplyMatrix方法调用，所以，它们仍然是protected 的

***

## 2.线性表，栈，队列，优先队列

### 2.2合集

- Collection接口为线性表、向量、栈、队列，优先队列以及集合定义了共同的操作
- Java合集框架支持以下两种类型的容器:
  - 一种是为了**存储一个元素合集**，简称为合集(collection)。
  - 另一种是为了存储键/值对，称为映射表(map)。
- 映射表是一个用于使用一个键( key)快速搜索一个 元素的高效数据结构。
- 我们将在下章介绍映射表。现在我们将注意力集中在以下合集上。
  - Set用于存储一组不重复的元素。
  - List用于存储一个有序元素合集。
  - Stack 用于存储采用后进先出方式处理的对象。
  - Queue用于存储采用先进先出方式处理的对象。
  - Priority Queue用于存储按照优先级顺序处理的对象。

![image-20200729101323915](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200729101323915.png)

- 注意:在Java合集框架中定义的所有接口和类都分组在java.util包中
- 设计指南: Java合集框架的设计是使用接口、抽象类和具体类的一个很好的例子
  - 用接口定义框架。抽象类提供这个接口的部分实现。
  - 具体类用具体的数据结构实现这个接口。
  - 提供一个部分实现接口的抽象类对用户编写代码提供了方便。
  - 用户可以简单地定义一个具体类继承自抽象类，而无须实现接口中的所有方法。
  - 为了方便，提供了如AbstractCollection这样的抽象类。因为这个原因，这些抽象类被称为**便利抽象类**

***

- Collection接口是处理对象合集的**根接口**。
- 它的公共方法在图20-2中列出。
- Abstract-Collection类提供Collection接口的部分实现。除了add、size 和iterator方法之外，它
  实现了Collection接口中的其他所有方法。add、size 和iterator等方法在合适的子类中实现。
- Collection接口提供了在集合中添加与删除元素的基本操作。
  - add方法给合集添加一个元素
  - addAll方法把指定集合中的所有元素添加到这个合集中
  - remove 方法从集合中删除一个元素
  - removeAll方法从这个集合中删除指定合集中的所有元素
  - retainAll方法保留既出现在这个合集中也出现在指定合集中的元素。
  - 所有这些方法都返回boolean值
- 如果执行方法改变了合集，则返回True

![](C:\Users\13793\Desktop\学习笔记\Java学习\30.png)

- 方法addAll、removeAll、 retainAll 类似于集合上的并、差、交运算。

- Collection接口提供了多种查询操作。

  - 方法**size**返回合集中元素的个数。
  - 方法**contains**检测合集中是否包含指定的元素。
  - 方法**containsAll**检测这个合集是否包含指定合集中的所有元素。
  - 如果合集为空，方法i**sEmpty**返回true。
  - Collection接口提供的**toArray()**方法返回一个合集的数组表示。

- 设计指南: Collection接口中的有些方法是不能在具体子类中实现的。

  - 在这种情况下，这些方法会抛出异常**java.lang. UnsupportedOperationException**，它是Runtime-
    Exception异常类的一个子类。这样设计很好，可以在自己的项目中使用。

  - 如果一个方法在子类中没有意义，可以按如下方式实现它:

    ```java
    public void someMethod() {
    	throw new UnsupportedOperationException
    		("Method not supported") ;
    }
    ```


```java
import java.util.*;

public class TestCollection{
    public static void main(String[] args) {
        ArrayList<String> collection1 = new ArrayList<>();
        collection1.add("London");
        collection1.add("Beijing");
        collection1.add("Shanghai");
        collection1.add("Nanchang");
        System.out.println("A list of collection1:");
        System.out.println(collection1);
        System.out.println("Is Nanchang in collection1?" + collection1.contains("nanchang"));
        collection1.remove(1);
        System.out.println(collection1.size() + "cities are in collections now");
        ArrayList<String> c1 = (ArrayList<String>)(collection1.clone());
        c1.addAll(collection1);
        System.out.println(c1);
    }
}
```

****

### 2.3迭代器

- 每种合集都是**可迭代的( Iterable)**。可以获得集合的Iterator对象来遍历合集中的所有元素
- Iterator是一种经典的设计模式，用于在不需要暴露数据是如何保存在数据结构的细节的情况下，来遍历一个数据结构。
- Collection接口继承自Iterable接口
  - Iterable 接口中定义了iterator方法，**该方法会返回一个迭代器**
  - Iterator 接口为遍历各种类型的合集中的元素提供了一种**统一的方法**
  - Iterable 接口中的 iterator() 方法返回一个Iterator的实例
    - 如图20-2所示，它使用next()方法提供了对合集中元素的顺序访问
    - 还可以使用hasNext()方法来检测迭代器中是否还有更多的元素
    - 以及remove()方法来移除迭代器返回的最后一个元素

```java
import java.util.*;
public class TestIterator{
    public static void main(String[] args) {
        Collection<String> collection = new ArrayList<>() ;
        collection.add("New York") ;
        collection.add("Atlanta");
        collection.add("Dallas");
        collection.add("Madison");

        Iterator<String> iterator = collection.iterator();
        while (iterator.hasNext()) {
        	System.out.print(iterator.next().toUpperCase() + " ");
    	}
    	System.out.println();
    }
}
```

- 程序使用ArrayList (第4行)创建一个具体的合集对象
- 然后添加4个字符串到线性表中(第5~8行)
- 程序然后获得合集的一个迭代器(第10行)，并使用该迭代器来遍历线性表中的所有字符串，然后以大写方式来显示该字符串

***

### 2.4线性表

- List接口继承自Collection接口，定义了一个用于顺序存储元素的合集。
- 可以使用它的两个具体类ArrayList或者LinkedList来创建一个线性表(list)。
- 现在我们将更深人地来考察ArrayList。本节中我们还将介绍另外一种有用的线性表一LinkedList。

***

#### 2.4.1List 接口中的通用方法

- ArrayList和LinkedList定义在List接口下。
- List接口继承Collection接口，定义了一个允许重复的有序合集
- List 接口增加了面向位置的操作，并且增加了一个能够双向遍历线性表的新线性表迭代器。List接口中的方法如图20-3所示。

![image-20200729162320279](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200729162320279.png)

***

![image-20200729162737438](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200729162737438.png)

```java
public class TestArrayAndLinkedList {
    public static void main(String[] args) {
        List<Integer> arrayList = new ArrayList<>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(3,25);
        arrayList.add(0,45);
        System.out.println(arrayList);
        LinkedList<Object> linkedList = new LinkedList<>(arrayList);
        linkedList.add(1,"red");
        linkedList.add(4,"green");
        System.out.println(linkedList);
        System.out.println("Sublist: " + linkedList.subList(2, 5));
        ListIterator<Object> listIterator = linkedList.listIterator();
        while(listIterator.hasNext()){
            System.out.println(listIterator.next() + " ");
        }
        System.out.println();
        listIterator = linkedList.listIterator(linkedList.size());
        while(listIterator.hasPrevious()){
            System.out.println(listIterator.previous() + " ");
        }
    }   
}
```

- 线性表可以存储相同的元素。整数1就在线性表中存储了两次（第6和9行)。
- ArrayList获取元素的效率比较高
- 若在线性表的起始位置插入和删除元素，那么LinkedList的效率会高一些。
- 两种线性表在插入和删除元素上具有相同的性能
  - 链表可以使用get(i)）方法，但这是一个耗时的操作。不要使用它来遍历线性表中的所有元素，如a所示。
  - 应该使用一个迭代器，如b所示。注意foreach循环隐式地使用了迭代器。当在第24章中学习如何实现一个链表的时候，你将知道原因。

![image-20200730094040713](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200730094040713.png)

- 提示:为了从可变长参数表中创建线性表，Java提供了静态的asList方法。这样，就可以使用下面的代码创建一个字符串线性表和一个整数线性

```java
List<String>list1 = Arrays.asList("red"，"green"，"blue");
List<Integer> list2 = Arrays.asList(10, 20，30，40,50)
```

***

### 2.5Comparator接口

- Comparator 可以用于比较没有实现Comparable的类的对象
- 如果元素的类没有实现Comparable接口又将如何呢? 这些元素可以比较么?
- 可以定义一个比较器(comparator）来比较不同类的元素
- 要做到这一点，需要创建一个实现`java.util.Comparator<T>`接口的类并重写它的compare方法。
  - 如果element1小于element2，就返回一个负值
  - 如果element1大于element2，就返回一个正值
  - 若两者相等，则返回0。
- `public int compare(T element1，T element2)`

***

### 2.6线性表和合集的静态方法

- Collections类包含了**执行合集和线性表中通用操作**的静态方法。
- 11.12节中介绍了Collections类中针对数组线性表的一些静态方法
- Collections类包含用于线性表的sort binarySearch、 reverse、shufflecopy 和 fill方法，以及用于合集的max、min、 disjoint和 frequency方法，如图20-7所示。

![image-20200730095122699](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200730095122699.png)

***

### 2.8向量类和栈类

- 在Java APl中，Vector是AbstractList的子类，Stack是Vector的子类。
- 除了包含用于访问和修改向量的同步方法之外，Vector类与ArrayList是一样的。
- 同步方法用于**防止两个或多个线程同时访问和修改某个向量**时引起数据损坏。我们将在第30章讨论同步问题
- 对于许多不需要同步的应用程序来说，使用ArrayList比使用Vector效率更高
- Vector类继承了AbstractList类，它还包含Java2以前的版本中原始Vector类中的方法

![](C:\Users\13793\Desktop\学习笔记\Java学习\31.png)

****

- 栈类Stack是作为Vector的扩展来实现的

![image-20200730102759132](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200730102759132.png)

***

### 2.9队列和优先队列

- 在优先队列中，具有最高级优先级的元素先被移除
- 队列( queue）是一种先进先出的数据结构。元素被追加到队列末尾，然后从队列头删除。
- 在优先队列(priority queue）中，元素被赋予优先级，当访问元素时，拥有最高优先级的元素首先被删除

#### 2.9.1Queue接口

![image-20200730103152557](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200730103152557.png)

- Queue接口继承自Collection，加入了插入，提取，检验等操作
  - 方法offer用于向队列添加一个元素。这个方法类似于Collection接口中的add方法，但是offer方法更适用于队列
  - 方法poll()和方法remove()类似，但是如果队列为空，方法poll()会返回null，而方法remove()会抛出一个异常
  - 方法peek()和方法element()类似，但是如果队列为空，方法 peek()会返回null,而方法element()会抛出一个异常

***

#### 2.9.2双端队列Dueue和链表LinkedList

- LinkedList类实现了Deque接口，Deque又继承自Queue接口，如图20-13所示。
- 因此，可以使用LinkedList创建一个队列
- LinkedList很适合用于进行队列操作，因为它可以高效地在线性表两端插入和删除元素

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20200730103957221.png" alt="image-20200730103957221" style="zoom: 50%;" />

- Deque接口继承目Queue，方法addFirst(e)、removeFirst()、addLast(e)、removeLast()、getFirst()和getLast(）都在 Deque接口中定义。

```java
public class TestQueue {
    public static void main(String[] args) {
        Queue<String> queue = new LinkedList<>();
        queue.offer("Aha");
        queue.offer("you");
        queue.offer("belong");
        queue.offer("to me!");
        while(queue.size() > 0)
            System.out.print(queue.remove() + " ");
    }
}
```

- 程序清单给出一个使用队列存储字符串的例子
- 程序第3行使用LinkedList创建一个队列，第4～7行将4个字符串添加到队列
- 在Collection接口中定义的方法size()返回队列中的元素数目(第8行)
- 方法 remove()获取并删除队列头的元素(第9行)。

***

- PriorityQueue类实现了一个优先队列，如图20-14所示。
- 默认情况下，优先队列使用Comparable以元素的自然顺序进行排序
  - 拥有最小数值的元素被赋予最高优先级，因此最先从队列中删除
  - 如果几个元素具有相同的最高优先级，则任意选择一个
  - 也可以使用构造方法`PriorityQueue(initialCapacity,comparator)`中的Comparator来指定一个顺序

![image-20200730105225057](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200730105225057.png)

```java
import java.util.*;
public class PriorityQueueDemo {
    public static void main(String[] args) {
        PriorityQueue<String> queue = new PriorityQueue<>();
        queue.offer("Liu");
        queue.offer("jia");
        queue.offer("yi");
        queue.offer("I love you!");
        while(queue.size() > 0){
            System.out.println(queue.remove() + " ");
        }
    }
}
```

- 程序清单2给出一个使用优先队列存储字符串的例子。
  - 程序第5行使用无参构造方法创建字符串优先队列
  - 这个优先队列以字符串的自然顺序进行排序，这样，字符串以升序从队列中删除

***

### 2.10表达式求值

- 这个问题可以使用两个栈来解决，命名为operandStack和operatorStack，分别用于存储操作数和操作符
  - 操作数和操作符在被处理前被压入栈中
  - 当一个操作符被处理时，它从operatorStack中弹出，并应用于operandStack的前面两个操作数（两个操作数是从operandStack中弹出的）
  - 结果数值被压回operandStack.

 - 阶段1:扫描表达式
   - 如果提取的项是操作数，则将其压人 operandStack
   - 如果提取的项是+或-运算符，处理在operatorStack栈顶的所有运算符，将提取出的运算符压入operatorStack
   - 如果提取的项是\*或/运算符，处理在operatorStack栈顶的所有*和/运算，将提取出的运算符压入operatorStack
   - 如果提取的项是“(”符号，将它压入operatorStack。
   - 如果提取的项是“）”符号，重复处理来自operatorStack栈顶的运算符，直到看到栈上的“(”符号。
- 阶段2:清除栈
  - 重复处理来自operatorStack栈顶的运算符，直到operatorStack为空为止。
  - 表20-1显示了如何应用该算法来计算表达式(1+2)*4-3。

![](C:\Users\13793\Desktop\学习笔记\Java学习\32.png)

```Java
package DataStructure;

import java.util.*;

public class EvaluateExpression {
    public static void main(String[] args) {
        if(args.length != 1){
            System.out.println("ERROR!");
            System.exit(-1);
        }
        try{
            System.out.println(evaluateExpression(args[0]));
        }
        catch(Exception ex){
            System.out.println("ERROR! " + args[0]);
        }
    }

    public static int evaluateExpression(String expression){
        Stack<Integer> operandStack = new Stack<>();
        Stack<Character> operatorStack = new Stack<>();
        expression = insertBlanks(expression);
        String[] tokens = expression.split(" ");
        for(String token: tokens){
            if(token.length() == 0)
                continue;
            else if(token.charAt(0) == '+' && token.charAt(0) == '-'){
                while(!operatorStack.isEmpty() &&(
                operatorStack.peek() == '+' ||
                operatorStack.peek() == '-' ||
                operatorStack.peek() == '*' ||
                operatorStack.peek() == '/' ))
                    processAnOperator(operandStack,operatorStack);
                operatorStack.push(token.charAt(0));
            }
            else if(token.charAt(0) == '*' || token.charAt(0) == '/'){
                while(!operatorStack.isEmpty() &&
                    (operatorStack.peek() == '*' ||
                    operatorStack.peek() == '/'))
                    processAnOperator(operandStack,operatorStack);
                operatorStack.push(token.charAt(0));
            }
            else if(token.trim().charAt(0) == '(')
                operatorStack.push('(');
            else if(token.trim().charAt(0) == ')'){
                while(operatorStack.peek() != '(')
                    processAnOperator(operandStack,operatorStack);
                operatorStack.pop();
            }
            else{
                operandStack.push(new Integer(token));
            }
        }     
        while(!operatorStack.isEmpty()){
            processAnOperator(operandStack,operatorStack);
        }
        return operandStack.pop();
    }

    public static void processAnOperator(Stack<Integer> operandStack, Stack<Character> operatorStack){
        char op = operatorStack.pop();
        int op1 = operandStack.pop();
        int op2 = operandStack.pop();
        if(op == '+')
            operandStack.push(op2 + op1);
        else if (op == '-')
            operandStack.push(op2 - op1);
        else if(op == '*')
            operandStack.push(op1 * op2);
        else if (op =='/')
            operandStack.push(op2 / op1);
    }

    public static String insertBlanks(String s){
        String result="";
        for (int i = 0; i < s.length();i++){
            if(s.charAt(i) == '(' || s.charAt(i) == ')' ||
               s.charAt(i) == '+' || s.charAt(i) == '-' ||
               s.charAt(i) == '*' || s.charAt(i) == '/')
                result += " "+ s.charAt(i) + " ";
            else
                result += s.charAt(i);
        }
        return result;
    }
}
```

***

## 3.实现线性表、栈、队列

- 设计指南:通用的操作可以归纳为一个接口或者一个抽象类。
  - 一个好的策略就是在设计中提供接口和便利抽象类，以整合接口和抽象类的优点，这样用户可以认为哪个方便就用哪个。
  - 抽象类提供了接口的骨架实现，可以更有效地实现接口



![image-20200731081914124](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200731081914124.png)

```java
package List;


public interface MyList<E> extends java.lang.Iterable<E>{
    public void add(E e);
    //在链表末端加入元素
    public void add(int index, E e);
    //指定位置添加元素
    public void clear();
    //清空链表
    public boolean contains(E e);
    //判断是否存在
    public E get(int Index);
    //取出指定位置元素
    public int indexOf(E e);
    //返回第一个匹配的元素位置，若不存在则返回-1
    public boolean isEmpty();
    //若为空则返回true
    public int lastIndexOf(E e);
    //返回最后一个匹配的元素，若不存在则返回-1
    public boolean remove(E e);
    //移除第一个匹配的元素，若成功则返回true
    public E remove(int index);
    //移除特定位置的元素，并将其返回
    public Object set(int index, E e);
    //替换特定位置的元素，并将该元素返回
    public int size();
    //返回链表的长度
}
```

***

- 下面的类可以实现isEmpty()，size()，remove()，add()

![image-20200731093450417](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200731093450417.png)

- MyAbstractList实现了接口的部分实现

***

```java
package List;

import org.graalvm.compiler.nodes.calc.ObjectEqualsNode;

public abstract class MyAbstractList<E> implements MyList<E> {
    protected int size = 0;     //  线性表的长度

    //创建一个默认列表
    public MyAbstractList(){

    } 

    //从一组对象中创建线性表
    public MyAbstractList(E[] Objects){
        for(int i = 0; i < Objects.length(); i++)
            add(Objects[i]);
    }

    @Override
    public void add(E e){
        add(size,e);
    }

    @Override
    public boolean isEmpty(){
        return size == 0;
    }

    @Override
    public int size(){
        return size;
    }

    @Override
    public boolean remove(E e){
        if(indexOf(e) >= 0){
            remove(indexOf(e));
            return true;
        }
        else 
            return false;
    }
}
```

 - 设计指南:被保护的数据域一般很少使用，但是，将MyAbstractList类中的size数据域设置为被保护的是一个很好的选择。
 - MyAbstractList的子类可以访问size,但是，在不同包中的MyAbstractList的非子类不能访问它。作为一个常用规则，可以将抽象类中的数据域声明为被保护的。

***

### 3.1数组线性表

- 数组是一种大小固定的数据结构。数组-旦创建之后，它的大小就无法改变。
- 尽管如此，仍然可以使用数组来实现动态的数据结构。处理的方法是，当数组不能再存储线性表中的新元素时，创建一个更大的新数组来替换当前数组。

![image-20200731102425051](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200731102425051.png)

- MyArrayList使用数组实现线性表

```java
package List;

public class MyArrayList<E> extends MyAbstractList<E> {
    public static final int INITIAL_CAPACITY = 16;
    public E[] data = (E[])(new Object[INITIAL_CAPACITY]);
    
    //创建默认列表
    public MyArrayList(){
    }

    //从一个对象列表创建数组
    public MyArrayList(E[] Objects){
        for(int i = 0; i < Objects.length; i++)
            add(Objects[i]);
    }

    @Override
    public void add(int index, E e){
        ensureCapacity();
        for(int i = size - 1; i >= index; i--){
            data[i+1] = data[i];
        }
        data[index] = e;
        size++;
    }

    private void ensureCapacity(){
        if(size > data.length){
            E[] newdata = (E[]) (new Object[size*2 + 1]);
            System.arraycopy(data, 0, newdata, 0, size);
            data = newdata;
        }
    }

    @Override
    public void clear(){
        data = (E[]) (new Object[INITIAL_CAPACITY]);
        size = 0;
    }

    @Override
    public boolean contains(E e){
        for(int i = 0; i < size; i++)
            if(e.equals(data[i]))
                return true;
        return false;
    }

    @Override
    public E get(int index){
        checkIndex(index);
        return data[index];
    }

    private void checkIndex(int index){
        if(index < 0 || index >= size)
            throw new IndexOutOfBoundsException
                ("index " + index + " out of bound");
    }

    @Override
    public int indexOf(E e){
        for(int i = 0; i < size; i++)
            if(e.equals(data[i]))
                return i;
        return -1;
    }

    @Override
    public int lastIndexOf(E e){
        for(int i = size - 1; i >= 0; i++)
            if(e.equals(data[i]))
                return i;
        return -1;
    }

    @Override
    public E remove(int index){
        checkIndex(index);
        E e = data[index];
        for(int j = index; j < size; j++)
            data[j] = data[j+1];
        data[size-1] = null;
        size--;
        return e;
    }

    @Override
    public E set(int index, E e){
        checkIndex(index);;
        E old = data[index];
        data[index] = e;
        return old;
    }

    @Override
    public String toString(){
        StringBuilder result= new StringBuilder("[");
        for(int i = 0; i < size; i++){
            result.append(data[i]);
            if(i < size - 1)
                result.append(",");
        }
        return result.toString();  
    }

    public void trimToSize(){
        if(size != data.length){
            E[] newdata = (E[]) (new Object[size]);
            System.arraycopy(data, 0, newdata, 0, size);
            data = newdata;
        }
    }

    @Override
    public java.util.Iterator<E> iterator(){
        return new ArrayListIterator();
    }

    private class ArrayListIterator implements java.util.Iterator<E>{
        private int current = 0;

        @Override
        public boolean hasNext(){
            return(current < size);
        }

        @Override
        public E next(){
            return data[current++];
        }

        @Override
        public void remove(){
            MyArrayList.this.remove(current);
        }

    }
}
```

***

## Java

### 类加载

- JVM 中内置了三个重要的 ClassLoader，除了 BootstrapClassLoader 其他类加载器均由 Java 实现且全部继承自`java.lang.ClassLoader`：

1. **BootstrapClassLoader(启动类加载器)** ：最顶层的加载类，由C++实现，负责加载 `%JAVA_HOME%/lib`目录下的jar包和类或者或被 `-Xbootclasspath`参数指定的路径中的所有类。
2. **ExtensionClassLoader(扩展类加载器)** ：主要负责加载目录 `%JRE_HOME%/lib/ext` 目录下的jar包和类，或被 `java.ext.dirs` 系统变量所指定的路径下的jar包。
3. **AppClassLoader(应用程序类加载器)** :面向我们用户的加载器，负责加载当前应用classpath下的所有jar包和类。

**双亲委派模型介绍**

- 每一个类都有一个对应它的类加载器。系统中的 ClassLoder 在协同工作的时候会默认使用 **双亲委派模型** 。即在类加载的时候，系统会首先判断当前类是否被加载过。
- 已经被加载的类会直接返回，否则才会尝试加载。加载的时候，首先会把该请求委派该父类加载器的 `loadClass()` 处理，因此所有的请求最终都应该传送到顶层的启动类加载器 `BootstrapClassLoader` 中。
- 当父类加载器无法处理时，才由自己来处理。当父类加载器为null时，会使用启动类加载器 `BootstrapClassLoader` 作为父类加载器

<img src="https://my-blog-to-use.oss-cn-beijing.aliyuncs.com/2019-6/classloader_WPS%E5%9B%BE%E7%89%87.png" alt="ClassLoader" style="zoom:67%;" />

每个类加载都有一个父类加载器，我们通过下面的程序来验证。

```java
public class ClassLoaderDemo {
    public static void main(String[] args) {
        System.out.println("ClassLodarDemo's ClassLoader is " + 												ClassLoaderDemo.class.getClassLoader());
        System.out.println("The Parent of ClassLodarDemo's ClassLoader is " + 									ClassLoaderDemo.class.getClassLoader().getParent());
        System.out.println("The GrandParent of ClassLodarDemo's ClassLoader is " + 						ClassLoaderDemo.class.getClassLoader().getParent().getParent());
    }
}

//ClassLodarDemo's ClassLoader is sun.misc.Launcher$AppClassLoader@18b4aac2
//The Parent of ClassLodarDemo's ClassLoader is sun.misc.Launcher$ExtClassLoader@1b6d
//The GrandParent of ClassLodarDemo's ClassLoader is null

```

`AppClassLoader`的父类加载器为`ExtClassLoader` `ExtClassLoader`的父类加载器为null，**null并不代表`ExtClassLoader`没有父类加载器，而是 `BootstrapClassLoader`** 。

***

- 双亲委派模型的实现代码非常简单，逻辑非常清晰，都集中在 `java.lang.ClassLoader` 的 `loadClass()` 中，相关代码如下所示。

```java
private final ClassLoader parent; 
protected Class<?> loadClass(String name, boolean resolve)
        throws ClassNotFoundException
    {
        synchronized (getClassLoadingLock(name)) {
            // 首先，检查请求的类是否已经被加载过
            Class<?> c = findLoadedClass(name);
            if (c == null) {
                long t0 = System.nanoTime();
                try {
                    if (parent != null) {//父加载器不为空，调用父加载器loadClass()方法处理
                        c = parent.loadClass(name, false);
                    } else {//父加载器为空，使用启动类加载器 BootstrapClassLoader 加载
                        c = findBootstrapClassOrNull(name);
                    }
                } catch (ClassNotFoundException e) {
                   //抛出异常说明父类加载器无法完成加载请求
                }
                
                if (c == null) {
                    long t1 = System.nanoTime();
                    //自己尝试加载
                    c = findClass(name);

                    // this is the defining class loader; record the stats
                    sun.misc.PerfCounter.getParentDelegationTime().addTime(t1 - t0);
                    sun.misc.PerfCounter.getFindClassTime().addElapsedTimeFrom(t1);
                    sun.misc.PerfCounter.getFindClasses().increment();
                }
            }
            if (resolve) {
                resolveClass(c);
            }
            return c;
        }
    }
```

















### 反射机制

> Java反射即指程序在运行期可以**拿到一个对象的所有信息**

`class`是由JVM在执行过程中动态加载的。JVM在第一次读取到一种`class`类型时，将其加载进内存。

每加载一种`class`，JVM就为其创建一个`Class`类型的实例，并关联起来。注意：这里的`Class`类型是一个名叫`Class`的`class`。它长这样：

```java
public final class Class {
    private Class() {}
}
```

以`String`类为例，当JVM加载`String`类时，它首先读取`String.class`文件到内存，然后，为`String`类创建一个`Class`实例并关联起来：

```
Class cls = new Class(String);
```

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210311080611384.png" alt="image-20210311080611384" style="zoom:67%;" />

- 由于JVM为每个加载的`class`创建了对应的`Class`实例，并在实例中保存了该`class`的所有信息，包括类名、包名、父类、实现的接口、所有方法、字段等，因此，如果获取了某个`Class`实例，我们就可以通过这个`Class`实例获取到该实例对应的`class`的所有信息。
- 这种通过`Class`实例获取`class`信息的方法称为反射（Reflection）。

1. 直接通过一个`class`的静态变量`class`获取：

```
Class cls = String.class;
```

2. 如果我们有一个实例变量，可以通过该实例变量提供的`getClass()`方法获取：

```
String s = "Hello";
Class cls = s.getClass();
```

3. 如果知道一个`class`的完整类名，可以通过静态方法`Class.forName()`获取：

```
Class cls = Class.forName("java.lang.String");
```

因为`Class`实例在JVM中是唯一的，所以，上述方法获取的`Class`实例是同一个实例。

可以用`==`比较两个`Class`实例：

```java
Class cls1 = String.class;

String s = "Hello";
Class cls2 = s.getClass();

boolean sameClass = cls1 == cls2; // true
```

以通过`Class`实例获取所有`Method`信息。`Class`类提供了以下几个方法来获取`Method`：

- `Method getMethod(name, Class...)`：获取某个`public`的`Method`（包括父类）
- `Method getDeclaredMethod(name, Class...)`：获取当前类的某个`Method`（不包括父类）
- `Method[] getMethods()`：获取所有`public`的`Method`（包括父类）
- `Method[] getDeclaredMethods()`：获取当前类的所有`Method`（不包括父类）

```java
public class Main {
    public static void main(String[] args) throws Exception {
        Class stdClass = Student.class;
        // 获取public方法getScore，参数为String:
        System.out.println(stdClass.getMethod("getScore", String.class));
        // 获取继承的public方法getName，无参数:
        System.out.println(stdClass.getMethod("getName"));
        // 获取private方法getGrade，参数为int:
        System.out.println(stdClass.getDeclaredMethod("getGrade", int.class));
    }
}

class Student extends Person {
    public int getScore(String type) {
        return 99;
    }
    private int getGrade(int year) {
        return 1;
    }
}

class Person {
    public String getName() {
        return "Person";
    }
}
```

**调用方法**

当我们获取到一个`Method`对象时，就可以对它进行调用。我们以下面的代码为例：

```java
public class Main {
    public static void main(String[] args) throws Exception {
        // String对象:
        String s = "Hello world";
        // 获取String substring(int)方法，参数为int:
        Method m = String.class.getMethod("substring", int.class);
        // 在s对象上调用该方法并获取结果:
        String r = (String) m.invoke(s, 6);
        // 打印调用结果:
        System.out.println(r);
    }
}
```



















### JAVA 泛型中的通配符

> 泛型提供了编译时类型安全检测机制，该机制允许开发者在编译时检测到非法的类型

- **通常情况下，T，E，K，V，？ 是这样约定的：**
  - ？ 表示不确定的 java 类型
  - T (type) 表示具体的一个java类型
  - K V (key value) 分别代表java键值中的Key Value
  - E (element) 代表Element

- **?** 通配符其实在声明局部变量时是没有什么意义的，但是当你为一个方法声明一个参数时，它是非常重要的。

- 对于不确定或者不关心实际要操作的类型，可以使用无限制通配符（尖括号里一个问号，即 <?> ），表示可以持有任何类型。像 countLegs 方法中，限定了上届，但是不关心具体类型是什么，所以对于传入的 Animal 的所有子类都可以支持，并且不会报错。

```java
static int countLegs (List<? extends Animal > animals ) {
    int retVal = 0;
    for ( Animal animal : animals )
    {
        retVal += animal.countLegs();
    }
    return retVal;
}

static int countLegs1 (List< Animal > animals ){
    int retVal = 0;
    for ( Animal animal : animals )
    {
        retVal += animal.countLegs();
    }
    return retVal;
}

public static void main(String[] args) {
    List<Dog> dogs = new ArrayList<>();
 	// 不会报错
    countLegs( dogs );
	// 报错
    countLegs1(dogs);
}
```

- **上界通配符 < ? extends E>**

  > 上界：用 extends 关键字声明，表示参数化的类型可能是所指定的类型，或者是此类型的子类。

- **下界通配符 < ? super E>**

  > 下界: 用 super 进行声明，表示参数化的类型可能是所指定的类型，或者是此类型的父类型，直至 Object

**总结**

- T 是一个 确定的 类型，通常用于泛型类和泛型方法的**定义**
- ？是一个 不确定 的类型，通常用于泛型方法的**调用代码和形参**，不能用于定义类和泛型方法。























### hashCode()与 equals()

- 下面根据“**类是否覆盖equals()方法**”，将它分为2类。
  (1) 若某个类没有覆盖equals()方法，当它的通过equals()比较两个对象时，实际上是比较两个对象是不是同一个对象。这时，等价于通过“==”去比较这两个对象。
  (2) 我们可以覆盖类的equals()方法，来让equals()通过其它方式比较两个对象是否相等。通常的做法是：若两个对象的内容相等，则equals()方法返回true；否则，返回fasle。

- 讲到这里，顺便说一下java对equals()的要求。有以下几点：

  ```
  1. 对称性：如果x.equals(y)返回是"true"，那么y.equals(x)也应该返回是"true"。
  2. 反射性：x.equals(x)必须返回是"true"。
  3. 类推性：如果x.equals(y)返回是"true"，而且y.equals(z)返回是"true"，那么z.equals(x)也应该返回是"true"。
  4. 一致性：如果x.equals(y)返回是"true"，只要x和y内容一直不变，不管你重复x.equals(y)多少次，返回都是"true"。
  5. 非空性，x.equals(null)，永远返回是"false"；x.equals(和x不同类型的对象)永远返回是"false"。
  ```

- **==** : 它的作用是**判断两个对象的地址是不是相等。**即，判断两个对象是不试同一个对象。

***

### 自动装箱与拆箱

- **装箱**：将基本类型用它们对应的引用类型包装起来；
- **拆箱**：将包装类型转换为基本数据类型；

> Java 基本类型的包装类的大部分都实现了常量池技术，Byte,Short,Integer,Long,Character,Boolean；前面 4 种包装类默认创建了数值[-128，127] 的相应类型的缓存数据，Character 创建了数值在[0,127]范围的缓存数据，Boolean 直接返回 True Or False。如果超出对应范围仍然会去创建新的对象。

```java
private static class IntegerCache {
        static final int high;
        static final Integer cache[];

        static {
            final int low = -128;

            // high value may be configured by property
            int h = 127;
            if (integerCacheHighPropValue != null) {
                // Use Long.decode here to avoid invoking methods that
                // require Integer's autoboxing cache to be initialized
                int i = Long.decode(integerCacheHighPropValue).intValue();
                i = Math.max(i, 127);
                // Maximum array size is Integer.MAX_VALUE
                h = Math.min(i, Integer.MAX_VALUE --low);
            }
            high = h;

            cache = new Integer[(high - low) + 1];
            int j = low;
            for(int k = 0; k < cache.length; k++)
                cache[k] = new Integer(j++);
        }

        private IntegerCache() {}
    }
```

- Integer i1=40；Java 在编译的时候会直接将代码封装成 Integer i1=Integer.valueOf(40);，从而使用常量池中的对象。
- Integer i1 = new Integer(40);这种情况下会创建新的对象。

```java
  Integer i1 = 40;
  Integer i2 = new Integer(40);
  System.out.println(i1 == i2);//输出 false
```

- ```
    Integer i1 = 40;
    Integer i2 = 40;
    Integer i3 = 0;
    Integer i4 = new Integer(40);
    Integer i5 = new Integer(40);
    Integer i6 = new Integer(0);
    
    System.out.println("i1=i2   " + (i1 == i2));
    System.out.println("i1=i2+i3   " + (i1 == i2 + i3));
    System.out.println("i1=i4   " + (i1 == i4));
    System.out.println("i4=i5   " + (i4 == i5));
    System.out.println("i4=i5+i6   " + (i4 == i5 + i6));
    System.out.println("40=i5+i6   " + (40 == i5 + i6));
  ```

  结果：

  ```
  i1=i2   true
  i1=i2+i3   true
  i1=i4   false
  i4=i5   false
  i4=i5+i6   true
  40=i5+i6   true
  ```

  解释：

  语句 i4 == i5 + i6，因为+这个操作符不适用于 Integer 对象，首先 i5 和 i6 进行自动拆箱操作，进行数值相加，即 i4 == 40。然后 Integer 对象无法与数值进行直接比较，所以 i4 自动拆箱转为 int 值 40，最终这条语句转为 40 == 40 进行数值比较。

***

**在 Java 中定义一个不做事且没有参数的构造方法的作用**

> Java 程序在执行子类的构造方法之前，如果没有用 `super()`来调用父类特定的构造方法，则会调用父类中“没有参数的构造方法”。因此，如果父类中只定义了有参数的构造方法，而在子类的构造方法中又没有用 `super()`来调用父类中特定的构造方法，则编译时将发生错误，因为 Java 程序在父类中找不到没有参数的构造方法可供执行。

### Java底层数据结构

<img src="https://guide-blog-images.oss-cn-shenzhen.aliyuncs.com/source-code/dubbo/java-collection-hierarchy.png" alt="img" style="zoom:70%;" />

- `List`(对付顺序的好帮手)： 存储的元素是有序的、可重复的。
- `Set`(注重独一无二的性质): 存储的元素是无序的、不可重复的。
- `Map`(用 Key 来搜索的专家): 使用键值对（kye-value）存储

**set**

- `HashSet`（无序，唯一）: 基于 `HashMap` 实现的，底层采用 `HashMap` 来保存元素
- `LinkedHashSet`：`LinkedHashSet` 是 `HashSet` 的子类，并且其内部是通过 `LinkedHashMap` 来实现的。有点类似于我们之前说的 `LinkedHashMap` 其内部是基于 `HashMap` 实现一样，不过还是有一点点区别的
- `TreeSet`（有序，唯一）： 红黑树(自平衡的排序二叉树)

**List**

- `Arraylist`： `Object[]`数组
- `Vector`：`Object[]`数组
- `LinkedList`： 双向链表(JDK1.6 之前为循环链表，JDK1.7 取消了循环)

**Map**

- `HashMap`： JDK1.8 之前 `HashMap` 由数组+链表组成的，数组是 `HashMap` 的主体，链表则是主要为了解决哈希冲突而存在的（“拉链法”解决冲突）。JDK1.8 以后在解决哈希冲突时有了较大的变化，当链表长度大于阈值（默认为 8）（将链表转换成红黑树前会判断，如果当前数组的长度小于 64，那么会选择先进行数组扩容，而不是转换为红黑树）时，将链表转化为红黑树，以减少搜索时间
- `LinkedHashMap`： `LinkedHashMap` 继承自 `HashMap`，所以它的底层仍然是基于拉链式散列结构即由数组和链表或红黑树组成。另外，`LinkedHashMap` 在上面结构的基础上，增加了一条双向链表，使得上面的结构可以保持键值对的插入顺序。同时通过对链表进行相应的操作，实现了访问顺序相关逻辑。
- `Hashtable`： 数组+链表组成的，数组是 `HashMap` 的主体，链表则是主要为了解决哈希冲突而存在的
- `TreeMap`： 红黑树（自平衡的排序二叉树）

**选用集合**

- 主要根据集合的特点来选用，比如我们需要根据键值获取到元素值时就选用 `Map` 接口下的集合，需要排序时选择 `TreeMap`,不需要排序时就选择 `HashMap`,需要保证线程安全就选用 `ConcurrentHashMap`。
- 当我们只需要存放元素值时，就选择实现`Collection` 接口的集合，需要保证元素唯一时选择实现 `Set` 接口的集合比如 `TreeSet` 或 `HashSet`，不需要就选择实现 `List` 接口的比如 `ArrayList` 或 `LinkedList`，然后再根据实现这些接口的集合的特点来选用。

#### ArrayList

- Java ArrayList class uses a **dynamic array** for storing the elements. 
- It is like an array, but there is no size limit. We can add or remove elements anytime. So, it is much more flexible than the traditional array. It is found in the java.util package. It is like the Vector in C++.
- The ArrayList in Java can have the duplicate elements also. It implements the List interface so we can use all the methods of List interface here. The ArrayList **maintains the insertion order** internally.
- It inherits the AbstractList class and implements List interface.

```java
package java.util;

import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.function.UnaryOperator;


public class ArrayList<E> extends AbstractList<E>
        implements List<E>, RandomAccess, Cloneable, java.io.Serializable
{
    private static final long serialVersionUID = 8683452581122892189L;

    /**
     * 默认初始容量大小
     */
    private static final int DEFAULT_CAPACITY = 10;

    /**
     * 空数组（用于空实例）。
     */
    private static final Object[] EMPTY_ELEMENTDATA = {};

    //用于默认大小空实例的共享空数组实例。
    //我们把它从EMPTY_ELEMENTDATA数组中区分出来，以知道在添加第一个元素时容量需要增加多少。
    private static final Object[] DEFAULTCAPACITY_EMPTY_ELEMENTDATA = {};

    /**
     * 保存ArrayList数据的数组
     */
    transient Object[] elementData; // non-private to simplify nested class access

    /**
     * ArrayList 所包含的元素个数
     */
    private int size;

    /**
     * 带初始容量参数的构造函数（用户可以在创建ArrayList对象时自己指定集合的初始大小）
     */
    public ArrayList(int initialCapacity) {
        if (initialCapacity > 0) {
            //如果传入的参数大于0，创建initialCapacity大小的数组
            this.elementData = new Object[initialCapacity];
        } else if (initialCapacity == 0) {
            //如果传入的参数等于0，创建空数组
            this.elementData = EMPTY_ELEMENTDATA;
        } else {
            //其他情况，抛出异常
            throw new IllegalArgumentException("Illegal Capacity: "+
                                               initialCapacity);
        }
    }

    /**
     *默认无参构造函数
     *DEFAULTCAPACITY_EMPTY_ELEMENTDATA 为0.初始化为10，也就是说初始其实是空数组 当添加第一个元素的时候数组容量才变成10
     */
    public ArrayList() {
        this.elementData = DEFAULTCAPACITY_EMPTY_ELEMENTDATA;
    }

    /**
     * 构造一个包含指定集合的元素的列表，按照它们由集合的迭代器返回的顺序。
     */
    public ArrayList(Collection<? extends E> c) {
        //将指定集合转换为数组
        elementData = c.toArray();
        //如果elementData数组的长度不为0
        if ((size = elementData.length) != 0) {
            // 如果elementData不是Object类型数据（c.toArray可能返回的不是Object类型的数组所以加上下面的语句用于判断）
            if (elementData.getClass() != Object[].class)
                //将原来不是Object类型的elementData数组的内容，赋值给新的Object类型的elementData数组
                elementData = Arrays.copyOf(elementData, size, Object[].class);
        } else {
            // 其他情况，用空数组代替
            this.elementData = EMPTY_ELEMENTDATA;
        }
    }

    /**
     * 修改这个ArrayList实例的容量是列表的当前大小。 应用程序可以使用此操作来最小化ArrayList实例的存储。
     */
    public void trimToSize() {
        modCount++;
        if (size < elementData.length) {
            elementData = (size == 0)
              ? EMPTY_ELEMENTDATA
              : Arrays.copyOf(elementData, size);
        }
    }
//下面是ArrayList的扩容机制
//ArrayList的扩容机制提高了性能，如果每次只扩充一个，
//那么频繁的插入会导致频繁的拷贝，降低性能，而ArrayList的扩容机制避免了这种情况。
    /**
     * 如有必要，增加此ArrayList实例的容量，以确保它至少能容纳元素的数量
     * @param   minCapacity   所需的最小容量
     */
    public void ensureCapacity(int minCapacity) {
        //如果是true，minExpand的值为0，如果是false,minExpand的值为10
        int minExpand = (elementData != DEFAULTCAPACITY_EMPTY_ELEMENTDATA)
            // any size if not default element table
            ? 0
            // larger than default for default empty table. It's already
            // supposed to be at default size.
            : DEFAULT_CAPACITY;
        //如果最小容量大于已有的最大容量
        if (minCapacity > minExpand) {
            ensureExplicitCapacity(minCapacity);
        }
    }
   //得到最小扩容量
    private void ensureCapacityInternal(int minCapacity) {
        if (elementData == DEFAULTCAPACITY_EMPTY_ELEMENTDATA) {
              // 获取“默认的容量”和“传入参数”两者之间的最大值
            minCapacity = Math.max(DEFAULT_CAPACITY, minCapacity);
        }

        ensureExplicitCapacity(minCapacity);
    }
  //判断是否需要扩容
    private void ensureExplicitCapacity(int minCapacity) {
        modCount++;

        // overflow-conscious code
        if (minCapacity - elementData.length > 0)
            //调用grow方法进行扩容，调用此方法代表已经开始扩容了
            grow(minCapacity);
    }

    /**
     * 要分配的最大数组大小
     */
    private static final int MAX_ARRAY_SIZE = Integer.MAX_VALUE - 8;

    /**
     * ArrayList扩容的核心方法。
     */
    private void grow(int minCapacity) {
        // oldCapacity为旧容量，newCapacity为新容量
        int oldCapacity = elementData.length;
        //将oldCapacity 右移一位，其效果相当于oldCapacity /2，
        //我们知道位运算的速度远远快于整除运算，整句运算式的结果就是将新容量更新为旧容量的1.5倍，
        int newCapacity = oldCapacity + (oldCapacity >> 1);
        //然后检查新容量是否大于最小需要容量，若还是小于最小需要容量，那么就把最小需要容量当作数组的新容量，
        if (newCapacity - minCapacity < 0)
            newCapacity = minCapacity;
        //再检查新容量是否超出了ArrayList所定义的最大容量，
        //若超出了，则调用hugeCapacity()来比较minCapacity和 MAX_ARRAY_SIZE，
        //如果minCapacity大于MAX_ARRAY_SIZE，则新容量则为Interger.MAX_VALUE，否则，新容量大小则为 MAX_ARRAY_SIZE。
        if (newCapacity - MAX_ARRAY_SIZE > 0)
            newCapacity = hugeCapacity(minCapacity);
        // minCapacity is usually close to size, so this is a win:
        elementData = Arrays.copyOf(elementData, newCapacity);
    }
    //比较minCapacity和 MAX_ARRAY_SIZE
    private static int hugeCapacity(int minCapacity) {
        if (minCapacity < 0) // overflow
            throw new OutOfMemoryError();
        return (minCapacity > MAX_ARRAY_SIZE) ?
            Integer.MAX_VALUE :
            MAX_ARRAY_SIZE;
    }

    /**
     *返回此列表中的元素数。
     */
    public int size() {
        return size;
    }

    /**
     * 如果此列表不包含元素，则返回 true 。
     */
    public boolean isEmpty() {
        //注意=和==的区别
        return size == 0;
    }

    /**
     * 如果此列表包含指定的元素，则返回true 。
     */
    public boolean contains(Object o) {
        //indexOf()方法：返回此列表中指定元素的首次出现的索引，如果此列表不包含此元素，则为-1
        return indexOf(o) >= 0;
    }

    /**
     *返回此列表中指定元素的首次出现的索引，如果此列表不包含此元素，则为-1
     */
    public int indexOf(Object o) {
        if (o == null) {
            for (int i = 0; i < size; i++)
                if (elementData[i]==null)
                    return i;
        } else {
            for (int i = 0; i < size; i++)
                //equals()方法比较
                if (o.equals(elementData[i]))
                    return i;
        }
        return -1;
    }

    /**
     * 返回此列表中指定元素的最后一次出现的索引，如果此列表不包含元素，则返回-1。.
     */
    public int lastIndexOf(Object o) {
        if (o == null) {
            for (int i = size-1; i >= 0; i--)
                if (elementData[i]==null)
                    return i;
        } else {
            for (int i = size-1; i >= 0; i--)
                if (o.equals(elementData[i]))
                    return i;
        }
        return -1;
    }

    /**
     * 返回此ArrayList实例的浅拷贝。 （元素本身不被复制。）
     */
    public Object clone() {
        try {
            ArrayList<?> v = (ArrayList<?>) super.clone();
            //Arrays.copyOf功能是实现数组的复制，返回复制后的数组。参数是被复制的数组和复制的长度
            v.elementData = Arrays.copyOf(elementData, size);
            v.modCount = 0;
            return v;
        } catch (CloneNotSupportedException e) {
            // 这不应该发生，因为我们是可以克隆的
            throw new InternalError(e);
        }
    }

    /**
     *以正确的顺序（从第一个到最后一个元素）返回一个包含此列表中所有元素的数组。
     *返回的数组将是“安全的”，因为该列表不保留对它的引用。 （换句话说，这个方法必须分配一个新的数组）。
     *因此，调用者可以自由地修改返回的数组。 此方法充当基于阵列和基于集合的API之间的桥梁。
     */
    public Object[] toArray() {
        return Arrays.copyOf(elementData, size);
    }

    /**
     * 以正确的顺序返回一个包含此列表中所有元素的数组（从第一个到最后一个元素）;
     *返回的数组的运行时类型是指定数组的运行时类型。 如果列表适合指定的数组，则返回其中。
     *否则，将为指定数组的运行时类型和此列表的大小分配一个新数组。
     *如果列表适用于指定的数组，其余空间（即数组的列表数量多于此元素），则紧跟在集合结束后的数组中的元素设置为null 。
     *（这仅在调用者知道列表不包含任何空元素的情况下才能确定列表的长度。）
     */
    @SuppressWarnings("unchecked")
    public <T> T[] toArray(T[] a) {
        if (a.length < size)
            // 新建一个运行时类型的数组，但是ArrayList数组的内容
            return (T[]) Arrays.copyOf(elementData, size, a.getClass());
            //调用System提供的arraycopy()方法实现数组之间的复制
        System.arraycopy(elementData, 0, a, 0, size);
        if (a.length > size)
            a[size] = null;
        return a;
    }

    // Positional Access Operations

    @SuppressWarnings("unchecked")
    E elementData(int index) {
        return (E) elementData[index];
    }

    /**
     * 返回此列表中指定位置的元素。
     */
    public E get(int index) {
        rangeCheck(index);

        return elementData(index);
    }

    /**
     * 用指定的元素替换此列表中指定位置的元素。
     */
    public E set(int index, E element) {
        //对index进行界限检查
        rangeCheck(index);

        E oldValue = elementData(index);
        elementData[index] = element;
        //返回原来在这个位置的元素
        return oldValue;
    }

    /**
     * 将指定的元素追加到此列表的末尾。
     */
    public boolean add(E e) {
        ensureCapacityInternal(size + 1);  // Increments modCount!!
        //这里看到ArrayList添加元素的实质就相当于为数组赋值
        elementData[size++] = e;
        return true;
    }

    /**
     * 在此列表中的指定位置插入指定的元素。
     *先调用 rangeCheckForAdd 对index进行界限检查；然后调用 ensureCapacityInternal 方法保证capacity足够大；
     *再将从index开始之后的所有成员后移一个位置；将element插入index位置；最后size加1。
     */
    public void add(int index, E element) {
        rangeCheckForAdd(index);

        ensureCapacityInternal(size + 1);  // Increments modCount!!
        //arraycopy()这个实现数组之间复制的方法一定要看一下，下面就用到了arraycopy()方法实现数组自己复制自己
        System.arraycopy(elementData, index, elementData, index + 1,
                         size - index);
        elementData[index] = element;
        size++;
    }

    /**
     * 删除该列表中指定位置的元素。 将任何后续元素移动到左侧（从其索引中减去一个元素）。
     */
    public E remove(int index) {
        rangeCheck(index);

        modCount++;
        E oldValue = elementData(index);

        int numMoved = size - index - 1;
        if (numMoved > 0)
            System.arraycopy(elementData, index+1, elementData, index,
                             numMoved);
        elementData[--size] = null; // clear to let GC do its work
      //从列表中删除的元素
        return oldValue;
    }

    /**
     * 从列表中删除指定元素的第一个出现（如果存在）。 如果列表不包含该元素，则它不会更改。
     *返回true，如果此列表包含指定的元素
     */
    public boolean remove(Object o) {
        if (o == null) {
            for (int index = 0; index < size; index++)
                if (elementData[index] == null) {
                    fastRemove(index);
                    return true;
                }
        } else {
            for (int index = 0; index < size; index++)
                if (o.equals(elementData[index])) {
                    fastRemove(index);
                    return true;
                }
        }
        return false;
    }

    /*
     * Private remove method that skips bounds checking and does not
     * return the value removed.
     */
    private void fastRemove(int index) {
        modCount++;
        int numMoved = size - index - 1;
        if (numMoved > 0)
            System.arraycopy(elementData, index+1, elementData, index,
                             numMoved);
        elementData[--size] = null; // clear to let GC do its work
    }

    /**
     * 从列表中删除所有元素。
     */
    public void clear() {
        modCount++;

        // 把数组中所有的元素的值设为null
        for (int i = 0; i < size; i++)
            elementData[i] = null;

        size = 0;
    }

    /**
     * 按指定集合的Iterator返回的顺序将指定集合中的所有元素追加到此列表的末尾。
     */
    public boolean addAll(Collection<? extends E> c) {
        Object[] a = c.toArray();
        int numNew = a.length;
        ensureCapacityInternal(size + numNew);  // Increments modCount
        System.arraycopy(a, 0, elementData, size, numNew);
        size += numNew;
        return numNew != 0;
    }

    /**
     * 将指定集合中的所有元素插入到此列表中，从指定的位置开始。
     */
    public boolean addAll(int index, Collection<? extends E> c) {
        rangeCheckForAdd(index);

        Object[] a = c.toArray();
        int numNew = a.length;
        ensureCapacityInternal(size + numNew);  // Increments modCount

        int numMoved = size - index;
        if (numMoved > 0)
            System.arraycopy(elementData, index, elementData, index + numNew,
                             numMoved);

        System.arraycopy(a, 0, elementData, index, numNew);
        size += numNew;
        return numNew != 0;
    }

    /**
     * 从此列表中删除所有索引为fromIndex （含）和toIndex之间的元素。
     *将任何后续元素移动到左侧（减少其索引）。
     */
    protected void removeRange(int fromIndex, int toIndex) {
        modCount++;
        int numMoved = size - toIndex;
        System.arraycopy(elementData, toIndex, elementData, fromIndex,
                         numMoved);

        // clear to let GC do its work
        int newSize = size - (toIndex-fromIndex);
        for (int i = newSize; i < size; i++) {
            elementData[i] = null;
        }
        size = newSize;
    }

    /**
     * 检查给定的索引是否在范围内。
     */
    private void rangeCheck(int index) {
        if (index >= size)
            throw new IndexOutOfBoundsException(outOfBoundsMsg(index));
    }

    /**
     * add和addAll使用的rangeCheck的一个版本
     */
    private void rangeCheckForAdd(int index) {
        if (index > size || index < 0)
            throw new IndexOutOfBoundsException(outOfBoundsMsg(index));
    }

    /**
     * 返回IndexOutOfBoundsException细节信息
     */
    private String outOfBoundsMsg(int index) {
        return "Index: "+index+", Size: "+size;
    }

    /**
     * 从此列表中删除指定集合中包含的所有元素。
     */
    public boolean removeAll(Collection<?> c) {
        Objects.requireNonNull(c);
        //如果此列表被修改则返回true
        return batchRemove(c, false);
    }

    /**
     * 仅保留此列表中包含在指定集合中的元素。
     *换句话说，从此列表中删除其中不包含在指定集合中的所有元素。
     */
    public boolean retainAll(Collection<?> c) {
        Objects.requireNonNull(c);
        return batchRemove(c, true);
    }


    /**
     * 从列表中的指定位置开始，返回列表中的元素（按正确顺序）的列表迭代器。
     *指定的索引表示初始调用将返回的第一个元素为next 。 初始调用previous将返回指定索引减1的元素。
     *返回的列表迭代器是fail-fast 。
     */
    public ListIterator<E> listIterator(int index) {
        if (index < 0 || index > size)
            throw new IndexOutOfBoundsException("Index: "+index);
        return new ListItr(index);
    }

    /**
     *返回列表中的列表迭代器（按适当的顺序）。
     *返回的列表迭代器是fail-fast 。
     */
    public ListIterator<E> listIterator() {
        return new ListItr(0);
    }

    /**
     *以正确的顺序返回该列表中的元素的迭代器。
     *返回的迭代器是fail-fast 。
     */
    public Iterator<E> iterator() {
        return new Itr();
    }
```

- java 中的 `length`属性是针对数组说的,比如说你声明了一个数组,想知道这个数组的长度则用到了 length 这个属性.
- java 中的 `length()` 方法是针对字符串说的,如果想看这个字符串的长度则用到 `length()` 这个方法.
- java 中的 `size()` 方法是针对泛型集合说的,如果想看这个泛型有多少个元素,就调用此方法来查看!

***

#### LinkedList

> Java LinkedList class uses a doubly linked list to store the elements. It provides a linked-list data structure. 

- LinkedList是一个实现了List接口和Deque接口的双端链表。 
- LinkedList底层的链表结构使它支持**高效的插入和删除操作**，另外它实现了Deque接口，使得LinkedList类也具有**队列的特性**

如果想使LinkedList变成线程安全的，可以调用静态类Collections类中的synchronizedList方法：

```java
List list=Collections.synchronizedList(new LinkedList(...));
```



#### HashSet

> Java HashSet class is used to create a collection that uses a hash table for storage. It inherits the AbstractSet class and implements Set interface.

- The important points about Java HashSet class are:
  - HashSet stores the elements by using a mechanism called **hashing.**
  - HashSet contains unique elements only.
  - HashSet allows null value.
  - HashSet class is non synchronized.
  - HashSet is the best approach for search operations.
  - The initial default capacity of HashSet is 16, and the load factor is 0.75.

***

#### HashMap

> HashMap in Java is like the legacy Hashtable class, but it is not synchronized. It allows us to store the null elements as well, but there should be only one null key. 

- Java HashMap contains values based on the key.
- Java HashMap contains only unique keys.
- Java HashMap may have one null key and multiple null values.
- Java HashMap is non synchronized.
- Java HashMap maintains no order.

**“取余(%)操作中如果除数是 2 的幂次则等价于与其除数减一的与(&)操作（也就是说 hash%length==hash&(length-1)的前提是 length 是 2 的 n 次方；）。”** 并且 **采用二进制位操作 &，相对于%能够提高运算效率，这就解释了 HashMap 的长度为什么是 2 的幂次方**

***

**HashMap源码**

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210309090923116.png" alt="image-20210309090923116" style="zoom:70%;" />

**构造方法**

```java
/** 构造方法 1 */
public HashMap() {
    this.loadFactor = DEFAULT_LOAD_FACTOR; // all other fields defaulted
}

/** 构造方法 2 */
public HashMap(int initialCapacity) {
    this(initialCapacity, DEFAULT_LOAD_FACTOR);
}

/** 构造方法 3 */
public HashMap(int initialCapacity, float loadFactor) {
    if (initialCapacity < 0)
        throw new IllegalArgumentException("Illegal initial capacity: " +
                                           initialCapacity);
    if (initialCapacity > MAXIMUM_CAPACITY)
        initialCapacity = MAXIMUM_CAPACITY;
    if (loadFactor <= 0 || Float.isNaN(loadFactor))
        throw new IllegalArgumentException("Illegal load factor: " +
                                           loadFactor);
    this.loadFactor = loadFactor;
    this.threshold = tableSizeFor(initialCapacity);
}

/** 构造方法 4 */
public HashMap(Map<? extends K, ? extends V> m) {
    this.loadFactor = DEFAULT_LOAD_FACTOR;
    putMapEntries(m, false);
}
```

| initialCapacity | HashMap 初始容量                                             |
| --------------- | ------------------------------------------------------------ |
| loadFactor      | 负载因子                                                     |
| threshold       | 当前 HashMap 所能容纳键值对数量的最大值，超过这个值，则需扩容 |

```java
/** The default initial capacity - MUST be a power of two. */
static final int DEFAULT_INITIAL_CAPACITY = 1 << 4;

/** The load factor used when none specified in constructor. */
static final float DEFAULT_LOAD_FACTOR = 0.75f;

final float loadFactor;

/** The next size value at which to resize (capacity * load factor). */
int threshold;
```

计算threshold

```java
/**
 * Returns a power of two size for the given target capacity.
 */
static final int tableSizeFor(int cap) {
    int n = cap - 1;
    n |= n >>> 1;
    n |= n >>> 2;
    n |= n >>> 4;
    n |= n >>> 8;
    n |= n >>> 16;
    return (n < 0) ? 1 : (n >= MAXIMUM_CAPACITY) ? MAXIMUM_CAPACITY : n + 1;
}
```

**查找**

HashMap 的查找操作比较简单，查找步骤与原理篇介绍一致，即先定位键值对所在的桶的位置，然后再对链表或红黑树进行查找。通过这两步即可完成查找，该操作相关代码如下：

```java
public V get(Object key) {
    Node<K,V> e;
    return (e = getNode(hash(key), key)) == null ? null : e.value;
}

final Node<K,V> getNode(int hash, Object key) {
    Node<K,V>[] tab; Node<K,V> first, e; int n; K k;
    // 1. 定位键值对所在桶的位置
    if ((tab = table) != null && (n = tab.length) > 0 &&
        (first = tab[(n - 1) & hash]) != null) {
        if (first.hash == hash && // always check first node
            ((k = first.key) == key || (key != null && key.equals(k))))
            return first;
        if ((e = first.next) != null) {
            // 2. 如果 first 是 TreeNode 类型，则调用黑红树查找方法
            if (first instanceof TreeNode)
                return ((TreeNode<K,V>)first).getTreeNode(hash, key);
                
            // 2. 对链表进行查找
            do {
                if (e.hash == hash &&
                    ((k = e.key) == key || (key != null && key.equals(k))))
                    return e;
            } while ((e = e.next) != null);
        }
    }
    return null;
}

/**
 * 计算键的 hash 值
 */
static final int hash(Object key) {
    int h;
    return (key == null) ? 0 : (h = key.hashCode()) ^ (h >>> 16);	
    //增加扰乱，这样使得哈希值分布更分散
}
/*重新计算 hash 的另一个好处是可以增加 hash 的复杂度。当我们覆写 hashCode 方法时，可能会写出分布性不佳的 hashCode 方法，进而导致 hash 的冲突率比较高。通过移位和异或运算，可以让 hash 变得更复杂，进而影响 hash 的分布性。*/
```

**插入操作**

```java
public V put(K key, V value) {
    return putVal(hash(key), key, value, false, true);
}

final V putVal(int hash, K key, V value, boolean onlyIfAbsent,
               boolean evict) {
    Node<K,V>[] tab; Node<K,V> p; int n, i;
    // 初始化桶数组 table，table 被延迟到插入新数据时再进行初始化
    if ((tab = table) == null || (n = tab.length) == 0)
        n = (tab = resize()).length;
    // 如果桶中不包含键值对节点引用，则将新键值对节点的引用存入桶中即可
    if ((p = tab[i = (n - 1) & hash]) == null)
        tab[i] = newNode(hash, key, value, null);
    else {
        Node<K,V> e; K k;
        // 如果键的值以及节点 hash 等于链表中的第一个键值对节点时，则将 e 指向该键值对
        if (p.hash == hash &&
            ((k = p.key) == key || (key != null && key.equals(k))))
            e = p;
            
        // 如果桶中的引用类型为 TreeNode，则调用红黑树的插入方法
        else if (p instanceof TreeNode)  
            e = ((TreeNode<K,V>)p).putTreeVal(this, tab, hash, key, value);
        else {
            // 对链表进行遍历，并统计链表长度
            for (int binCount = 0; ; ++binCount) {
                // 链表中不包含要插入的键值对节点时，则将该节点接在链表的最后
                if ((e = p.next) == null) {
                    p.next = newNode(hash, key, value, null);
                    // 如果链表长度大于或等于树化阈值，则进行树化操作
                    if (binCount >= TREEIFY_THRESHOLD - 1) // -1 for 1st
                        treeifyBin(tab, hash);
                    break;
                }
                
                // 条件为 true，表示当前链表包含要插入的键值对，终止遍历
                if (e.hash == hash &&
                    ((k = e.key) == key || (key != null && key.equals(k))))
                    break;
                p = e;
            }
        }
        
        // 判断要插入的键值对是否存在 HashMap 中
        if (e != null) { // existing mapping for key
            V oldValue = e.value;
            // onlyIfAbsent 表示是否仅在 oldValue 为 null 的情况下更新键值对的值
            if (!onlyIfAbsent || oldValue == null)
                e.value = value;
            afterNodeAccess(e);
            return oldValue;
        }
    }
    ++modCount;
    // 键值对数量超过阈值时，则进行扩容
    if (++size > threshold)
        resize();
    afterNodeInsertion(evict);
    return null;
}
```

- 插入操作的入口方法是 `put(K,V)`，但核心逻辑在`V putVal(int, K, V, boolean, boolean)` 方法中。putVal 方法主要做了这么几件事情：
  1. 当桶数组 table 为空时，通过扩容的方式初始化 table
  2. 查找要插入的键值对是否已经存在，存在的话根据条件判断是否用新值替换旧值
  3. 如果不存在，则将键值对链入链表中，并根据链表长度决定是否将链表转为红黑树
  4. 判断键值对数量是否大于阈值，大于的话则进行扩容操作

***

**扩容机制**

```java
final Node<K,V>[] resize() {
    Node<K,V>[] oldTab = table;
    int oldCap = (oldTab == null) ? 0 : oldTab.length;
    int oldThr = threshold;
    int newCap, newThr = 0;
    // 如果 table 不为空，表明已经初始化过了
    if (oldCap > 0) {
        // 当 table 容量超过容量最大值，则不再扩容
        if (oldCap >= MAXIMUM_CAPACITY) {
            threshold = Integer.MAX_VALUE;
            return oldTab;
        } 
        // 按旧容量和阈值的2倍计算新容量和阈值的大小
        else if ((newCap = oldCap << 1) < MAXIMUM_CAPACITY &&
                 oldCap >= DEFAULT_INITIAL_CAPACITY)
            newThr = oldThr << 1; // double threshold
    } else if (oldThr > 0) // initial capacity was placed in threshold
        /*
         * 初始化时，将 threshold 的值赋值给 newCap，
         * HashMap 使用 threshold 变量暂时保存 initialCapacity 参数的值
         */ 
        newCap = oldThr;
    else {               // zero initial threshold signifies using defaults
        /*
         * 调用无参构造方法时，桶数组容量为默认容量，
         * 阈值为默认容量与默认负载因子乘积
         */
        newCap = DEFAULT_INITIAL_CAPACITY;
        newThr = (int)(DEFAULT_LOAD_FACTOR * DEFAULT_INITIAL_CAPACITY);
    }
    
    // newThr 为 0 时，按阈值计算公式进行计算
    if (newThr == 0) {
        float ft = (float)newCap * loadFactor;
        newThr = (newCap < MAXIMUM_CAPACITY && ft < (float)MAXIMUM_CAPACITY ?
                  (int)ft : Integer.MAX_VALUE);
    }
    threshold = newThr;
    // 创建新的桶数组，桶数组的初始化也是在这里完成的
    Node<K,V>[] newTab = (Node<K,V>[])new Node[newCap];
    table = newTab;
    if (oldTab != null) {
        // 如果旧的桶数组不为空，则遍历桶数组，并将键值对映射到新的桶数组中
        for (int j = 0; j < oldCap; ++j) {
            Node<K,V> e;
            if ((e = oldTab[j]) != null) {
                oldTab[j] = null;
                if (e.next == null)
                    newTab[e.hash & (newCap - 1)] = e;
                else if (e instanceof TreeNode)
                    // 重新映射时，需要对红黑树进行拆分
                    ((TreeNode<K,V>)e).split(this, newTab, j, oldCap);
                else { // preserve order
                    Node<K,V> loHead = null, loTail = null;
                    Node<K,V> hiHead = null, hiTail = null;
                    Node<K,V> next;
                    // 遍历链表，并将链表节点按原顺序进行分组
                    do {
                        next = e.next;
                        if ((e.hash & oldCap) == 0) {
                            if (loTail == null)
                                loHead = e;
                            else
                                loTail.next = e;
                            loTail = e;
                        }
                        else {
                            if (hiTail == null)
                                hiHead = e;
                            else
                                hiTail.next = e;
                            hiTail = e;
                        }
                    } while ((e = next) != null);
                    // 将分组后的链表映射到新桶中
                    if (loTail != null) {
                        loTail.next = null;
                        newTab[j] = loHead;
                    }
                    if (hiTail != null) {
                        hiTail.next = null;
                        newTab[j + oldCap] = hiHead;
                    }
                }
            }
        }
    }
    return newTab;
}
```

**链表树化**

```java
static final int TREEIFY_THRESHOLD = 8;

/**
 * 当桶数组容量小于该值时，优先进行扩容，而不是树化
 */
static final int MIN_TREEIFY_CAPACITY = 64;

static final class TreeNode<K,V> extends LinkedHashMap.Entry<K,V> {
    TreeNode<K,V> parent;  // red-black tree links
    TreeNode<K,V> left;
    TreeNode<K,V> right;
    TreeNode<K,V> prev;    // needed to unlink next upon deletion
    boolean red;
    TreeNode(int hash, K key, V val, Node<K,V> next) {
        super(hash, key, val, next);
    }
}

/**
 * 将普通节点链表转换成树形节点链表
 */
final void treeifyBin(Node<K,V>[] tab, int hash) {
    int n, index; Node<K,V> e;
    // 桶数组容量小于 MIN_TREEIFY_CAPACITY，优先进行扩容而不是树化
    if (tab == null || (n = tab.length) < MIN_TREEIFY_CAPACITY)
        resize();
    else if ((e = tab[index = (n - 1) & hash]) != null) {
        // hd 为头节点（head），tl 为尾节点（tail）
        TreeNode<K,V> hd = null, tl = null;
        do {
            // 将普通节点替换成树形节点
            TreeNode<K,V> p = replacementTreeNode(e, null);
            if (tl == null)
                hd = p;
            else {
                p.prev = tl;
                tl.next = p;
            }
            tl = p;
        } while ((e = e.next) != null);  // 将普通链表转成由树形节点链表
        if ((tab[index] = hd) != null)
            // 将树形链表转换成红黑树
            hd.treeify(tab);
    }
}

TreeNode<K,V> replacementTreeNode(Node<K,V> p, Node<K,V> next) {
    return new TreeNode<>(p.hash, p.key, p.value, next);
}
```

**红黑树转为链表**

```java
// 红黑树转链表阈值
static final int UNTREEIFY_THRESHOLD = 6;

final void split(HashMap<K,V> map, Node<K,V>[] tab, int index, int bit) {
    TreeNode<K,V> b = this;
    // Relink into lo and hi lists, preserving order
    TreeNode<K,V> loHead = null, loTail = null;
    TreeNode<K,V> hiHead = null, hiTail = null;
    int lc = 0, hc = 0;
    /* 
     * 红黑树节点仍然保留了 next 引用，故仍可以按链表方式遍历红黑树。
     * 下面的循环是对红黑树节点进行分组，与上面类似
     */
    for (TreeNode<K,V> e = b, next; e != null; e = next) {
        next = (TreeNode<K,V>)e.next;
        e.next = null;
        if ((e.hash & bit) == 0) {
            if ((e.prev = loTail) == null)
                loHead = e;
            else
                loTail.next = e;
            loTail = e;
            ++lc;
        }
        else {
            if ((e.prev = hiTail) == null)
                hiHead = e;
            else
                hiTail.next = e;
            hiTail = e;
            ++hc;
        }
    }

    if (loHead != null) {
        // 如果 loHead 不为空，且链表长度小于等于 6，则将红黑树转成链表
        if (lc <= UNTREEIFY_THRESHOLD)
            tab[index] = loHead.untreeify(map);
        else {
            tab[index] = loHead;
            /* 
             * hiHead == null 时，表明扩容后，
             * 所有节点仍在原位置，树结构不变，无需重新树化
             */
            if (hiHead != null) 
                loHead.treeify(tab);
        }
    }
    // 与上面类似
    if (hiHead != null) {
        if (hc <= UNTREEIFY_THRESHOLD)
            tab[index + bit] = hiHead.untreeify(map);
        else {
            tab[index + bit] = hiHead;
            if (loHead != null)
                hiHead.treeify(tab);
        }
    }
}
```

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210309143957687.png" alt="image-20210309143957687" style="zoom:67%;" />



























#### ConcurrentHashMap



****

#### LinkedHashSet

- Java LinkedHashSet class is a Hashtable and Linked list implementation of the set interface. It inherits HashSet class and implements Set interface.

  The important points about Java LinkedHashSet class are:

  - Java LinkedHashSet class contains unique elements only like HashSet.
  - Java LinkedHashSet class provides all optional set operation and permits null elements.
  - Java LinkedHashSet class is non synchronized.
  - Java LinkedHashSet class maintains insertion order.
  
  

#### TreeSet

- The important points about Java TreeSet class are:
  - Java TreeSet class contains unique elements only like HashSet.
  - Java TreeSet class access and retrieval times are quiet fast.
  - Java TreeSet class doesn't allow null element.
  - Java TreeSet class is non synchronized.
  - Java TreeSet class maintains **ascending order**.



***

### Lambda Expressions

- Lambda expression is a new and important feature of Java which was included in Java SE 8. It provides a clear and concise way to represent one method interface using an expression. 

- The Lambda expression is used to provide the implementation of an interface which has functional interface. It saves a lot of code. In case of lambda expression, we don't need to define the method again for providing the implementation. Here, we just write the implementation code.

- Lambda expression provides implementation of *functional interface*. An interface which has only **one abstract method** is called functional interface. Java provides an anotation **`@FunctionalInterface`**, which is used to declare an interface as functional interface.

**Syntax**

`(argument-list) -> {body} `

Java lambda expression is consisted of three components.

- **Argument-list:** It can be empty or non-empty as well.

- **Arrow-token:** It is used to link arguments-list and body of expression.

- **Body:** It contains expressions and statements for lambda expression.

```java
@FunctionalInterface  //It is optional  
interface Drawable{  
    public void draw();  
}  
  
public class LambdaExpressionExample2 {  
    public static void main(String[] args) {  
        int width=10;  
          
        //with lambda  
        Drawable d2=()->{  
            System.out.println("Drawing "+width);  
        };  
        d2.draw();  
    }  
}  
```

**Java Lambda Expression Example: Multiple Statements**

```java
@FunctionalInterface  
interface Sayable{  
    String say(String message);  
}  
  
public class LambdaExpressionExample8{  
    public static void main(String[] args) {  
      
        // You can pass multiple statements in lambda expression  
        Sayable person = (message)-> {  
            String str1 = "I would like to say, ";  
            String str2 = str1 + message;   
            return str2;  
        };  
            System.out.println(person.say("time is precious."));  
    }  
}  
```

**Creating Thread**

```java
public class LambdaExpressionExample9{  
    public static void main(String[] args) {  
      
        //Thread Example without lambda  
        Runnable r1=new Runnable(){  
            public void run(){  
                System.out.println("Thread1 is running...");  
            }  
        };  
        Thread t1=new Thread(r1);  
        t1.start();  
        //Thread Example with lambda  
        Runnable r2=()->{  
                System.out.println("Thread2 is running...");  
        };  
        Thread t2=new Thread(r2);  
        t2.start();  \\可以把r2换成等号右边的式子
        
        Thread t3 = new Thread(()->{  
                System.out.println("Thread2 is running...");  
        }).start();
    }  
}  
```

### Method references

- Method reference is used to refer method of functional interface. 
- It is compact and easy form of lambda expression. 
- Each time when you are using lambda expression to just referring a method, you can replace your lambda expression with method reference.

>There are following types of method references in java:

1. Reference to a static method.
2. Reference to an instance method.
3. Reference to a constructor.

**Syntax**

```
ContainingClass::staticMethodName 
```

```java
interface Sayable{  
    void say();  
}  
public class MethodReference {  
    public static void saySomething(){  
        System.out.println("Hello, this is static method.");  
    }  
    public static void main(String[] args) {  
        // Referring static method  
        Sayable sayable = MethodReference::saySomething;  
        // Calling interface method  
        sayable.say();  
    }  
}  
```

***

### 代理模式

> 代理模式是一种比较好理解的设计模式。简单来说就是 **我们使用代理对象来代替对真实对象(real object)的访问，这样就可以在不修改原目标对象的前提下，提供额外的功能操作，扩展目标对象的功能**

- 代理模式的主要作用是**扩展目标对象的功能**，比如说在目标对象的某个方法执行前后你可以增加一些自定义的操作

**静态代理**

- 静态代理中，我们对目标对象的每个方法的增强都是手动完成的（后面会具体演示代码），非常不灵活（比如接口一旦新增加方法，目标对象和代理对象都要进行修改）且麻烦(需要对每个目标类都单独写一个代理类\)

静态代理实现步骤:

1. 定义一个接口及其实现类；
2. 创建一个代理类同样实现这个接口
3. 将目标对象注入进代理类，然后在代理类的对应方法调用目标类中的对应方法。这样的话，我们就可以通过代理类屏蔽对目标对象的访问，并且可以在目标方法执行前后做一些自己想做的事情。

**动态代理**

- 相比于静态代理来说，动态代理更加灵活。我们不需要针对每个目标类都单独创建一个代理类，并且也不需要我们必须实现接口，我们可以直接代理实现类( CGLIB 动态代理机制)

**从 JVM 角度来说，动态代理是在运行时动态生成类字节码，并加载到 JVM 中的。**

说到动态代理，Spring AOP、RPC 框架应该是两个不得不的提的，它们的实现都依赖了动态代理

***

#### JDK 动态代理机制

**在 Java 动态代理机制中 `InvocationHandler` 接口和 `Proxy` 类是核心**

- `Proxy` 类中使用频率最高的方法是：`newProxyInstance()` ，这个方法主要用来生成一个代理对象。

```java
public static Object newProxyInstance(ClassLoader loader,
                                      Class<?>[] interfaces,
                                      InvocationHandler h)
    throws IllegalArgumentException
{
    ......
}
```

- **loader** :类加载器，用于加载代理对象。
- **interfaces** : 被代理类实现的一些接口；
- **h** : 实现了 `InvocationHandler` 接口的对象；

> 要实现动态代理的话，还必须需要实现`InvocationHandler` 来自定义处理逻辑。 当我们的动态代理对象调用一个方法时候，这个方法的调用就会被转发到实现`InvocationHandler` 接口类的 `invoke` 方法来调用

```java
public interface InvocationHandler {

    /**
     * 当你使用代理对象调用方法的时候实际会调用到这个方法
     */
    public Object invoke(Object proxy, Method method, Object[] args)
        throws Throwable;
}
```

- **proxy** :动态生成的代理类
- **method** : 与代理类对象调用的方法相对应
- **args** : 当前 method 方法的参数

使用步骤

- 定义一个接口及其实现类；
- 自定义 `InvocationHandler` 并重写`invoke`方法，在 `invoke` 方法中我们会调用原生方法（被代理类的方法）并自定义一些处理逻辑；
- 通过 `Proxy.newProxyInstance(ClassLoader loader,Class<?>[] interfaces,InvocationHandler h)` 方法创建代理对象；

```java
//定义短信发送的接口
public interface SmsService {
    String send(String message);
}

//实现发送短信的接口
public class SmsServiceImpl implements SmsService {
    public String send(String message) {
        System.out.println("send message:" + message);
        return message;
    }
}

//定义一个 JDK 动态代理类
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class DebugInvocationHandler implements InvocationHandler {
    /**
     * 代理类中的真实对象
     */
    private final Object target;

    public DebugInvocationHandler(Object target) {
        this.target = target;
    }

    public Object invoke(Object proxy, Method method, Object[] args) throws InvocationTargetException, IllegalAccessException {
        //调用方法之前，我们可以添加自己的操作
        System.out.println("before method " + method.getName());
        Object result = method.invoke(target, args);
        //调用方法之后，我们同样可以添加自己的操作
        System.out.println("after method " + method.getName());
        return result;
    }
}

//获取代理对象的工厂类
public class JdkProxyFactory {
    public static Object getProxy(Object target) {
        return Proxy.newProxyInstance(
                target.getClass().getClassLoader(), // 目标类的类加载
                target.getClass().getInterfaces(),  // 代理需要实现的接口，可指定多个
                new DebugInvocationHandler(target)//代理对象对应的自定InvocationHandler
        );
    }
}//getProxy() ：主要通过Proxy.newProxyInstance（）方法获取某个类的代理对象

//实际使用
SmsService smsService = (SmsService) JdkProxyFactory.getProxy(new SmsServiceImpl());
smsService.send("java");
```

***

#### CGLIB 动态代理机制

JDK 动态代理有一个最致命的问题是其只能**代理实现了接口的类**。

为了解决这个问题，我们可以用 **CGLIB 动态代理**机制来避免

- **CGLIB(Code Generation Library)**是一个基于[ASM]()的字节码生成库，它允许我们在运行时对字节码进行修改和动态生成。CGLIB 通过继承方式实现代理

- **在 CGLIB 动态代理机制中 `MethodInterceptor` 接口和 `Enhancer` 类是核心。**

- 你需要自定义 `MethodInterceptor` 并重写 `intercept` 方法，`intercept` 用于拦截增强被代理类的方法

```java
public interface MethodInterceptor extends Callback{
    // 拦截被代理类中的方法
    public Object intercept(Object obj, java.lang.reflect.Method method, Object[]args,
							MethodProxy proxy) throws Throwable;
}
```

- **obj** :被代理的对象（需要增强的对象）
- **method** :被拦截的方法（需要增强的方法）
- **args** :方法入参
- **methodProxy** :用于调用原始方法

可以通过 `Enhancer`类来动态获取被代理类，当代理类调用方法的时候，实际调用的是 `MethodInterceptor` 中的 `intercept` 方法。

**使用步骤**

- 定义一个类；
- 自定义 `MethodInterceptor` 并重写 `intercept` 方法，`intercept` 用于拦截增强被代理类的方法，和 JDK 动态代理中的 `invoke` 方法类似；
- 通过 `Enhancer` 类的 `create()`创建代理类；

> 不同于 JDK 动态代理不需要额外的依赖。CGLIB(Code Generation Library) 实际是属于一个开源项目，如果你要使用它的话，需要手动添加相关依赖。

```xml
<dependency>
  <groupId>cglib</groupId>
  <artifactId>cglib</artifactId>
  <version>3.3.0</version>
</dependency>
```

**实现一个使用阿里云发送短信的类**

```java
package github.javaguide.dynamicProxy.cglibDynamicProxy;

public class AliSmsService {
    public String send(String message) {
        System.out.println("send message:" + message);
        return message;
    }
}

//自定义 MethodInterceptor（方法拦截器）
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

import java.lang.reflect.Method;
/**
 * 自定义MethodInterceptor
 */
public class DebugMethodInterceptor implements MethodInterceptor {
    
    /**
     * @param o           被代理的对象（需要增强的对象）
     * @param method      被拦截的方法（需要增强的方法）
     * @param args        方法入参
     * @param methodProxy 用于调用原始方法
     */
    @Override
    public Object intercept(Object o, Method method, Object[] args, MethodProxy 								methodProxy) throws Throwable {
        //调用方法之前，我们可以添加自己的操作
        System.out.println("before method " + method.getName());
        Object object = methodProxy.invokeSuper(o, args);
        //调用方法之后，我们同样可以添加自己的操作
        System.out.println("after method " + method.getName());
        return object;
    }
}

//获取代理类
import net.sf.cglib.proxy.Enhancer;

public class CglibProxyFactory {
    
    public static Object getProxy(Class<?> clazz) {
        // 创建动态代理增强类
        Enhancer enhancer = new Enhancer();
        // 设置类加载器
        enhancer.setClassLoader(clazz.getClassLoader());
        // 设置被代理类
        enhancer.setSuperclass(clazz);
        // 设置方法拦截器
        enhancer.setCallback(new DebugMethodInterceptor());
        // 创建代理类
        return enhancer.create();
    }
}

//实际使用

AliSmsService aliSmsService = (AliSmsService) CglibProxyFactory.getProxy(AliSmsService.class);
aliSmsService.send("java");
```

- CGLIB 动态代理是通过生成一个被代理类的子类来拦截被代理类的方法调用，因此不能代理声明为 final 类型的类和方法

***

### Java I/O模型

