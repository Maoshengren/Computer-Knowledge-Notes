# Java学习

#### 从控制台读取输入

- 使用 Scanner类从控制台输入

- Java 使用 System.out 来表示标准输出设备，而用 System.in 来表示标准输入设备
  - 在默认情况下，输出设备是显示器，而输人设备是键盘。
  - 为了完成控制台输出，只需使用println 方法就可以在控制台上显示基本值或字符串

- Java 并不直接支持控制台输人，但是可以使用 Scanner 类创建它的对象，以读取来自 System.in 的输入，如下所示：
  `Scanner input = new Scanner(System.ln);`
  - 语法 new Scanner (System.in)表明创建了一个 Scanner 类型的对象
  - 语法 Scanner input 声明 input 是一个 Scanner 类 型 的 变 量

```java
import java.util.Scanner; // Scanner is in the java.util package
public class ComputeAreaWithConsoleInput {
    pub1ic static void main(String[] args) {
        // Create a Scanner object
        Scanner input = new Scanner(System.in);
        // Prompt the user to enter a radius
        System.out.print("Enter a number for radius: "); 
        double radius = input.nextDouble();
        // Compute area
        double area = radius * radius * 3.14159;
        // Display results
        System.out.printIn("The area for the circle of radius" + 
        radius +" is"+ area);
    }
}
```

***

**读取数字**

```java
Scanner input = new Scanner(System.in);
System.out.print("Enter a byte value: ");
byte byteValue = input.nextByte();
System.out.print("Enter a short value: ") ;
short shortValue = input.nextShort();
System.out.print("Enter an int value: “);
int intValue = input.nextInt();
System.out.print("Enter a 1ong value: ");
long 1ongValue = input.nextLong() ;
System.out.print("Enter a float value: ") ;
float floatValue = input.nextF1oat();
```

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\1.png" style="zoom:50%;" />

***

#### 幂运算

- <img src="C:\Users\13793\Desktop\学习笔记\Java学习\2.png" style="zoom:50%;" />

- pow 方法定义在 Java API的 Math 类中

```java
System.out.println(Math.pow(2 f 3)); // Displays 8.0
System.out.println(Math.pow(4, 0.5));// Displays 2.0
System.out.println(Math.pow(2.5, 2));// Displays 6.25
System.out.println(Math.pow(2.5, -2)); // Displays 0.16
```

- **产生随机数方法**
  - 更好的方法是使用Math 类中的 random（） 方法。调用这个方法会返回一个双精度的随机值 d 且满足 0.0 < d < 1.0。这样,(int)(Math.random()*l0) 会返回一个随机的一位整数 (即 0 到 9 之间的数）

***

x /= 4 + 5.5 * 1.5;
等同于
x = x / (4 + 5.5 * 1.5);

***

### 3、选择

- **boolean** 数据类型用于声明布尔型变量。boolean 型变量可以是以下这两个值中的一个：true 和 false。例如，下述语句将true 赋值给变M lightsOn：
  `boolean lightsOn * true;`

- **常见错误 4:** 悬空 else 出现的歧义
  下面图 a 中的代码有两个 if 子句和一个 else 子句。那么，哪个 if 子句和这个 else 匹配呢？这里的缩进表明 else 子句匹配第一个 if 子句。但是，else 实际匹配的是第二个 if子句。这种现象就称为悬空 else 歧义（dangling-else ambiguity)。

<img src="file:///C:\Users\13793\AppData\Roaming\Tencent\Users\1379338142\QQ\WinTemp\RichOle\3ARSI89G[]L8S{2F$5IV8%F.png" alt="img" style="zoom: 50%;" />

- **常见错误 5:** 两个浮点数值的相等测试

  - 浮点数具有有限的计算精度；涉及浮点数的计算可能引人取整错误。因此，两个浮点数值的相等测试并不可靠。

  - 可以通过测试两个数的差距小于某个阈值，来比较它们是否已经足够接近。

    也就是，对于一个非常小的值 ε，将其设为10<sup>-14</sup>来比较double类型的值，设为10<sup>-7</sup>来比较float类型的值

- **常见陷阱 1:** 简化布尔变量賦值

  <img src="C:\Users\13793\Desktop\学习笔记\Java学习\}(SP%@__U)76[@WG6`PJP.png" alt="img" style="zoom:67%;" />

***

- 对所有的程序都应该先编写少量代码然后进行测试，之后再继续添加更多的代码 
- 这个过程称为递进式开发和测试（incremental development and testing)
- 这种方法使得调试变得更加容易，因为错误很可能就在你刚刚添加进去的新代码中。

***

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\优先级.png" style="zoom:50%;" />

- 赋值操作符是右结合的

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\3.png" style="zoom: 67%;" />

***

### 4、数学函数、 字符和字符串

#### 4、1常用数学函数

- Math 类还提供了两个很有用的 double 型常量，PI ( TT ) 和 E (自然对数的底）

![](C:\Users\13793\Desktop\学习笔记\Java学习\4.png)

- **指数函数方法**
  - <img src="C:\Users\13793\Desktop\学习笔记\Java学习\5.png" style="zoom:67%;" />
  - Math.exp(l) 返回 2.71828
    Math,log(Math.E) 返回 1.0
    Math.log10(10) 返回 1.0
    Math.pow(2, 3) 返回 8.0
    Math.pow(3, 2) 返回 9.0
    Math.pow(4.5, 2.5) 返回 22.9176S
    Math.sqrt(4) 返回 2.0
    Math.sqrt(10.5) 返回 4.24

- **取整方法**

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\6.png" style="zoom:67%;" />

- **min、max、和abs方法**
  - min 和 max 方法用于返回两个数（int、long、float 或 double 型）的最小值和最大值
  - abs 方法以返回一个数（int、long、float 或 double 型）的绝对值

- **random（）方法**
  - 生 成 大 于 等 于 0.0 且 小 于 1.0 的 double 型 随 机 数

***

#### 4、2字符数据类型和操作

- **字符测试的方法**
  - Character 类

![](C:\Users\13793\Desktop\学习笔记\Java学习\7.png)

`System.out.printlnC^isDigitCa') is " + Character.isDigit'a'));`

显示`isDigit(a') is false`

***

#### 4、3String类型

![](C:\Users\13793\Desktop\学习笔记\Java学习\8.png)

- String message = "Welcome to Java"；

- **求字符串长度**
  - ```java
    String message = "Welcome to Java";
    System.out.println("The length of " + message + " is " + message.1engthO)；
    ```

- **从字符串中获取字符**

  - 方法s.charAt(index)可用于提取字符串s中的某个特定字符，其中下标index的取值范围在0~ s.length()-1之间
  - 例如，message. charAt(0)返回字符W

<img src="file:///C:\Users\13793\AppData\Roaming\Tencent\Users\1379338142\QQ\WinTemp\RichOle\NTRFWBK2IO6VHSWYEY0IW$5.png" alt="img" style="zoom:67%;" />

>**注：s.charAt(s.length())会造成一个StringlndexOutOfBoundsException 异 常**

- **连接字符串**

  - 可以使用 concat 方法连接两个字符串。例如，如下所示的语句将字符串 si 和 S2 连接构成 S3:
    `String s3 = sl.concat(s2);`
  - 可以使用加号（+) 连接两个或多个字符串。因此，上面的语句等价于：
    `String s3 = s1 + s2;`
  - 增强的 += 操作符也可以用于字符串连接。例如，下面的代码将字符串 "and Java is fun" 添加到 message 变量中的字符串 "Welcome to ]ava"后面。
    `message += ”and Java is fun”;`

- **字符串的转换**

  - 方法 **toLowerCase（）**返回一个新字符串，其中所有字母小写
  - 方法 **toUpperCase（）**返回一个新字符串，其中所有字母大写
  - "Welcome".toLowerCaseC)返回一个新字符串 welcome
    "Welcome".toUpperCase()返回一个新字符串 WELCOME
  - 方法 tHm()通过删除字符串两端的空白字符返回一个新字符串。字符\t、\f、\r、或者 \n 被称为空白符
    - 例如，
      `"\t Good Night \n".trim()`返回一个新字符串 `Good Night`

- **从控制台读取字符串**

  - ```
    Scanner input = new Scanner(System.in);
    System.out.print("Enter three words separated by spaces: ••);
    String si = input.next();
    String s2 = input.next();
    String s3 = input.next();
    System.out.printlnC'sl is " + s1);
    System.out.println("s2 is " + s2);
    System.out.println("s3 is " + s3);
    ```

  - 可以使用 nextLine() 方法读取一整行文本。nextLineO 方法读取以按下回车键为结束标志的字符串。

- **字符串比较**

![](C:\Users\13793\Desktop\学习笔记\Java学习\9.png)

```java
"Welcome to Java."startsWith("We'") returns true .
"Welcome to Java".startsWith("we") returns false.
"Welcome to Java".endsWith("va") returns true.
"Welcome to Java".endsWith("v") returns false.
"Welcome to Java".contains("to") returns true .
"Welcome to Java".contains("To") returns false.
```

- **获得子字符串**
  - String message = "Welcome to Java’.；
    String message = message.substring (0, 11) + "HTML";
    字符串 message 变成了 Welcome to HTML.

![10](C:\Users\13793\Desktop\学习笔记\Java学习\10.png)

- **获取字符串中的字符或者子串**

