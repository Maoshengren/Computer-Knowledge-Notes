# Java数据结构

### 查看源代码方法：

Ctrl+p 在输入文本框中加一个#，如：

```
#ArrayList
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
  `list. add("Red");`

- 如果试图向其中添加非字符串，就会产生编译错误。例如，下面的语句就是不合法的，因为list只能包含字符串:
  `list. add(new Integer(1));`
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
- 如果元素的类没有实现Comparab1e接口又将如何呢? 这些元素可以比较么?
- 可以定义一个比较器(comparator）来比较不同类的元素
- 要做到这一点，需要创建一个实现`java.util.Comparator\<T>`接口的类并重写它的compare方法。
  - 如果element1小于element2，就返回一个负值
  - 如果element1大于element2，就返回一个正值
  - 若两者相等，则返回0。
- `public int compare(T element1，Telement2)`

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