![img](C:\Users\13793\Desktop\学习笔记\Java学习\1QJ}BI63AOU5]C4C`S[HQ0Y.png)

- **字符串和数字间的转换**
  - 要将字符串转换为int值，使用**Integer . parseInt**方法，如下所示:
    `int intValue = Integer . parseInt(intString) ;`
    intString是一个数值型字符串，例如"123"

  - 要将字符串转换为double值，使用**Double. parseDouble**方法，如下所示:

    `double doubleValue = Double. parseDoubTe(doubleString);`
    doub1eString是一个数值型字符串，例如"123.45"。

  - 可以将数值转换为字符串，只需要简单使用字符串的连接操作符，如下所示：
    `String s = number + “”；`

>**使用格式标识符 %-10s 来显示字符串，对字符串进行左对齐**

***

### 5、循环

- 求最大公约数

```java
int gcd = 1; // Initial gcd is 1
int k = 2; // Possible gcd
while (k < n1 && k < n2) {
    if (nl % k = 0 && n2 % k == 0)
        gcd * k; // Update gcd
    k++; // Next possible gcd
}
```

***

### 6、方法

![](C:\Users\13793\Desktop\学习笔记\Java学习\11.png)

#### 重载

- 重载方法使得你可以使用同样的名字来定义不同方法，只要它们的签名是不同的

- 重载方法可以使得程序更加清楚，以及更加具有可读性。执行同样功能但是具有不同参数类型的方法应该使用同样的名字
- 被重载的方法必须具有不同的参数列表。不能基于不同修饰符或返田值类型来重载方法

***

### 7、一维数组

- **声明数组变量**

  ```
  elementType[] arrayRefVar;( 元素类型口数蛆引用变量 ；)
  如：double[] myList;
  ```

- **创建数组**

  ```
  arrayRefVar = new e1ementType[arrayS1ze]:
  ```

  - 1 ) 使用 new elementType[arrayS"ize]创建了一个数组；
  - 2)把这个新创建的数组的引用陚值给变暈 arrayRefVar

- 声明一个数组变量、创建数组、然后将数组引用賦值给变量这三个步驟可以合并在一条语句里，如下所示：

  ```java
  elementType arrayRefVar = new elementType[arraySize];
  使用：
      double[] myList = new double[10]
  ```

- 可以使用 arrayRefVar.length 得到数组的大小

```
elementType[] arrayRefVar = {value 0, value 1,...value n};
```

- foreach**循环**

  ```java
  for(double e: myList){
  	System.out.printIn(e);
  }
  ```

- **数组赋值**

  - 复制数组有三种方法：
    1 ) 使用循环语句逐个地复制数组的元素。
    2 ) 使用 System 类中的静态方法 arraycopy。
    3 ) 使用 clone 方法复制数组，这将在第 13 章中介绍

  ```java
  arraycopy(sourceArray, srcPos, targetArray, tarPos, length);
  ```

- 将数组传递给方法，与C语言中传递指针效果相同，会改变数组中的元素

***

- **可变长参数**

  ```java
  pub1ic static void pri ntMax(double...numbers) {
      if (numbers.length == 0) {
      System. out. print1n("No argument passed");
      return ;
      }
      double result = numbers[0];
      for (int i = 1; i < numbers. length; i++)
      	if (numbers[i] > result)
      		result = numbers [i] ;
      System. out . print1n("The max value is”+ result) ;
  }
  ```

- Arrays**类**

  - 可以使用 sort 或者 parallelSort 方法对整个数组或部分数组进行排序

  ```java
  double[] numbers = {6.0， 4.4，1.9，2.9，3.4，3.5};
  java.uti1.Arrays.sort(numbers); // Sort the whole array
  java.uti1.Arrays.parallelSort(numbers); // Sort the whole array
  char[] chars = {'a', 'A', '4'，'F'，'D'， 'P'};
  java.uti1.Arrays.sort(chars, 1, 3); // Sort part of the array
  java. uti1.Arrays.parallelSort(chars, 1，3); // Sort part of the array
  ```

  - 可以调用sort(numbers)对整个数组numbers排序。可以调用sort(chars,1，3)对从chars[1]到chars[3-1]的部分数组排序。
  - 如果你的计算机有多个处理器，那么parallelSort将更加高效。

- 可以采用二分査找法（ binarySearch 方法）在数组中査找关键字。数组必须提前按升序排列好

  - 如果数组中不存在关键字，方法返回 -( 插入点下标 +1)。

  ```java
  int[] list = {2, 4，7, 10，11, 45，50，59， 60， 66， 69，70，79};
  System.out.print1n("1.Index is "
  	java.util.Arrays.binarySearch(list, 11));
  System.out.printIn("2.Index is+
  	java.util.Arrays.bi narySearch(list, 12));
  
  char[] chars = {'a', 'c'，'g'，'x'，'y', 'z'};
  System. out. print1n("3.Index is
  	java. util.Arrays. binarySearch(chars, 'a'));
  System. out . print1n("4.Index is " +
  	java. uti1.Arrays. binarySearch(chars，'t'));
  ```

  输出为：

  1. Index is 4
  2. Index is -6
  3. Index is 0
  4. Index is -4

***

- 可以采用equals方法检测两个数组是否相等。如果它们的内容相同，那么这两个数组相等。在下面的代码中，list1 和list2相等，而list2和list3不相等。

  ```java
  int[] 1istl = {2，4，7，10};
  int[] 1ist2 = {2，4，7，10};
  int[] list3 = {4，2，7，10};
  System. out，printIn(java. uti1 Arrays . equals(1ist1, 1ist2)); // true
  System. out. printIn(java.util.Arrays .equals(1ist2, 1ist3)); // false
  ```

- 可以使用fill方法填充整个数组或部分数组。例如:“下列代码将5填充到list1中，将8填充到元素list2[1]到1ist2[5-1]中。

  ```java
  int[] list1 = {2，4，7，10};
  int[] 1ist2 = {2，4，7，7, 7，10};
  java.util.Arrays.fi11(list1, 5); // Fi11 5 to the whole array
  java.util.Arrays.fill(list2,1,5,8); // Fi11 8 to a partial. array
  ```

- 还可以使用toString方法来返回一个字符串，该字符串代表了数组中的所有元素。这
  是一个显示数组中所有元素的快捷和简便的方法

  ```java
  int[] list = {2，4，7，10};
  System.out.printIn(Arrays.toString(list));
  显示[2，4，7，10]。
  ```

***

### 8、对象和类

#### 8.5通过引用变量访问对象

- 对象的数据和方法可以运用点操作符（.）通过对象的引用变量进行访问
- 新创建的对象在内存中被分配空间。它们可以通过引用变量来访问

***

- 引用变量和引用类型
  - 对象是通过对象引用变量（reference variable) 来访问的，该变量包含对对象的引用，使用如下语法格式声明这样的变量：
    `ClassName objectRefVar;`

  - 本质上来说，一个类是一个程序员定义的类型。类是一种引用类型（reference type), 这意味着该类类型的变量都可以引用该类的一个实例

  ***

  下面的语句声明变量 myCircle 的类型是 Circle 类型：
  `Circle myCircle;`
  变量 myCircle 能够引用一个 Circle 对象。下面的语句创建一个对象，并且将它的引用赋给变量 myCircle:
  `myCircle = new Circle();`

  采用如下所示的语法，可以写一条包括声明对象引用变量、创建对象以及将对象的引用赋值给这个变量的语句。
  `ClassName objectRefVar = new ClassNaroe():`

- `Circle myCircle = new Circle();`
  变量 myCircle 中放的是对 Circle 对象的一个引用

>从表面上看，对象引用变量中似乎存放了一个对象，但事实上，它只是包含了对该对象的引用。严格地讲，对象引用变量和对象是不同的，但是大多數情况下，这种差异是可以忽略的。因此，**可以简单地说 myCircle 是一个 Circle 对象**，而不用冗长地描述说，myCircle 是一个包含对 Circle 对象引用的变量

- 在 Java 中，数组被看作是对象。數组是用 new 操作符创建的
- 一个數组变量实际上是一个包含数组引用的变量

***















- 一个对象的狀态（state，也称为特征（property) 或属性（attribute)) 是由具有当前值的数据域来表示的
- —个对象的行为（behavior, 也称为动作（action)) 是由方法定义的。调用对象的一个方法就是要求对象完成一个动作

![](C:\Users\13793\Desktop\学习笔记\Java学习\12.png)

- **创建类和对象**

  ```java
  class SimpleCircle {
      double radius ;
      /** Construct a circle with radius 1 */
      SimpleCircle() {
          radius = 1;
      }
      /** Construct a circle with a specified radius */
      SimpleCircle(double newRadius) {
      	radius = newRadius;
      }
      /** Return the area of this circle */
      double getArea(){
      	return radius * radius * Math. PI;
      }
      /** Return the perimeter of this circle */
      double getPerimeter( {
      	return 2 * radius * Math. PI;
      }
      /** Set a new radius for. this circle */
      void setRadius (double newRadius) {
      radius = newRadius;
  }
  ```

  ***

#### 使用Java库中的类

- 使用data类

  ```java
  java.util.Date date = new java. uti1.DateO;
  System.out.print("The elapsed time since Jan 1, 1970 is”+
  date.getTime( + " milliseconds");
  System.out.println(date.toString());
  ```

- random()类

![](C:\Users\13793\Desktop\学习笔记\Java学习\13.png)

```java
Random random1 = new Random(3);
System.out.print("From randoml: “);
for(int i = 0;i < 10; i++)
System . out. pri nt(random1. nextInt(1000) +”");
Random random2 = new Random(3) ;
System.out.print("\nFrom random2: ") ;
for(int i = 0;i < 10;i++)
System.out.print(random2.nextInt(1000) +”");

这些代码产生相同的int类型的随机数列:
From random1: 734 660 210 581 128 202 549 564 459 961
From random2: 734 660 210 581 128 202 549 564 459 961
```

***

- point2D **类**

![](C:\Users\13793\Desktop\学习笔记\Java学习\14.png)

```java
Point2D p1 = new Point2D(x1, y1);
Point2D p2 = new Point2D(x2，y2);
System.out.print1n("p1 is " + p1.toString()));
System.out.print1n("p2 is "+ p2.toString());
System.out.print1n("The distance between pl and p2 is”+ p1.distance(p2));
```

***

#### 静态变量、常量和方法

- 静态变量将变量值存储在一个公共的内存地址。因为它是公共的地址，所以如果某一个对象修改了静态变量的值，那么同一个类的所有对象都会受到影响。
- Java 支持静态方法和静态变量，无须创建类的实例就可以调用静态方法（static method)

- 要声明一个静态变量或定义一个静态方法，就要在这个变量或方法的声明中加上修饰符static

```
static int numberOfObjects;
static int getNumberObjectsO {
	return numberOfObjects;
}
```

- 类中的常量是被该类的所有对象所共享的。因此，常量应该声明为 final static, 例如，Math 类中的常量 PI 是如下定义的：
  final static double PI = 3.1415926535S979323846:
  - 实例方法（例如：getArea() ) 和实例数据（例如：radius ) 都是属于实例的，所以它们在实例创建之后才能使用。它们是通过引用变量来访问的。
  - 静态方法（例如：getNumberOfObjectsO ) 和静态数（例如：numberOfObjects) 可以通过引用变量或它们的类名来调用

#### 数据域封装

- 使用 **Private** 修饰符将数据域声明为私有的

- 可以提供一个 set 方法给数据域设置新值。get 方法也被称为访问器（accessor), 而 set 方法称为修改器（mutator)
- 私有数据只能在定义它们的类中被访问

- java无法从静态上下文中引用非静态变量

  ```java
  public class Circle(){
      private double radius = 20.0;
      public static class main(String[] args){
          System.out.print(radius);			//无法打印，因为无法使用变量radius
      }
  }
  ```

***

#### 向方法传递对象参数

- 给方法传递一个对象，是将对象的引用传递给方法。

  ```java
  pub1ic class Test {
      pub1ic static void main(String[] args) {
      // Circle With PrivateDataFields is defined in Listing 9.8
      CircleWithPrivateDataFields myCircle = new CircleWithPrivateDataFields(5.0);
      printCircle(myCircle);
      }
      public static void printCircle(Ci rc1eWi thPrivateDataFields c) {
          System. out. println("The area of the circle of radius
          " + c.getRadius() + "is" + c.getArea()) ;
      }
  }
  ```

***

#### 对象数组

```
Circle[] circleArray = new Circle[10];
```

- 对象的数组实际上是引用变量的数组。因此，调用circleArray[1].getAreaO)实际上调用了两个层次的引用，circleArray引用了整个数组，circleArray[1] 引用了一个Circle对象。

  > **注意:当使用new操作符创建对象数组后，这个数组中的每个元素都是默认值为nu11的引用变量。**

***

#### 不可变对象和类

- 可以定义不可变类来产生不可变对象。不可变对象的内容不能被改变

- 它的所有数据域必须都是私有的，而且没有对任何一个数据域提供公共的 set 方法

- 要使一个类成为不可变的，它必须满足下面的要求：
  - 所有数据域都是私有的。
  - 没有修改器方法。
  - 没有一个返回指向可变数据域的引用的访问器方法

***

#### this引用

- 在引用隐藏数据域以及调用一个重载的构造方法的时候，this 引用是必须的

```java
pub1ic class F {
    private int i = 5;
    private static double k = 0;
    pub1ic void setI(int i) {
    	this.i = i;
    }
    public static void setK(double k) {
    	F.k = k;
    }// Other methods omitted
}
```

- 调用 fl.setl(10)时，执行了this.i = i , 将参数 i 的值賦给调用对象 fl的数据域 1

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\3ODO}4C28P[%{MH7JI]NV24.png" alt="img"  />

- 在第二个构造方法中，this(1.0)这一行调用带 double 值参数的第一个构造方法

>如果一个类有多个构造方法，最好尽可能使用 this( 参数列表 ）实现它们
>
>无参數或参数少的构造方法可以用 this( 参数列表）调用参数多的构造方法。这样做通常
>可以简化代码，使类易于阅读和维护

***

### 9、面向对象思考

#### 关联

- 关联是一种常见的二元关系，描述两个类之间的活动

![](C:\Users\13793\Desktop\学习笔记\Java学习\15.png)

- **聚集和组合**
  - 聚集是关联的一种特殊形式，代表了两个对象之间的归属关系
  - 所有者对象称为聚集对象，它的类称为聚集类。
  - 而从属对象称为被聚集对象，它的类称为被聚集类。

- —个对象可以被多个其他的聚集对象所拥有。如果一个对象只归属于一个聚集对象，那么它和聚集对象之间的关系就称为组合（ composition)

![](C:\Users\13793\Desktop\学习笔记\Java学习\16.png)

- 由于聚集和组合关系都以同样的方式用类来表示，我们不区分它们，将两者都称为组合	

***

#### **设计Course类**

![](C:\Users\13793\Desktop\学习笔记\Java学习\17.png)

- 先进行UML建模
  - 先定义对象的数据和操作
  - 测试类
  - 编写course类
  - 运行

**TestCourse**

```java
public class TestCourse {
    public static void main(String[] args){
        Course course1 = new Course("Data Structure");
        course1.addStudents("Mao'shengren");
        course1.addStudents("Mao'pengcheng");
        course1.addStudents("Shi'erniu");
        int number = course1.getNumber();
        System.out.print("Numbers of students: " + number + "\n");
        String[] s = new String[number];
        s = course1.getStudents();
        for(int i = 0; i < course1.getNumber(); i++)		//注意此处的i取值为这个
            System.out.print(s[i] + "\n");
        course1.dropStudents("Mao'shengren");
        for(int i = 0; i < course1.getNumber(); i++)		//不能用s.lenth
            System.out.print(s[i] + "\n");
    }
}
```

**Course**

```java
public class Course {
    private String course;
    private String[] students = new String[100];
    private int numberOfStudents = 0;
    public Course(String s){
        course = s;
    }
    public void addStudents(String s){
        students[numberOfStudents] = s;
        numberOfStudents++;
    }
    public String[] getStudents(){
        return students;
    }
    public int getNumber(){
        return numberOfStudents;
    }
    public void dropStudents(String s){
        int i;
        for(i = 0; i < students.length; i++)
            if(students[i].equals(s))
                break;
        while(i < students.length - 1) {
            students[i] = students[i + 1];
            i++;
        }
        numberOfStudents --;
    }
}
```

***

#### 设计栈类

- **UML建模**

![](C:\Users\13793\Desktop\学习笔记\Java学习\18.png)

***

#### 将基本数据类型值作为对象处理

- 出于对性能的考虑，在 Java 中基本数据类型不作为对象使用。因为处理对象需要额外的系统开销，所以，如果将基本数据类型当作对象

- Java 中的许多方法需要将对象作为参数。
  - Java 提供了一个方便的办法，即将基本数据类型并入对象或包装成对（例如，将 int 包装成 Integer 类，将 double 包装成 Double 类，将char 包装成 Character 类）
  - 通过使用包装类，可以将基本数据类型值作为对象处理

- Java为基本数据类型提供了 Boolean、Character、Double、Float、 Byte、Short、Integer和Long 等包装类。这些包装类都打包在 **java.lang** 包里

- 数值包装类相互之间都非常相似。每个都包含了 doubleValue() 、floatValue()、intValue()、longValue()、shortValue() 和 byteValue()方法。这些方法将对象 “转换”为基本类型值

- 既可以用基本数据类型值也可以用表示数值的字符串来构造包装类。
  - 例如，newDouble(5.0)、new Double("S.0")、new Integer（S)和 new Integer("S")

![](C:\Users\13793\Desktop\学习笔记\Java学习\19.png)

***

- #### Biglnteger 和 BigDecimal 类

```java
Biglnteger a * new BigInteger("922337203685477S807M)；
Biglnteger b = new BigInteger(M2*');
Biglnteger c = a.multiply(b); // 9223372036854775807 * 2
System.out.println(c);
```

***

#### String类

- #### **构造字符串**

  ```java
  String message = new String("Wei come to Java");
  //Java 将字符串直接量看作 String 对象。所以，下面的语句是合法的：
  String message = "Welcome to Java";
  ```

  - 还可以用字符数组创建一个字符串。例如，下述语句构造一个字符串 "Good Day"：

    ```
    char[] charArray = {'C','o', 'o' , 'd' , ' ', 'D', 'a' ,'y'};
    String message = new String(charArray);
    ```

- #### **不可变字符串与限定字符串**

  - String 对象是不可变的，它的内容是不能改变的。下列代码会改变字符串的内容吗？
    `String s = "Java”;
    S = "HTML":`

    - 答案是不能。
    - 第一条语句创建了一个内容为"]ava”的 String 对象，并将其引用賦值给s 
    - 第二条语句创建了一个内容为"HTML"的新 String 对象，并将其引用賦值给 s
    - 赋值后第一个 String 对象仍然存在，但是不能再访问它，因为变量 s 现在指向了新的对象

  - 因为字符串在程序设计中是不可变的，但同时又会频繁地使用，所以 Java 虚拟机为了提高效率并节约内存，对具有相同字符序列的字符串直接量使用同一个实例。

  - 这样的实例称为限定的（interned) 字符串

    ```java
    String s1 = "Welcome to Java";
    String s2 = new String("Welcome to Java");
    String s3 = "Welcome to Java";
    System.out.printIn("s1 == s2 is”+ (s1 == s2));
    System.out.printIn("s1 == s3 is”+ (s1 == s3));
    //程序结果显示:
    s1 == s2 is false
    s1 == s3 is true
    ```

    <img src="C:\Users\13793\Desktop\学习笔记\Java学习\20.png" style="zoom:67%;" />

***

- #### **字符串的替换和分隔**

  ![](C:\Users\13793\Desktop\学习笔记\Java学习\21.png)

```java
"Welcome".replace('e'，'A') 返回一个新的字符串，WAlcomA.
"Welcome".replaceFirst("'e"，"'AB") 返回一个新的字符串，WABl come .
"Welcome".replace("e"，"AB") 返回一个新的字符串，WABlcomAB.
"Welcome".replace("e1"，"AB") 返回一个新的字符串, WABcome.
```

- split 方法可以从一个指定分隔符的字符串中提取标识

```java
String[] tokens = "Java#HTML#Perl".split("#");
for (int i = 0; i < tokens.length; i++)
	System.out.print(tokens[i]‘+”");
```

​		显示Java HTML Perl

***

- #### 依照模式匹配、替换和分隔

- 正则表达式（regular expression)(缩写 regex) 是一个字符串，用于描述匹配一个字符串集的模式

- matches 方法比equals的功能更强大。它不仅可以匹配定长的字符串，还能匹配一套遵从某种模式的字符串

```java
"Java is fun".matches ("Java. *")
"Java is coo1".matches ("Java. *" )
"Java is powerful".matches ("Java. *")
```

- **"]ava.*"** 是一个正则表达式。它描述的字符串模式是以字符串 Java 开始的，后面紧跟任意 0 个或多个字符

- 下面语句结果为true.
  `"440-02-4534" .matches("\d{3}-\\d{2}-\\d{4}")`
  这里 **\\\d** 表示单个数字位，**\\\d{3}** 表示三个数字位

- 方法 replaceAll、replaceFirst 和 split 也可以和正则表达式结合在一起使用

  - 下面的语句用字符串 NNN 替换 "a+b$#c" 中的 S、+ 或者 #，然后返回一个新字符串

  ```
  String s = "a+b$#C".replaceAll("[$+#]",“NNN");
  System.out.println(s);
  ```

  - 这里的正则表达式 [$+#] 表示能够匹配 \$、+ 或者 * 的模式。所以，输出是 aNNNbNNNNNNc

- 下面的语句将字符串分隔为由标点符号分隔开的字符串数组。

  ```java
  String[] tokens = "Java,C?C#,C++" .sp1it("[.,:;?]");
  for(int i = 0; i < tokens.length; i++)
  	System.out.printIn(tokens [i]);
  //输出如下
  Java
  C
  C#
  C++
  ```

  - 这里的正则表达式指定的模式是指匹配 .、，、：、：或者？
  - 这里的每个字符都是分隔字符串的分隔符
  - 因此，这个字符串就被分割成；Java、C、C# 和 C++, 它们都存储在数组tokens 中

***

- #### 字符串与数组之间的转换

  - 为了将字符串转换成一个字符数组，可以使用 toCharArray 方法

    `char[] chars = "Java".toCharArray();`

  - 还可以使用方法**getChars(int srcBegin,int srcEnd , char[]dst, int dstBegin)** 将下标从srcBegin到srcEnd-1的子串复制到字符数组dst中下标从dstBegin开始的位置。例如

    ```java
    char[] dst = {'J'， 'A'，'V'，'A'，'1'， '3'，'O'，'1'};
    "CS3720" .getChars(2, 6，dst, 4);
    这样，dst就变成了{'J','A','V','A','3','7','2','0'}。
    ```

  - 为了将一个字符数组转换成一个字符串，应该使用构造方法String(char[])或者方法:valueOf(char[])。

    `String str = new String(new char[]{'J', 'a', 'v', 'a'});`

  - 下面的语句使用valueOf方法由一个数组构造一个字符串: 
    `String str = String.valueOf(new char[]{'J', 'a', 'v', 'a'});`

***

- #### 将字符和数值转换成字符串

![](C:\Users\13793\Desktop\学习笔记\Java学习\22.png)

- 为了将 double 值 5.44 转换成字符串，可以使用 String.valueOf(5.44)

***

- #### 格式化字符串

  - String. format(format, item1， item2， .... itemk)
    这个方法很像printf方法，只是format方法返回一个格式化的字符串，而printf方法显示一个格式化的字符串。例如:
    `String s = String. format("%7.2f%6d%-4s", 45.556， 14，"AB");
    System. out. print1n(s);`
    显示	45.56	14AB

***

### 10、继承和多态

#### 父类和子类

- 继承使得你可以定义一个通用的类（即父类)，之后扩充该类为一个更加特定的类（即子类）

- 指向父类的三角箭头用来表示相关的两个类之间的继承关系

![img](C:\Users\13793\Desktop\学习笔记\Java学习\3OU%ALEEK8%L@`AU26J9OE9.png)

- Circle 类继承了 CeometricObject 类所有可以访问的数据域和方法
  - 在 Java 术语中，如果类 C1扩展自另一个类 C2, 那么就将 C1称为次类（ subclass), 将C2 称为超类（superclass)
  - 超类也称为父类 ( parent class) 或基类 ( base class), 次类又称为子类 (child class)、扩展类 (extended class) 或派生类（derived class)
  - 子类从它的父类中继承可访问的数据域和方法，还可以添加新数据域和新方法

- Circle类使用下面的语法扩展 GeometMcObject 类 

  `public class Circle extends CeometricObject`

```java
public class RectangleFromSimpleGeometric0bject
	extends SimpleGeometricObject {
    private double wi dth;
    private double hei ght;
    public RectangleFromSimpleGeometri c0bject() {
    }
    pub1ic RectangleF romSimpleGeometri c0bject(
    double width, double height) {
        this .width = width;
        this.height = height;
    }
}
```

- **注意**
  - 和传统的理解不同，子类并不是父类的一个子集。实际上，一个子类通常比它的父类包含更多的信息和方法
  - 父类中的私有数据域在该类之外是不可访问的。因此，不能在子类中直接使用。但是，如果父类中定义了公共的访问器 / 修改器，那么可以通过这些公共的访问器 / 修改器来访问和修改它们
  - 继承是用来为“是一种”关系(is-a) 建模的。不要仅仅为了重用方法这个原因而盲目地扩展一个类。
    - 例如:尽管Person类和Tree类可以共享类似高度和重量这样的通用特性，但是从Person类扩展出Tree类是毫无意义的。一个父类和它的子类之间必须存在“是一种”(is-a) 关系。
  - 某些程序设计语言是允许从几个类派生出一个子类的。这种能力称为多重继承( multiple inheritance)。但是在Java中是**不允许多重继承**的。一个Java类只可能直接继承自一个父类。这种限制称为单一继承( single inheritance)。如果使用extends关键字来定义一个子类，它只允许有一个父类

***

#### 使用 super 关键字

- 关键字 super 指代父类，可以用于调用父类中的普通方法和构造方法

- 关键字 super 可以用于两种途径：
  1 ) 调用父类的构造方法。
  2 ) 调用父类的方法。

- **调用父类的构造方法**

  - 构造方法用于构建一个类的实例。不同于属性和普通方法，父类的构造方法不会被子类继承。它们只能使用关键字 super 从子类的构造方法中调用。

  - 调用父类构造方法的语法是：
    `super()或者super(parameters);`

  - 语句 super() 调用父类的无参构造方法，而语句 super(arguments) 调用与参数匹配的父类的构造方法。

  - 语句 super() 和 super(arguments) 必须出现在子类构造方法的第一行，这是显式调用父类构造方法的唯一方式

    ```java
    public CircleFromSimpleGeometricObject(
        	double radius, String color, boolean filled){
        super(color, filled);
        this.radius = radius;
    }
    ```

    父类：

    ```java
    public class SimpleGeometricobject {
        private String color = "white";
        private boolean filled;
        private java.util.Date dateCreated;
        /** Construct a default geometric object */
        public SimpleGeometricObject() {
        	dateCreated = new java.util.DateO;
        }
        /*Construct a geometric object with the specified color and filled value */
        public SimpleGeometricObject(String color, boolean filled) {
            dateCreated = new java.util.Date( 
            this.color = color; 
            this.filled = filled;
        }
        /** Return color */
        public String getColor() {
        	return color;
        }
        /** Set a new color */
        public void setColor(String color) {
        	this.color = color; 
        }
    }
    ```

- **构造方法链**

  - 构造方法可以调用**重载的构造方法**或**父类的构造方法**。
    - 如果它们都没有被显式地调用，编译器就会自动地将 super() 作为构造方法的第一条语句
  - 在任何情况下，构造一个类的实例时，将会调用**沿着继承链的所有父类的构造方法**。
    - 当构造一个子类的对象时，子类构造方法会在完成自己的任务之前，首先调用它的父类的构造方法。
    - 如果父类继承自其他类，那么父类构造方法又会在完成自己的任务之前，调用它自己的父类的构造方法。
    - 这个过程持续到沿着这个继承体系结构的最后一个构造方法被调用为止
  - 这就是构造方法链

  ```java
  pub1ic class Faculty extends Employee {
      public static void main(String[] args) {
      	new FacultyO ;
      }
      public FacultyO) {
      	System.out.printIn("(4) Performs Faculty's tasks");
      }
      class Employee extends Person {
          pub1ic Employee() {
          this("(2) Invoke Employee's overloaded constructor");
          System. out. print1n("(3) Performs Employee's tasks ") ;
          public Employee(String s) {
          	System. out. println(s);
          }
      }
      class Person {
          public Person() {
              System.out.printIn("(1) Performs Person's tasks");
          }
  }
  //输出如下
  (1) Performs Person's tasks
  (2) Invoke Employee's overloaded constructor
  (3) Performs Employee's tasks
  (4) Performs Faculty's tasks
  ```

  ![img](C:\Users\13793\Desktop\学习笔记\Java学习\BE[TZ]`6}B03SQLZ[`E`{2B.png)

```java
public class Apple extends Fruit {
}
class Fruit {
    pub1ic Fruit(String name) {
    	System.out.print1n("Fruit's constructor is invoked");
    }
}
```

> 由于在 Apple 中没有显式定义的构造方法，因此，Apple 的默认无参构造方法被隐式调用。
>
> 因为 Apple 是 Fruit 的子类，所以 Apple 的默认构造方法会自动调用 Fruit 的无参构造方法。
>
> 然而，Fruit 没有无参构造方法，因为 Fruit 显式地定义了构造方法。因此，程序不能被成功编译

>**一般情况下，最好能为每个类提供一个无参构造方法，以便于对该类进行扩展，同时避免错误。**

***

- **调用父类的方法**

  - 关键字 super 不仅可以引用父类的构造方法，也可以引用父类的方法。所用语法如下：
    `super.方法名（参数）；`

- **方 法 重 写**

  - 要重写一个方法，需要在子类中使用和父类一样的签名以及一样的返回值类型来对该方法进行定义

  ```java
  public class CircleFromSimpleGeometri c0bject
  extends SimpleGeometri cObject {
      // Other methods are omi tted
      // Override the toString method defined in the superclass
      public String toString() {
      return super.toString() + "\nradius is "+ radius;
      }
  }
  ```

  - toString() 方法在 GeometricObject 类中定义，在 Circle 类中修改。在这两个类中定义的方法都可以在 Circle 类中使用
  - 要在 Circle 类中调用定义在 GeometricObject 中的toString 方法，使用super.toString()

- **方法重写与重载**

  - **重载**意味着使用**同样的名字**但是**不同的签名**来定义多个方法
  - **重写**意味着在子类中提供一个对方法的新的实现
    - 方法重写是指该方法必须使用相同的签名和相同的返回值类型在子类中定义

![image-20200707200738652](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200707200738652.png)

- 运行 a 中的 Test 类时，a.p(10)和 a.p(10.0)调用的都是定义在类 A 中的 p(double i)方法，所以程序都显示10.0
- 运行 b中的 Test 类时，a.p(10)调用类 A 中定义的 p(int i)方法，显示输出为 10, 而 a.p(10.0)调用定义在类 B 中的 P(double i)方法，显示输出为20.0

> 注：
>
> - 方法重写发生在**通过继承而相关的不同类**中
> - 方法重载可以发生在**同一个类**中，也可以发生在由于继承而相关的不同类中
> - 方法重写具有同样的签名和返回值类型；方法重载具有同样的名字，但是不同的参数列表

- 为了避免错误，可以使用一个特殊的 Java 语法，称 为 重 写 标 注 (override annotation)，在子类的方法前面放一个 @Override

  ```java
  public class CircleFromSimpleGeometricObject
      	extends SimpleGeometric0bject {
      // Other methods are omitted
      @Override
      public String toString() {
      	return super.toString() + "\nradius is”+ radius;
      }
  }
  ```

  - 该标注表示被标注的方法必须重写父类的一个方法。如果具有该标注的方法没有重写父类的方法，编译器将报告一个错误

***

#### Object 类及其 toString()方法

- Java 中的所有类都继承自 **java.lang.Object** 类
- 如果在定义一个类时没有指定继承性，那么这个类的父类就被默认为是 Object

![](C:\Users\13793\Desktop\学习笔记\Java学习\23.png)

- toString() 方法的签名是：
  `public String toString()`

  - 调用一个对象的 toString() 会返回一个描述该对象的字符串。默认情况下，它返回一个由该对象所属的类名、at 符号（@）以及该对象十六进制形式的内存地址组成的字符串

  - 通常，应该**重写这个 toString** 方法，这样，它可以返回一个代表该对象的描述性字符串

    ```java
    public String toString() {
        return "created on" + dateCreated + "\ncolor: " + color +
        and filled:" + filled;
    }
    ```

***

#### 多态

- 多态意味着**父类的变量可以指向子类对象**
- 面向对象程序设计的三大支柱是**封装、继承和多态**

***

#### 动态绑定

```java
Object o = new CeometricObject();
System.out.println(o.toString());
```

- 变量的**实际类型（actual type) **是被变量引用的对象的实际类
- 这里，o 的实际类型是 GeometricObject,，因为 o 指向使用 new GeometricObjectO 创建的对象 
- o 调用哪个toString()方法由 o 的实际类型决定。这称为动态绑定（dynamic binding)
  - 动态绑定工作机制如下:
    - 假设对象 o 是类C1, C2, .，Cn-1, Cn 的实例，其中C1是C2的子类，C2是C3的子类，..，Cn-1是Cn的子类
    - 也就是说C1是最特殊的类，Cn是最通用的类
    - 用的类，C1 是最特殊的类。在Java中，Cn 是object类
    - 如果对象o调用一个方法p，那么JVM会依次在类C1，C2， .，. Cn-1，Cn中查找方法p的实现，直到找到为止。
    - 一旦找到一个实现，就停止查找，然后调用这个首先找到的实现。

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20200707204723187.png" alt="image-20200707204723187" style="zoom:60%;" />

***

#### 对象转换和 instanceof 运算符

- 对象的引用可以类型转换为对另外一种对象的引用，这称为对象转换
  - m(new Student();
    - 将对象new Student() 赋值给一个 object类型的参数。这条语句等价于
      `object o = new Student(); // Implicit casting
      m(o);`
  - 由于 Student 的实例也是 Object 的实例，所以，语句 Object o = new Student()是合法的，它称为隐式转换（implicit casting)

- 显式转换

  ```java
  Student b = (Student)o; // Explicit casting
  ```

  - 总是可以将一个子类的实例转换为一个父类的变量，称为**向上转换（upcasting)**
  - 当把一个父类的实例转换为它的子类变量（称为向下转换(downcasting)) 时，必须使用转换记号 “(子类名)” 进行显式转换

- 在尝试转换之前确保该对象是另一个对象的实例。这是可以利用运算符 **instanceof** 来实现的

  ```java
  Object my0bject = new Circle();
  // Some lines of code
  /** Perform casting if my0bject is an instance of Circle */
  if (myObject instanceof Circle) {
      System.out.print("The circle diameter is”+
      	((Circle)myObject).getDiameter());
  }
  ```

  > **为什么没有在一开始就把 myObject定义为 Circle 类型呢？为了能够进行通用程序设计，一个好的经验是把变量定义为父类型，这样，它就可以接收任何子类型的值**

- 对象成员访问运算符（.）优先于类型转换运算符。使用圆括号保证在点运算符（ . ）之前进行转换，例如：
  `((Circle)object).getArea();`

***

#### 自定义栈类

- MyStack 中包含 ArrayList。
- MyStack 和 ArrayList 之间的关系为组合
- 因为继承是对 **“是一种”（is-a)**关系建模，而组合是对 **“是一部分”（has-a)**关系建模。
- 使用组合关系更好些，因为它可以定义一个全新的类，而无须继承 ArrayList 中不必要和不恰当的方法

```java
import java.util.ArrayList;
public class MyStack {
    private ArrayList<Object> list = new ArrayList<>();

    public boolean IsEmpty(){
        return list.isEmpty();
    }

    public int GetSize(){
        return list.size();
    }

    public Object Peek(){
        return list.get(GetSize() - 1);
    }

    public Object Pop(){
        Object o = list.get(GetSize() - 1);
        list.remove(GetSize() - 1);
        return o;
    }

    public void push(Object o){
        list.add(o);
    }

    @Override
    public String toString(){
        return "Stack: " + list.toString();
    }
}
```

***

#### ArrayList类

- ArrayList 对象可以用于存姥一个对象列表
- Java 提供 ArrayList 类来存储不限定个数的对象。
- ArrayList 是一种泛型类，具有一个泛型类型 E。创建一个 ArrayList 时，可以指定一个具体的类型来替换 E

![image-20200728102608222](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728102608222.png)

- `ArrayList<String> cities = new ArrayList<String>();`
- 下面语句创建一个 ArrayList 并且将其引用赋值给变量 dates
  - 该 ArrayList 对象可以用于存储日期。
    `ArrayList<java.util.Date> dates = new ArrayList< java.util.Date> ();`

- 由于使用了称为类型推导的特征，构造方法中不再要求给出具体类型。编译器可以从变量的声明中推导出类型

```java
import java.util.ArrayList;
public class TestArrayList {
    public static void main(String[] args) {，
        // Create a list to store cities
        ArrayList<String> cityList = new ArrayList<>();
        // Add some cities in the list
        cityList.add("London") ;
        // cityList now contains [London]
        cityList.add("Denver") ;
        // cityList now contains [London, Denver]
		cityList.add("Paris");
        // cityList now contains [London, Denver, Paris]
        cityList.add("Miami") ;
        // cityList now contains [London， Denver, Paris， Miami]
        cityList.add("SeouT") ;
        // Contains [London, Denver, Paris， Miami， Seou1]
        cityList.add("Tokyo") ;
        // Contains [London， Denver, Paris, Miami, Seoul, Tokyo]
                                            
        System.out.println("List size?"+ cityList.size());
        System.out.println("Is Miami in the list?"+
        	cityList.contains("Miami"));
        System.out.println("The location of Denver in the list? " +
        	cityList.indexOf("Denver"));
        System.out.println("Is the list empty? " +
        	cityList.isEmpty()); // Print false
                                            
        // Insert a new city at index 2
        cityList.add(2，"Xian");
        // Contains[London, Denver, Xian, Paris, Miami, Seoul, Tokyo]
        // Remove a city from the list
        cityList.remove("Miami");
        // Contains [London, Denver, Xian， Paris, Seou1, Tokyo]
        // Remove a city at index 1
        cityList.remove(1);
        // Contains [London, Xian, Paris, Seoul, Tokyo]
        // Display the contents in the list
        System.out.println(cityList.toString());
        // Display the contents in the list in reverse order
        for (int i = cityList.size() - 1; i >= 0; i--)
        	System.out.print(cityList.get(i) + " ");
        System.out.println() ;
        // Create a list to store two circles
        ArrayList<CircleFromSimpleGeometric0bject> list = new ArrayList<>();
        // Add two circles
        list.add(new CircleFromSimpleGeometricObject(2));
        list.add(new CircleFromSimpleGeometricObject(3)) ;
        // Display the area of the first circle in the list
        System.out.println("The area of the circle? " +
        	list.get(0).getArea());
    }
}
```

- 由于 ArrayList 位于 java.util 包中，所以在第一行导入该包

![image-20200728104307439](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728104307439.png)

![image-20200728104349108](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728104349108.png)

- —旦创建了一个数组，它的大小就确定下来了。可以使用方括号访问数组元素（例如：a[index])0 

- 当创建 ArrayList 后，它的大小为 0。

- 如果元索不在数组列表中，就不能使用get(index)和 set(index.element)方法

- 向数组列表中添加、插人和删除元素是比较容易的，而向数组中添加、插人和删除元素是比较复杂的。

- 为了实现这些操作，必须编写代码操纵这个数组。

  > 注意，可以使用`java.util.Arrays.sort(array)`方法来对一个数组排序。
  >
  > 如果要对一个数组列表排序，使用` java.util.Collections.sort(arrayList)`方法

- 假设想创建一个用于存储整数的 ArrayList, 可以使用下面代码来创建一个列表吗？
  `ArrayList<int> list « new ArrayList<>()；`
  **答案是不行**。这样行不通

  - 因为存储在 ArrayList 中的元素**必须是一种对象**。不能使用诸如 int 的基本数据类型来代替一个泛型类型
  - 你可以创建一个存储 Integer 对象的ArrayList, 如下所示：
    `ArrayList<Integer> list = new ArrayList<>();`

- **使用ArrayList代替数组**

  - ArrayList 的大小是灵活的，所以无须提前给定它的大小。而当创建一个数组时，它的大小必须给定。
  - ArrayList 包含许多有用的方法。比如，可以使用 contains 方法来测试某个元素是否在列表中。如果使用数组，则需要编写额外代码来实现该方法

- 数组列表中的元素也可以使用 foreach 循环来进行遍历，语法如下：

  ```java
  for (elementType element: arrayList){
  // Process the element
  }
  
  for (int number: list)
  System.out.print(number + " ");
  //等效于
  for (int i = 0; i < list.size(); i++)
  	System.out.print(list.get(i) + " ")
  ```

***

#### protected 数据和方法

- 一个类中的受保护成员可以从子类中访问
- 经常需要允许子类访问定义在父类中的数据域或方法，但不允许非子类访问这些数据域和方法。
- 可以使用关键字 Protected 完成该功能，父类中被保护的数据域或方法可以在它的子类中访问
- 类可以以两种方式使用：一种是用于创建该类的实例；另一种是通过扩展该类创建它的子类
  - 如果不想从类的外部使用类的成员，就把成员声明成 private。
  - 如果想让该类的用户都能使用类的成员，就把成员声明成 public。
  - 如果想让该类的扩展者使用数据和方法，而不想让该类的用户使用，则把成员声明成 Protected

>子类可以重写它的父类的 protected 方法，并把它的可见性改为 public。
>
>但是，**子类不能削弱父类中定义的方法的可访问性**。
>
>例如：如果一个方法在父类中定义为 public，在子类中也必须定义为 public













































### 11、异常处理和文本 I/O

- 方法如何通知它的调用者一个异常产生了呢？ Java 可以让一个方法可以抛出一个异常，该异常可以被调用者捕获和处理

```java
import java. util. Scanner ;
public class QuotientWithException {
    public static int quotient(int number1, int number2) {
        if (number2 == 0) 
        throw new ArithmeticException("Divisor cannot be zero");
        return number1 / number2;
}
public static void main(String[] args) {
    Scanner input = new Scanner (System. in) ;
    // Prompt the user to enter two integers
    System.out.print("Enter two integers: ");
    int number1 = input.nextInt();
	int number2 = input.nextInt() ;
    try {
        int result = quotient(number1, number2);
        System.out.println(number1 + "/ "+ number2 + " is "
        + result);
    }
    catch (ArithmeticException ex) {
        System.out.println("Exception: an integer " +
        "cannot be divided by zero ");
    }
    System.out.println("Execution continues ...");
    }
}
```

- 抛出的值为 new ArithmeticException("Divisor cannot be zero")， 称为—个异常( exception)

- 异常就是一个从异常类创建的对象。在这种情况下，异常类就是java.lang.ArithmeticException

- 调用方法的语句包含在一个 try 块和一个 catch 块中

  - try 块包含了正常情况下执行的代码
  - 异常被 catch 块所捕获，catch块中的代码执行以处理异常

- catch 块的头部
  `catch (ArithmeticException ex)`

  - 标识符 ex 的作用很像是方法中的参数。所以，这个参数称为 catch 块的参数
  - ex 之前的类型（例如，**ArthmeticException**) **指定了 catch 块可以捕获的异常类型**。一旦捕获该异常，就能从 catch 块体中的参数访问这个抛出的值

- 一个 try-throw-catch 块的模板可能会如下所示

  ```java
  try {
      Code to run;
      A statement or a method that may throw an exception;
      More code to run;
  }
  catch (type ex) {
  	Code to process the exception;
  }
  ```

***

#### 异常类型

- 异常是对象，而对象都采用类来定义。异常的根类是 java.lang.Throwable

![](C:\Users\13793\Desktop\学习笔记\Java学习\24.png)

- 这些异常类可以分为三种主要类型：**系统错误、异常和运行时异常**

  - 系统错误（system error) 是由 Java 虚拟机抛出的，用 **Error 类**表示。Error 类描述的是内部系统错误。这样的错误很少发生。如果发生，除了通知用户以及尽量稳妥地终止程序外，几乎什么也不能做

    |         类          |                      可能引起异常的原因                      |
    | :-----------------: | :----------------------------------------------------------: |
    |    LinkageError     | 一个类对另一个类有某种依赖性，但是在编译前者后，后者进行了修改，变得不兼容 |
    | VirtualMachineError |        Java 虚拟机崩溃，或者运行所必需的资源已经耗尽         |

  - 异常（exception) 是用 **Exception 类**表示的，它描述的是由程序和外部环境所引起的错误，这些错误能被程序捕获和处理

    |           类           | 可能引起异常的原因                                           |
    | :--------------------: | :----------------------------------------------------------- |
    | ClassNotFoundException | 试图使用一个不存在的类。例如，如果试图使用命令 java 来运行一个不存在的类或者程序要调用三个类文件而只能找到两个，都会发举这种异常 |
    |      IOException       | 同输入/ 输出相关的搡作，例如，无效的输人、读文件时超过文件尾、打开一个不存在的文件等。IOException 的子类的例子有 InterruptedlOException、EOFException (EOF 是 End Of File 的缩写）和 FileNotFoundException |

  - 运行时异常（runtime exception) 是用 **RuntimeException 类**表示的，它描述的是程序设计错误，例如，错误的类型转换、访问一个越界数组或数值错误

    | 类                        | 可能引起异常的原因                                       |
    | ------------------------- | -------------------------------------------------------- |
    | ArithmeticException       | 整数除以 0，注意，浮点数的算术运算不抛出异常。参见附录 E |
    | NullPointerException      | 试图通过一个 null 引用变量访问一个对象                   |
    | IndexOutOfBoundsException | 数组的下标超出范围                                       |
    | IllegalArgumentException  | 传递给方法的参数非法或不合适                             |

  - RuntimeException、Error 以及它们的子类都称为**免检异常**（unchecked exception)。所有其他异常都称为**必检异常**（checked exception), 意思是指编译器会强制程序员检査并通过 try-catch 块处理它们，或者在方法头进行声明

***

- **异常的声明**

  - 方法要拋出的其他异常都必须在方法头中显式声明，这样，方法的调用者会被告知有异常

    `public void myMethodO throws IOException`

  - 如果方法可能会抛出多个异常，就可以在关键字 throws 后添加一个用逗号分隔的异常列表：
    `public void myMethod()
         throws Exceptionl, Exception2,…，ExceptionN`

    > 如果方法没有在父类中声明异常，**那么就不能在子类中对其进行继承来声明异常**

- **抛出异常**

  - 检测到错误的程序可以创建一个合适的异常类型的实例并抛出它，这就称为抛出一个异常（throwing an exception)

  - 假如程序发现传递给方法的参数与方法的合约不符（例如，方法中的参数必须是非负的，但是传入的是一个负参数)，这个程序就可以创建 **illegalArgumentException** 的一个实例并抛出它，如下所示：
    `illegalArgumentException ex = new illegalArgumentException("Wrong Argument");
    throw ex;`

    或者：

    `throw new illegalArgumentException("Wrong Argument");`

  - **声明异常的关楗字是 throws, 抛出异常的关键字是 throw**

- **捕获异常**

  - 当抛出一个异常时，可以在try-catch 块中捕获和处理它

  ```java
  try {
  	statements; // Statements that may throw exceptions
  }
  catch (Exception1 exVar1) {
  	handler for exception 1;
  }
  catch (Exception2 exVar2) {
  	handler for exception 2;
  }
  catch (ExceptionN exVarN) {
  	handler for exception N;
  }
  ```

  - 如果在执行 try 块的过程中没有出现异常，则跳过 catch 子句。
  - 如果 try 块中的某条语句抛出一个异常，Java 就会跳过 try 块中剩余的语句，然后开始査找处理这个异常的代码的过程
    - 从第一个到最后一个逐个检査 catch 块，判断在 catch 块中的异常类实例是否是该异常对象的类型。
    - 如果是，就将该异常对象赋值给所声明的变量，然后执行 catch 块中的代码。
    - 如果没有发现异常处理器，Java 会退出这个方法，把异常传递给调用这个方法的方法，继续同样的过程来査找处理器
  - 如果在调用的方法链中找不到处理器，程序就会终止并且在控制台上打印出错信息。寻找处理器的过程称为捕获一个异常

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\`HZ3X(EQB)`8]{`4JMMW[Y.png" alt="img" style="zoom:150%;" />

- 如果异常类型是 Exceprion3，它就会被 method2 中处理异常 ex3 的 catch 块捕获。跳过 statement5, 然后执行 statement6
- 如果异常类型是 Exception2，则退出 method2, 控制被返回给 method1, 而这个异常就会被 method1中处理异常 ex2 的 catch 块捕获。跳过 statement3, 然后执行statement4
- 如果异常类型是 Exceptiou1, 则退出 method1， 控制被返回给 main 方法，而这个异常就会被 main 方法中处理异常 ex1 的 catch 块捕获。跳过 statement1， 然后执行statement2
- 如果异常类型没有在 method2、method1 和 main 方法中被捕获，程序就会终止。不执行 statement1 和 statement2

> 在 catch 块中异常被指定的顺序是非常重要的。如果父类的 catch 块出现在子类的catch 块之前，就会导致编译错误。例如，a 中的顺序是错误的，因为 RuntimeException是 Exception 的一个子类。正确的顺序应该如 b 中所示

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\{3QR7$LBDXVSF3_QWPQ_8.png" alt="img" style="zoom:67%;" />

- 对于使用同样的处理代码处理多个异常的情况，可以使用新的 JDK7 的多捕获特征 简化异常的代码编写

  - 语法是

  ```java
  catch (Exception1 | Exception2| ...| Exceptionk ex) {
  // Same code forQhandling these excepti ons
  }
  ```

  - 每个异常类型使用竖线（ i ) 与下一个分隔。如果其中一个异常被捕获，则执行处理的代码

***

#### 从异常中获取倍息

- **printStackTrace()**方法在控制台上打印栈跟踪信息
- **getStackTrace()**方法提供编程的方式，来访问由 printStackTrace() 打印输出的栈跟踪信息

![image-20200708141934252](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200708141934252.png)

***

#### finally子句

```java
try {
	statements;
}
catch(TheException ex){
	handling ex;
}
finally{
    sentence;
}
```

- 在任何情况下，finally 块中的代码都会执行，不论 try 块中是否出现异常或者是否被捕获。考虑下面三种可能出现的情况
  - 如果 try 块中没有出现异常，执行 finalStatements, 然后执行 try 语句的下一条语句
  - 如果 try 块中有一条语句引起异常，并被 catch 块捕获，然后跳过 try 块的其他语句，执行 catch 块和 finally 子句。执行 try 语句之后的下一条语句
  - 如果 try 块中有一条语句引起异常，但是没有被任何 catch 块捕获，就会跳过 try 块中的其他语句，执行 finally 子句，并且将异常传递给这个方法的调用者
- 即使在到达 finally 块之前有一个 return 语句，finally 块还是会执行

> **使用 finally 子句时可以省略掉 catch 块**

***

#### 何时使用异常

- 当错误需要被方法的调用者处理的时候，方法应该抛出一个异常

- 由于异常处理需要初始化新的异常对象，需要从调用栈返回，而且还需要着方法调用链来传播异常以便找到它的异常处理器，所以，异常处理通常需要更多的时间和资源

- —般来说，一个项目中多个类都会发生的共同异常应该考虑作为一种异常类。对于发生在个别方法中的简单错误最好进行局部处理，无须抛出异常

- 在代码中，应该什么时候使用try-catch块呢?当必须处理不可预料的错误状况时应该使用它。

  - 不要用try-catch块处理简单的、可预料的情况

    ```java
    try {
    	System.out.print!n(refVar.toString());
    }
    catch(Nul1PointerException ex){
    	System.out.println('VefVar is null");
    }
    最好用以下代码代替：
    if(refVar != null)
    	System.out.println(refVar.toString());
    else
    	System.out.print1n("refVar is null");
    ```

***

#### 创建自定义异常类

- 可以通过派生 java.lang.Exception 类来定义一个自定义异常类
- 如果进到一个不能用预定义异常类恰当描述的问题，那就可以通过派生 Exception 类或其子类，例如，IOException, 来创建自己的异常类

------------------

#### File类

- File 类包含了获得一个文件 / 目录的属性，以及对文件 / 目录进行改名和删除的方法
- 在文件系统中，每个文件都存放在一个目录下。
  - 绝对文件名（ absolute file name) 是由文件名和它的完整路径以及驱动器字母组成
  - 相对文件名是相对于当前工作目录的。
  - 对于相对文件名而言，完整目录被忽略。
  - 例如，Welcome.java 是一个相对文件名。如果当前工作目录是 c:\book, 绝对文件名将是 c:\book\
    Welcome.java
- 文件名是一个字符串。File 类是文件名及其目录路径的一个包装类。
- 例如，在Windows 中，语句 `new File("c:\\book") `在目录 c:\book 下创建一个 File 对象
- 而语句 `new File ("c:\\book\\test . dat") `为文件 `c:\book\test.dat `创建一个 File 对象
- 可以用File类的 **isDirectory()**方法来判断这个对象**是否表示一个目录**，还可以用 **isFile()**方法来判断
  这个对象是否表示一个文件名

>**在 Windows 中目录的分隔符是反斜杠（\\)。但是在 Java 中，反斜杠是一个特殊的字符，应该写成 \\\ 的形式**

- 构建一个 File 实例并不会在机器上创建一个文件。不管文件是否存在，都可以创建任意文件名的 File 实例。可以调用 File 实例上的 exists() 方法来判断这个文件是否存在

> 注：**在程序中，不要直接使用绝对文件名**。如果使用了像 c:\\book\\Welcome.java 之类的文件名，那么它能在 Windows 上工作，但是不能在其他平台上工作。应该使用与当前目录相关的文件名
>
> 例如，可以使用 new Filerwelcome.java")为在当前目录下的文件 Welcome.java 创建一个 File 对象。
>
> 可以使用 new File("image/us.gif")为在当前目录下的 image目录下的文件 us.gif创建一个 File 对象。斜杠（/) 是 Java 的目录分隔符

```java
public class TestFileClass {
    public static void main(String[] args) {
        java.io.File file = new java. io.File("image/us.gif");
        System.out.println("Does it exist?" + file.exists());
        System.out.print1n("The file has " + file.length() + " bytes");
        System.out.print1n("Can it be read? "+ file.canRead()) ;
        System.out.print1n("Can it be written? " + file.canWrite());
        System.out.print1n("Is it a directory? " + file.isDirectory();
        System.out.print1n("Is it a file?" + file.isFile());
        System.out.println("Is it absolute? " + file.isAbsolute());
        System.out.print1n("Is it hidden? " + file.isHidden());
        System.out.print1n("Absolute path is" + file.getAbsolutePath();
        System.out.print1n("Last modified on" + new 				
            java.util.Date(file.1astModifiedO));
    }
}
```

***

#### 文件输入和输出

- 使用 Scanner 和 PMntWriter 类从（向）文本文件读（写)字符串和数值信息
- java.io.PrintWriter 类可用来创建一个文件并向文本文件写人数据。首先，必须为一个文本文件创建一个 PrintWriter 对象，如下所示

```java
PrintWriter output = new PrintWriter(filename);
//用 PrintWriter 的构造方法可能会抛出某种I/O 异常。Java 强制要求编写代码来处理这类异常
```

![image-20200709155451497](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200709155451497.png)

- **使用 try-with-resources 自动关闭资源**

  ```java
  try(
      // Create a file
      java. io. PrintWriter output = new java. 10, Printwriter(file);
  ){
      // Write formatted output to the file
      output. print("John T Smith ");
      output . print1n(90) ;
      output . print("Eric K Jones ") ;
      output. print1n(85);
  }
  ```

  - 关键字 try 后声明和创建了一个资源
  - 注意，资源放在括号中
  - 资源必须是 AutoCloseable 的子类型，比如 PrinterWHter, 具有一个 close()方法
  - 资源的声明和创建必须在同一行语句中，可以在括号中进行多个资源的声明和创建。紧接着资源声明的
    块中的语
  - 块结束后，资源的 closeO 方法自动调用以关闭资源。使用 try-with-resourse 不仅可以避免错误，而且可以简化代码

- **使用 Scanner 读数据**

  <img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20200709165120776.png" alt="image-20200709165120776" style="zoom:150%;" />

```java
// Read data from a file 
while (input.hasNext()) {
    String firstName = input.next() ;
    String mi = input.next() ;
    String lastName = input.next() ;
    int score = input.nextInt() ;
    System.out.println(firstName +" " + mi +" " + lastName +" "+ score);
}
input.close();
```

![image-20200709165721809](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200709165721809.png)

- 为创建 Scanner 从文件中读取数据，必须使用构造方法 new File(filename) 利用 java.io.File 类创建 File 的一个实例
- 方法 next()和 nextLineO 都会读取一个字符串。nextO 方法读取一个由分隔符分隔的字符串，但是 nextLine() 读取一个以换行符结束的行
- 行分隔符字符串是由系统定义的，在 Windows 平台上* \r\n, 而在 UNIX 平台上
  是 V«。为了得到特定平台上的行分隔符，使用
  `String lineSeparator = System.getPropertyC'line.separator");`
- 如果从键盘输入，每行就以田车键（Enter key) 结束，它对应于\n字符

- 可以使用 Scanner 类从文件或者键盘读取数据。也可以使用 Scanner 类从一个字符串扫描数据。例如，下面代码

```java
Scanner input = new ScannerC'13 14");
int sum = input.nextlntO + input.nextlntO;
System.out.println("Sum is " + sum);
```

***

### 13、抽象类和接口

- 父类中**定义了相关子类中的共同行为**。接口可以用于**定义类的共同行为**（包括非相关的类）

#### 抽象类

- 抽象类不可以用于创建对象。抽象类可以包含抽象方法，这些方法将在具体的子类中实现
  - 在继承的层次结构中，每个新子类都使类变得越来越明确和具体。
  - 如果从一个子类追溯到父类，类就会变得更通用、更加不明确。
  - 类的设计应该确保父类包含它的子类的共同特征。
  - 有时候，一个父类设计得非常抽象，以至于它都没有任何具体的实例。这样的类称为抽象类（abstract class)
- **在类头使用abstract 修饰符表示该类为抽象类**

```java
public abstract class Geometricobject {
    private String color = "white";
    private boolean filled;
    private java.util.Date dateCreated;
    /*Construct a default geometric object */
    protected GeometricObject() {
    	dateCreated = new java.util.Date();
    }
    /** Construct a geometric object with color and filled value **/
    protected GeometricObject(String color, boolean filled){                          
        dateCreated = new java.util.Date();
        this.color = color;
        this.filled = filled;
    }
    /*Return color */
    public String getColor( {
    	return color;
    }
    /*Set a new color */
    public void setColor(String color){
    	this.color = color;
    }
    
    /*Return filled.Since filled is boolean,
    * the get method is named isFilled */
    public boolean isFilled() {
        return filled;
    }
    /**Set a new filled */
    public void setFilled(boolean filled) {
    	this.filled = filled;
    }
    /**Get dateCreated */
    public java.util.Date getDateCreated() {
    	return dateCreated;
    }
    @0verride
    public String toString(){
        return "created on " + dateCreated + "\ncolor: " + color +
    		" and filled: " + filled;
    }
    /**Abstract method getArea */
    public abstract double getArea();
    /**Abstract method getPerimeter */
    public abstract double getPerimeter();
}
```

![](C:\Users\13793\Desktop\学习笔记\Java学习\25.png)

- 抽象类的构造方法定义为 **Protected**，因为它只被子类使用。
- 创建一个具体子类的实例时，它的父类的构造方法被调用以初始化父类中定义的数据域

***

- 抽象方法不能包含在非抽象类中。
  - 如果抽象父类的子类不能实现所有的抽象方法，那么子类也必须定义为抽象的。
  - 换句话说，在抽象类扩展的非抽象子类中，必须实现所有的抽象方法
- 抽象类是不能使用 new 操作符来初始化的。
  - 但是，仍然可以定义它的构造方法，这个构造方法在它的子类的构造方法中调用
- 包含抽象方法的类必须是抽象的。但是，可以定义一个不包含抽象方法的抽象类。
  - 在这种情况下，不能使用 new 操作符创建该类的实例。
  - 这种类是用来定义新子类的基类的
- 子类可以覆盖父类的方法并将它定义为 abstract。
  - 这是很少见的，但是它在当父类的方法实现在子类中变得无效时是很有用的。
  - 在这种情况下，子类必须定义为abstract

***

#### 接口

- 接口是一种与类相似的结构，只包含常量和抽象方法

- 它的目的是指明相关或者不相关类的多个对象的共同行为。例如，使用正确的接口，可以指明这些对象是可比较的、可食用的，以及可克隆的

- 为了区分接口和类，Java 采用下面的语法来定义接口：

  ```java
  修饰符interface 接口名 {
      /**常董声明*/
      /**方法签名*/
  }
  modifier interface InterfaceName {
      /** Constant declarations */
      /** Abstract method signatures * /
  }
  ```

  - 与抽象类相似，不能使用 new 操作符创建接口的实例
  - 可以使用 Edible 接口来明确一个对象是否是可食用的。这需要使用 **implements 关键字**让对象的类实现这个接口来完成
  - 类和接口之间的关系称为接口继承（ interface inheritance)

```java
public class FirstExercise{
    public static void main(String[] args){
        Object[] objects = {new Tiger(), new Chicken(), new Apple()};
        for (int i = 0; i < objects.length; i++){
            if (objects[i] instanceof Edible)
                System.out.println(((Edible)objects[i]).howToEat());
            if (objects[i] instanceof Animal) {
                System.out.println(((Animal)objects[i]).sound());
            }
        }
    }
}
interface Edible{
    abstract String howToEat();
}
abstract class Animal{
    /**Return animal sound */
    public abstract String sound();
}
class Chicken extends Animal implements Edible{
    public String howToEat(){
        return "Chicken: Fry it";
    }
    @Override
    public String sound(){
        return "Chicken: cock-a-doodle-doo";
    }
}
class Tiger extends Animal{
    @Override
    public String sound(){
        return "Tiger: RROOAARR";
    }
}
abstract class Fruit implements Edible {
    public abstract String howToEat();
}
class Apple extends Fruit{
    @Override
    public String howToEat(){
        return "Apple:Make apple cider";
    }
}
//Data fields，constructors，and methods omitted here
class Orange extends Fruit {
    @Override
    public String howToEat() {
        return "Orange: Make orange juice";
    }
}
```

- Animal 类定义了 sound 方法（第 12 行)。这是个抽象方法，将被具体的动物类所实现

- Chicken 类实现了 Edible 接口以表明小鸡是可食用的

- 当一个类实现接口时，该类用同样的签名和返冋值类型实现定义在接口中的所有方法
  - Chicken 类实现了 howToEat:方法（第18 ~ 20 行）。Chicken 也继承 Animal 类并实现 sound 方法

![img](C:\Users\13793\Desktop\学习笔记\Java学习\KYW__5Q29INY3@DEYJLAKQY.png)

- Fruit 类实现 Edible。因为它不实现 howToEat 方法，所以 Fruit 必须表示为 abstract(第30行）
  - Fruit 的具体子类必须实现 hotToEat 方法。Apple 类和 Orange 类实现 howToEat 方法

- 由于接口中所有的數据城都是 public static final 而且所有的方法都是 public abstract, 所以 Java 允许忽略这些修饰符

![image-20200711091346255](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200711091346255.png)

***

#### Comparable接口

- Comparable 接口定义了 compareTo 方法，用于比较对象
- 假设要设计一个求两个相同类型对象中较大者的通用方法。这里的对象可以是两个学生、两个日期、两个矩形或者两个正方形。为了实现这个方法，这两个对象必须是可比较的。
  - 因此，这两个对象都该有的共同方法就是 comparable (可比较的）

```java
// Interface for comparing objects, defined in java.lang
package java.lang;
public interface Comparable<E>{
	public int compareTo(E o);
}
```

- compareTo 方法判断这个对象相对于给定对象 o 的顺序
  - 并且当这个对象小于、等于或大于给定对象 o 时，分别返回负整数、0或正整数
  - Comparable 接口是一个泛型接口

![image-20200711092231917](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200711092231917.png)

- 可以使用 compareTo 方法来比较两个数字、两个字符串以及两个日期

```java
System.out.println("ABC".compareTo("ABE"));
System.out.println(date1.compareTo(date2));
System.out.println(new Integer(3).compareTo(new Integer(5)));
java.util.Date date1 = new java.util.Date(2013，1，1);
java.util.Date date2 = new java.util.Date(2012，1，1);
//显示
-1
-2
1
```

***

#### clonable接口



***

#### 类的设计原则

> **类的设计原則有助于设计出合理的类**

- **内聚性**
  - 类应该描述一个单一的实体，而所有的类操作应该在逻辑上相互配合，支持一个一致的目的。
  - 例如：可以设计一个类用于学生，但不应该将学生与教职工组合在同一个类中，因为学生和教职工是不同的实体
- **一致性**
  - 为类、数据域和方法选取具有信息的名字。
  - 通常的风格是将数据声明置于构造方法之前，并且将构造方法置于方法之前
  - 选择名字要保持一致。给类似的操作选择不同的名字并非良好的实践
- **封装性**
  - 类应该使用 private 修饰符隐藏其数据，以免用户直接访问它。这使得类更易于维护

***

#### **实例和静态**

- 如果一个变量被类的所有实例所共享，那就应该将它声明为静态的
- 如果方法不依赖于某个具体的实例，那就应该将它声明为静态方法。
  - 例如：CircleWithPrivateDataFields 中的 getNumberOfObjectsO方法没有绑定到任何具体实例，因此，它被声明为静态方法
- 应该总是使用类名（而不是引用变量）引用静态变量和方法，以增强可读性并避免错误
- 不要从构造方法中传人参数来初始化静态数据域。最好使用 set 方法改变静态数据域

![image-20200711100336177](C:\Users\13793\Desktop\学习笔记\Java学习\image-20200711100336177.png)

- 实例和静态是面向对象程序设计不可或缺的部分。数据域或方法要么是实例的，要么是静态的



***

### 14.JavaFx基础

#### 14.3JavaFX 程序的基本结构

```java
import javafx.application .Application;
import javafx.scene.Scene;
import javafx.scene.contro1.Button;
import javafx.stage.Stage;
pub1ic class MyJavaFX extends Application{
    @Override // Override the start method in the Application class
    pub1ic void start(Stage primaryStage){
        // Create a scene and place a button in the scene
        Button btOK = new Button("OK");
        Scene scene = new Scene(btOK，200，250);
        primaryStage.setTitle("MyJavaFX");//Set the stage title
    	primaryStage.setScene(scene);// Place the scene in the stage
        primaryStage.show();// Display the stage
    }
    public static void main(String[]args） {
    	Application.1aunch(args);
    }
```

- 主类重写了定义在 javafx.application.Application 类中的 start 方法（第 8 行）。
  - 当—个 JavaFX 应用启动时，JVM 使用它的无参构造方法来创建类的一个实例，同时调用其start 方法
- start 方法一般用于将 UI 组件放人一个场景，并且在舞台中显示该场景
- 第 9 行创建一个 Button 对象并将其置于一个 Scene 对象中。
  - 一个 Scene 对象可以使用构造方法 `Scene(Node, width, height)`创建。这个构造方法指定了场景的宽度和高度并且将节点置于一个场景中
- —个 Stage 对象是一个窗体。当应用程序启动的时候，一个称为主舞台的 Stage 对象由JVM 自动创建
- 根据需要，可以创建其他舞台

```java
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.contro1.Button;
import javafx.stage.Stage;

public class Mu7tipleStageDemo extends Application{
    @0verride // Override the start method in the Application class

    public void start(Stage primaryStage){
        // Create a scene and place a button in the scene
        Scene scene = new Scene(new Button("OK"),200,25);
        primaryStage.setTitle("MyJavaFX");// Set the stage title
        primaryStage.setScene(scene);// Place the scene in the stage
        primaryStage.show();// Display the stage

        Stage stage = new Stage();// Create a new stage
        stage.setTitle("Second Stage");// Set the stage title
        stage.setScene(new Scene(new Button("New stage"),100,100));
        stage.show();// Display the stage
}

```

- 从现在开始，为简明起见，main 方法都不会列在 JavaFX 源代码中
- 默认情况下，用户可以改变舞台的大小。如要防止用户改变舞台大小，调用` stage.setResizable(false) `实现

***

####  14 . 4面 板、Ul 组件以及形状

- 面板、UI 组件和形状是 Node 的子类型
- 将节点置于一个面板中，然后将面板再置于一个场景中。
  - 节点是可视化组件，比如一个形状、一个图像视图、一个UI 组件或者一个面板。
  - 形状是指文字、直线、圆 、椭圆、矩形、弧、多边形、折线等。
  - UI 组件是指标签、按钮、复选框、单选按钮、文本域、文本输入区域等

> 请注意，Scene 可以包含 Control 或者 Pane, 但是不能包含 Shape 和 ImageView。
>
> Pane可以包含 Node 的任何子类型。
>
> 可以使用构造方法` Scene(Parent, width, height)`或者`SCene(Parent)`创建 Scene。
>
> 后一个构造方法中场景的尺寸将自动确定。Node 的每个子类都有一个无参的构造方法，用于创建一个默认的节点

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20200728080028968.png" alt="image-20200728080028968" style="zoom:50%;" />

```java
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.contro1. Button ;
import javafx.stage.Stage;
import javafx.scene.layout.StackPane;
public class ButtonInPane extends Application {
    @Override //Override the start method in the Application class
    public void start(Stage primaryStage) {
        // Create a scene and place a button in the scene ;
        StackPane pane = new StackPane() ;
        pane.getChildren().add(new Button("OK")) ;
        Scene scene = new Scene(pane,200,50) ;
        primaryStage.setTitle("Button in a pane"); // Set the stage title
        primaryStage.setScene(scene); // P1ace the scene in the stage
        primaryStage.show(); // Display the stage
    }
}
```

 - 程序创建一个 StackPane (第 10 行)，然后将一个按钮作为面板的组成部分（child) 加人（第 12行)。
 - getChildren() 方法返回 `javafx.collections.ObservableList `的一个实例。
`ObservableList `类似于 ArrayList, 用于存储一个元素集合
 - 调用 add(e)将一个元素加入列表。StackPane 将节点置于面板中央，并且置于其他节点之上。
 - 这里只有一个节点在面板中。StackPane 会得到一个节点的偏好尺寸。所以我们看到按钮以它的偏好尺寸显示

***

程序清单 14-4给出了一个在面板中央显示圆的示例

```java
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.stage.Stage;

public class ShowCircle extends Application {
    @Override // Override the start method in the Application class
    public void start(Stage primaryStage){
        //Create a circle and set its properties
        Circle circle = new Circle();
        circle.setCenterX(100) ;
        circle.setCenterY(100);
        circle.setRadius(50);
        circle.setStroke(Color.BLACK);
        circle.setFill(Color.WHITE);
        //Create a pane to hold the circle
        Pane pane = new Pane();
        pane.getChildren().add(circle) ;
        //Create a scene and place it in the stage
        Scene scene = new Scene(pane, 200, 200) ;
        primaryStage.setTitle("ShowCircle"); // Set the stage title
        primaryStage.setScene(scene); // Place the scene in the stage
        primaryStage.show(); // Display the stage
    }
}
```

- Java 图形的尺寸单位都使用像素 
- 在 Java 坐标系中，JC 坐标从左到右递增， 坐标从上到下递增

***

#### 14.5属性绑定

- 可以将一个目标对象绑定到源对象中。源对象的修改将自动反映到目标对象中
- JavaFX 引人了一个称为属性绑定的新概念，可以将一个目标对象和一个源对象绑定。如果源对象中的值改变了，目标对象也将自动改变
- 目标对象称为绑定对象或绑定属性，源对象称为可绑定对象或者可观察对象

- 窗体改变大小后为了圆依然显示在中央. 圆心的 x 坐 标 和 坐 标 需要重新设置到面板的中央。
  - 可以通过将 centerX 和 centerY 分别绑定到面板的 width/2 以及height/2 上面实现

- 一个目标采用 bind 方法和源进行绑定，如下所示：
  `target.bind(source);`
- bind 方法在 javafx.beans.property.Property 接口中定义。绑定属性是 javafx.beans.property.Property 的一个实例
- JavaFX 为基本类型和字符串定义绑定属性。对于 double/float/1ong/int/boolean 类型
  的值，它的绑定属性类型是 DoubleProperty/FloatProperty/LongProperty/IntegerProperty/
  BooleanProperty。对于字符串而言，它的绑定属性类型是 StringProperty。这些属性同时也
  是 Obsen/ableValue 的子类型。因此它们也可以作为源对象来进行属性绑定
- JavaFX 类（如 Ci.rcle) 中的每个绑定属性（如 centerX) 都有一个获取方法（如getCenter()) 和设置方法（如 setCenterX(double)) 用于返回和设置属性的值
- 同时还有一个获取方法返回属性本身。这个方法的命名习惯是在属性名称后面加上单词 Property
- 数值类型的绑定属性类（如 DoubleProperty 和 IntergerProperty) 具有 add、substract、multiply 以及 divide 方法，用于对一个绑定属性中的值进行加、减、乘、除，并返回一个新的可观察属性。因此，pane.widthPropertyO.divide(2)返回一个代表 pane 的一半宽度的新的可观察属性

***

#### 14.6节点的通用属性和方法

- JavaFX 中，样式属性使用前缀 -fx-进行定义。每个节点拥有它自己的样式属性
- 设定样式的语法是 styleName:value。一个节点的多个样式属性可以一起设置，通过分号（；）进行分隔。

`circle.setStyle("-fx-stroke: black; -fx-fill: red;");`

- 如果使用了一个不正确的 JavaFX CSS, 程序依然可以编译和运行，但是样式将被忽略