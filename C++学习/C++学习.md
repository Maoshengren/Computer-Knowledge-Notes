# C++学习

## 1、开始学习C++

### 1、1头文件

>像iostream 这样的文件叫做包含文件，也叫头文件

___
### 1、2名称空间
>使用名称空间编译指令来使得iostream中的定义对程序可用
>```
>using name std;
>```

___
### 1、3使用cout进行C++输出
>```c++
>cout << "come up and C++ me some time.";
>cout << endl;
>```
> * 双引号括起来的一系列字符叫字符串
> * <<符号表示该语句把这个字符串发送给cout
> * cout是一个预定义的对象

> * endl是一个特殊的C++符号：重起一行
> * endl 等对cout来说有特殊意义的特殊符号被称为控制符

___
注：在C和C++中不能把空格、回车、制表符放在元素中间
      更不能把回车放在字符串中间

```c++
int main()
return 0;
cout << "Behold the Beas 
of beauty!";	//错误
```
___
### 1、4源代码中标记和空白
 * 一行代码中不可分割的元素叫标记
 * 必须用空格、制表符、回车将两个标记分开
```
int main()
```
___
### 1、5类简介
>类是用户定义的一种数据类型
>定义类
>	- 描述它能够表示的信息
>	- 可对数据执行的操作

___
## 2、处理数据

头文件climit中定义的宏

<img src="C:\Users\13793\Desktop\学习笔记\pictures\C++ imgs\c1.png">

<img src="C:\Users\13793\Desktop\学习笔记\pictures\C++ imgs\c2.png">

### 2、1char类型

>```c++
>int main(){
>char ch = 'M';
>int i = ch;
>cout << "The code for M is" << ch << endl;
>cout << "The character i is " << i << endl;
>ch = ch + 1;
>i = ch;
>cout << "Now M changes into " << ch << endl;
>cout << "Now i changes into " << i << endl;
>return 0;
>}
>```
___
 * 输出时ch将被输出成M，
而i被输出为77；
 * **ch**和**i**的值的类型引导**cout**选择如何显示值

> 函数 **cout. put()**是一个重要的C++OOP概念成员函数一一的第一个例子。

- 类定义了如何表示和控制数据。
- 成员函数归类所有,描述了操纵类数据的方法。
  - 例如类 ostream有一个put()成员函数,用来输出字符。只能通过类的特定对象(例如这里的cout对象
    来使用成员函数
  - 要通过对象(如cout)使用成员函数,必须用句点将对象名和函数名称(pu()连接起
    来
  - 句点被称为成员运算符。 cout. put()的意思是,通过类对象cout来使用函数put()

***

### 2、2浮点类型

<img src="C:\Users\13793\Desktop\学习笔记\pictures\C++ imgs\c3.png" width="500px">

- **float.h头文件中的定义**

<img src="C:\Users\13793\Desktop\学习笔记\pictures\C++ imgs\c4.png" width="1000px">



### 2、3C++类型转换

 1.自动类型转换
 * 将一种算术类型赋给另一种算数类型变量时
 * 表达式包含不同的类型时
 * 将参数传递给函数时
___
>潜在的数值转换问题
>* 较大浮点类型转换为较小浮点类型，如将double转换为float
>* 将浮点类型转换为整型
>* 较大整型转换为较小整型

**注：将0赋给bool变量，被转换为false；非0转换为true.**

C++使用大括号的初始化称为列表初始化{}
 * 对类型转换更为严格，不允许缩窄（即变量的类型无法表示赋给它的值）如将浮点类型赋给整数类型
___
 2.表达式中的转换
 * 自动转换
 >计算表达式时，C++将bool、char、unsighed char、sighed char、short值转换为int,如
 >```
 >short chickens =20;
 >shor ducks =35;
 >short fowl = chickens +ducks;
 >```

执行第三行语句，C++取得chickens和ducks值，转换为int，再将结果转换为short。

___
 * 强制类型转换
>如将储存在int类型中的值转换为long类型
>通用格式：
>**（typename）value
>    typename（value）**
>第一种格式来自C，第二种属于C++

***
### 1、7C++数组初始化
>初始化方法
 * 初始化数组，可以省略等号
 * 可不在大括号内包含任何东西，这将把所有元素设置成0
 * 列表初始化禁止缩窄转换，如
**```
long plifs[]={25,93,31.0}```**
***

### 1、8字符串
>字符串时存储在内存连续字节中的一系列字符.

 - C-风格字符串
  >以空字符结尾（null character），写作\0用来标记 字符串结尾.
   （对C-风格字符串而言至关重要）.
___
![img](file:///C:\Users\13793\AppData\Roaming\Tencent\Users\1379338142\QQ\WinTemp\RichOle\]MV@IVU3MF%2IM{6CMINFAL.png)

字符串常量（只需使用一个用括号括起的字符串），如：

```
char fish[]="Bubbles";
```
用括号括起的字符串隐式包括空字符，因此不用显式包括它
 - strlen返回的是储存在数组中字符串的长度，而不是数组的长度，并忽略空字符.
 - 将数组的一个元素赋为'\0'将使字符串提前结束.
***

- istream 中的类(如cin)提供了- -些面向行的类成员函数: **getline( )和get( )**。
  - 这两个函数都读取一行输入，直到到达换行符。然而，随后getline( )将丢弃换行符，而get( )将换行符保留在输入序列中。
- **面向行的输入: getline()**
  getline( )函数读取整行，它使用通过回车键输入的换行符来确定输入结尾。要调用这种方法，可以使用cin.getline()。该函数有两个参数。第一个参数是用来存储输入行的数组的名称，第二个参数是要读取的
  字符数。getline( )成员函数在读取指定数目的字符或遇到换行符时停止读取。
  例如，假设要使用getline( )将姓名读入到一个包含20个元素的name数组中。可以使用这样的函数调用:

```
getline函数每次读取一行的字符串
cin.getline(name,20);     //读取最多19个字符.
```
- **面向行的输入: get()**
  get并不再读取并丢弃换行符，而是将其留在输入队列中。假设我们连续两次调用get( ):

  ```c++
  cin.get (name, ArSize) ;
  cin.get (dessert, Arsize) ; // a problem
  ```

  get( )将不能跨过该换行符, 可以采用下面的调用序列: 

  ```c++
  cin.get (name，ArSize) ;		// read first line
  cin.get() ;					// read newline.
  cin.get (dessert, Arsize) ;	// read second 1ine
  ```

  另一种使用get( )的方式是将两个类成员函数拼接起来(合并)，如下所示:
  `cin.get (name, ArSize) .get(); // concatenate member funct ions`

  > 之所以可以这样做，是由于cin.get (name, ArSize) 返回一个cin对象，该对象随后将被用来调用get( )
  > 函数。
  >
  > 与两次调用cin.getline( )相同:
  > `cin.getline (namel, ArSize) . getline (name2，ArSize) ;`

***

**string类**

 * 可用C-风格字符串来初始化string对象
 * 可用cin来将键盘输入存储到string对象中
 * 可用cout来显示string对象
 * 可用数组表示法来访问存储在string对象中的字符
```c++
string str1;
string str2="panther";
cin>>str1;
cout<<str1<<str2;
cout<<"The third letter in "<<str2<<"is "<<str[2]<<endl;
```
 * 表明string将对象声明为**简单变量而不是数组**
```
cout << R"(Jim hey!\n "how are you")";	//R 表示原始字符串
cout << R"+*("(What's your matter? )",Jim says.)+*";
//使得编译时遇到）“不会结束
```

- **赋值、拼接和附加**
  不能将一个数组赋给另一个数组，但可以将一个string对象赋给另-一个string对象:

  ```c++
  char charr1 [20]=;
  // create an empEy array
  char charr2[20] = "jaguar"; // create an initialized array
  string strl;
  // create an empty string object
  string str2 三"panther" ;
  // create an initialized string
  charrl = charr2;  
  // INVALID, no array assignment
  str1 = str2 ;
  // VAEID object assignment ok
  ```

- string类简化了字符串合并操作。可以使用运算符 + 将两个string对象合并起来，还可以使用运算符+=
  将字符串附加到string对象的末尾。继续前面的代码，您可以这样做:

  ```c++
  string str3;
  str3 = strl + str2;
  // assign str3 the joined strings
  strF += str2;
  // add str2 to the end of str1
  ```

***

### 1、9结构简介

>如何创建结构
>* 定义结构描述：描述并标记了能够存储在结构中的数据类型
>* 按照描述创建结构变量
>* **注：C++中可省略结构struct**

___
```
struct inflatable	//struct为关键字，inflatable为标识符
{
char name[20]，
float volume，
double price，	//使用逗号分隔值列表
};	//每一项称为结构成员，因此inflatable结构有三个成员
inflatable hat;
inflatable mainframe;	//创建这种类型的变量
hat.price；	//访问结构成员变量
flatable (=){"Maosr",2.99,34.99};	//初始化各个数值

```
 * 结构声明位置很重要：
  - 外部声明可以被后面任何函数使用
  - 内部声明只能被该声明所属函数使用
  - 通常使用外部声明
___
**结构数组**
 * 创建元素为结构的数组
```
inflatable gifts[100];	//创建数组
cin>>gifts[0].volume;
cout<<gifts[99].price<<endl;
```

- 初始化

  ```c++
  inflatable guests[2] =			// initializing an array of structs
  {
  	{"Bambi", 0.5，21.99},		// first structure in array
  	{"Godzilla", 2000，565.99},	// next structure in array
  };
  ```


***

## 字符串、向量、数组

```c++
using std::string;
```

### 定义和初始化string对象

![img](C:\Users\13793\Desktop\学习笔记\C++学习\0L2K_AQ]QFHZ]DX4CG`@79.png)

***

### string对象上的操作

![img](C:\Users\13793\Desktop\学习笔记\C++学习\}%4SJ1]FM}3KWY7]__VIBH.png)

- **字面值和string对象相加**

  - `//正确:每个加法运算符都有一个运算对象是string
    string s6 = s1 + "，" +"world";`
    当把string对象和字符字面值及字符串字面值混在一条语句中使用时，必须确保每个加法运算符（+）的两侧的运算对象至少有一个是string:

    ```c++
    string s4 = s1 + "，";//正确:把一个string对象和一个字面值相加
    string s5 = "hello" + "，";//错误:两个运算对象都不是string
    string s7 = "hello" + "，" +s2;//错误:不能把字面值直接相加`
    ```

    

***

### 处理string对象的字符

![](C:\Users\13793\Desktop\学习笔记\C++学习\1.png)

- 使用for循环和引用改变字符串的值

```c++
string s("Hello World!!!");
//转换成大写形式。
for (auto &c : s)
	c = toupper(c);
cout << s << endl;
//对于s中的每个字符（注意:c是引用）
//c是一个引用，因此赋值语句将改变s中字符的值
```

***

### 3.3标准库类型vector

- 标准库类型vector表示对象的集合，其中所有对象的**类型都相同**
- 集合中的每个对象都有一个与之对应的索引，索引用于访问对象
- 因为vector“容纳着”其他对象，所以它也常被称作容器（container)
- 要想使用vector，必须包含适当的头文件。在后续的例子中，都将假定做了如下using声明:
  `#include <vector>
  using std: :vector;` 

***

- C++语言既有类模板（class template)，也有函数模板，其中vector是一个类模板
- 模板本身不是类或函数，相反可以将模板看作为编译器生成类或函数编写的一份说明
- 编译器根据模板创建类或函数的过程称为**实例化（instantiation)**
- 当使用模板时，需要指出编译器应把类或函数实例化成何种类型。

- 提供信息的万式总是这样:
  以vector为例，提供的额外信息是vector内所存放对象的类型:

  ```c++
  vector<int> ivec;				// ivec保存int类型的对象
  vector<Sales_item> sales_vec;	//保存sales_item类型的对象
  vector<vector<string>> file;	//该向量的元素是vector对象
  ```

***

- 初始化vector

![image-20200815220944220](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200815220944220.png)

- 其他vector操作

![image-20200815221041142](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200815221041142.png)

***

### 3.4迭代器

![image-20200815221225827](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200815221225827.png)

**迭代器运算**

![image-20200815221340877](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200815221340877.png)

***

### 3.5数组

- **显示初始化数组**

![image-20200817162658472](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200817162658472.png)

- **字符数组特殊性**

![image-20200817162803806](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200817162803806.png)

- **不允许拷贝和赋值**

![image-20200817162936310](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200817162936310.png)

***

### 3.6多维数组

- 范围for语句遍历数组

```c++
for(auto &row: ia)		//注意这里需用&符号，因为ia会返回一个指针
    for(auto col: row)
        cout << col;
```

***

### 5.6try语句块和异常处理

















































## 函数

### 含可变形参的函数

- 两种主要的方法:

  - 如果所有的实参类型相同，可以传递一个名为**initializer list**的标准库类型
  - 如果实参的类型不同，我们可以编写一种特殊的函数，也就是所谓的可变参数模板

- #### initializer_list形参

  - 定义在同名的头文件中
  - 提供操作如下

  ![image-20200905210011450](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200905210011450.png)
  - 和 vector一样， initializer list也是一种模板类型
    定义 initializerlist对象时，必须说明列表中所含元素的类型：

  ```c++
  initializer_list<string> ls；		// initia1izer1ist的元素类型是 string 
  initializer_list<int> li；	// initia1izer1ist的元素类型是int
  ```

  - 和 vector不一样的是， initializerlist对象中的**元素永远是常量值**，我们无法改变 initializerlist对象中元素的值。

  - 我们使用如下的形式编写输出错误信息的函数，使其可以作用于可变数量的实参：

    ```c++
    void error_msg（initializer_list<string> il){
        for (auto beg = il.begin(); beg ！= il end(il); ++beg)
            cout << *beg << " ";
        cout << endl;
    }
    ```

  - 作用于 initializerlist对象的 begin和end操作类似于 vector对应的成员

  - begin() 成员提供一个指向列表首元素的指针，end（）成员提供个指向列表尾后元素的指针

  - 我们的函数首先初始化beg令其表示首元素，然后依次遍历列表中的每个元素

  - 在循环体中，解引用beg以访问当前元素并输出它的值

- 如果想向 initializerlist形参中传递一个值的序列，则必须把序列放在一对花括号内：

  ```c++
  //expected和actual是string对象
  if (expected != actual)
  	error_msg({"function",expected, actual});
  else 
      error_msg({"function","okay"})
  ```

***

### 无返回类型

- 没有返回值的 return语句只能用在返回类型是void的函数中
- 返回void的函数不要求非得有 return语句，因为在这类函数的最后一句后面会隐式地执行 return通常情况下，void函数如果想在它的中间位置提前退出，可以使用 return语句。
- return的这种用法有点类似于我们用 break语句退出循环

```c++
void swap(int &v1, int &v2){
	//如果两个值是相等的，则不需要交换，直接退出
    if（v1 == v2）
		return i;
	//如果程序执行到了这里，说明还需要继续完成某些功能
    int tmp v2;
    v2 = v1;
    v1 = tmp;
	//此处无须显式的 return语句
}
```

***

### 有返回值函数

- 在含有return语句的循环后面应该也有一条return语句，如果没有的话该程序就是错误的，很多编译器都无法发现此类错误

- **返回数组指针**

  ```c++
  Type (*function (parameter_list)) [dimension]
      
  int (*func(int i))[10]
  ```

- **使用尾置类型**

  ```c++
  auto func(int i) -> int (*)[10]
  ```

- **使用decltype**

  ```c++
  int odd = {1,3,5,7,9}
  
  decltype(odd) *func(int i);
  ```

  注意decltype不负责把数组类型转换为指针

***

### 函数重载

- 同一作用域内函数名相同，形参列表不同，称为**重载函数**

- 不允许两个函数除了返回类型外其他所有的要素都相同

  - 假设有两个函数，它们的形参列表一样但是返回类型不同，则第二个函数的声明是错误的:

    ```c++
    Record lookup (const Account&);
    bool lookup(const Account&);//错误:与上一个函数相比只有返回类型不同
    ```

***

### 默认实参

```c++
typedef string::size type sz；//关于typedef参见2.5.1节（第60页）
string screen(sz ht = 24, sz wid = 80, char backgrnd);
```

- 其中我们为每一个形参都提供了默认实参，默认实参作为形参的初始值出现在形参列表中。
- 我们可以为一个或多个形参定义默认值
- 不过需要注意的是，一旦某个形参被赋予了默认值，它**后面的所有形参都必须有默认值**。

> screen函数为它的所有形参都提供了默认实参，所以我们可以使用0、1、2或3个实参调用该函数：

```c++
string window;
window = screen();			//等价于screen(24,80, '')
window = screen(66);		//等价于 screen(66,80,'')
window = screen(66， 256);	//screen(66,256，'')
window = screen(66,256，′#′);// screen(66,256，′#′)
```

***

### 内联函数和constexpr函数

- 

***

### assert预处理宏

- assert是一种预处理宏（ preprocessor marco）
- 所谓预处理宏其实是一个预处理变量，它的行为有点类似于内联函数。
  - assert宏使用一个表达式作为它的条件：
    `assert（expr）`首先对expr求值，如果表达式为假（即0）， assert输出信息并终止程序的执行
  - 如果表达式为真（即非0）， assert什么也不做。

***

- **NDEBUG预处理变量**

- assert的行为依赖于一个名为 NDEBUG的预处理变量的状态。如果定义了 NDEBUG，则 assert什么也不做。默认状态下没有定义 NDEBUG，此时 assert将执行运行时检查。

- 除了C++编译器定义的\_\_func\_\_之外，预处理器还定义了另外4个对于程序调试很有用的名字：
  \_\_FILE\_\_存放文件名的字符串字面值。
  \_\_LINE\_\_存放当前行号的整型字面值。
  \_\_TIME__存放文件编译时间的字符串字面值。
  \_\_DATE\_\_存放文件编译日期的字符串字面值。

***

### 函数指针

- 有函数 `bool lenthCompare(const string &,const string &)` 
  - 则把函数名换为指针即可 `bool (*pf)(const string &,const string &)`

- 使用函数指针当我们把**函数名作为一个值使用**时，该函数自动地转换成指针。
- 例如，按照如下形式我们可以将lengthCompare的地址赋给pf

```c++
pf = lenthCompare;
pf = &lenthCompare;		//&可选
```

- 此外，我们还能直接使用指向函数的指针调用该函数，无须提前解引用指针：

```c++
bool b1 = pf("hello","world!");
bool b2 = (*pf)("hello","world!");		//等价的调用
bool b3 = lenthCompare("hello","world!")//另一个等价的调用
```



***

## 7.类

### 定义抽象数据类型

```c++
struct Sales_data
{
    std::string isbn() const{return bookNo;};
    Sales_data &combine(const Sales_data&);
    double avg_price() const;
    std::string bookNo;
    unsigned units_sold = 0;
    double revenue = 0.0;
};

Sales_data add(const Sales_data&, const Sales_data&);
std::ostream print(std::ostream&, const Sales_data&);
std::istream read(std::istream&, const Sales_data&);
```

- **定义成员函数**

  - isbn函数的另一个关键之处是紧随参数列表之后的 const关键字，这里， const的作用是修改隐式this指针的类型
  - 在函数内声明成员函数，在外定义时，需按如下操作

  ```c++
  Sales_data& Sales_data::combine(const Salas_data &);
  ```

- **const成员函数**

  - C++语言的做法是允许把 const关键字放在**成员函数的参数列表之后**，此时，紧跟在参数列表后面的 const表示this是一个指向常量的指针。像这样使用 const的成员函数被称作常量成员函数

***

### 定义类相关的非成员函数

- 类的作者常常需要定义一些辅助函数，比如add、read和 print等
  - 尽管这些函数定义的操作从概念上来说属于类的接口的组成部分，但它们实际上并不属于类本身
  - 我们定义非成员函数的方式与定义其他函数一样，通常把函数的声明和定义分离开来
  - 如果函数在概念上属于类但是不定义在类中，则它一般应与类声明（而非定义）在同一个头文件内。在这种方式下，用户使用接口的任何部分都只需要引入一个文件

****

### 构造函数

- 每个类都分别定义了它的对象被初始化的方式，类通过一个或几个特殊的成员函数来控制其对象的初始化过程，这些函数叫做构造函数。
  - 构造函数的任务是初始化类对象的数据成员，无论何时只要类的对象被创建，就会执行构造函数。
  - 构造函数的名字和类名相同。
    - 和其他函数不一样的是，构造函数没有返回类型
    - 除此之外类似于其他的函数，构造函数也有一个（可能为空的）参数列表和一个（可能为空的）
      函数体
    - 类可以包含多个构造函数，和其他重载函数差不多，不同的构造函数之间必须在参数数量或参数类型上有所区别
  
- **定义构造函数**

  ````
  
  ````










***

### 访问控制与封装

- 在C++语言中，我们使用访问说明符加强类的封装性：
  - 定义在public说明符之后的成员在整个程序内可被访问，public成员定义类的接口
  - 定义在 private说明符之后的成员可以被类的成员函数访问，但是不能被使用该类的代码访问， private部分封装了（即隐藏了）类的实现细节

```c++
#include<string>
using std::string;
class 
{
private:
    double avg_price() const   
        return unit_sold ? revenue/unit_sold : 0;
    string bookNo;
    unsigned unit_sold = 0;
    double revenue = 0.0;
public:
    Sales_data() = default;
    Sales_data(const string &s, unsigned n, double p):
        bookNo(s), unit_sold(n), revenue(p*n) {}
    Sales_data(string &s): bookNo(s) {};
    Sales_data(std::istream&);
    string isbn() const {return bookNo;}
    Sales_data &combine(const Sales_data &);
};
```

- 作为接口的一部分，构造函数和部分成员函数（即isbn和 combine）紧跟在 public说明符之后
- 而数据成员和作为实现部分的函数则跟在 private 说明符后面

> 一个类可以包含0个或多个访问说明符，而且对于某个访问说明符能出现多少次也没有严格限定。每个访问说明符指定了接下来的成员的访问级别，其有效范围直到出现下个访问说明符或者到达类的结尾处为止。

***

**使用class或 struct关键字**

- 这种变化仅仅是形式上有所不同，实际上我们可以使用这两个关键字中的任何一个定义类
- 唯一的一点区别是， struct和 class的默认访问权限不太一样
  - 类可以在它的第一个访问说明符之前定义成员，对这种成员的访问权限依赖于类定义的方式
  - 如果我们使用 struct关键字，则定义在第一个访问说明符之前的成员是public的；相反，如果我们使用class关键字，则这些成员是 private的

***

### 友元

- 类可以允许其他类或者函数访问它的非公有成员，方法是令其他类或者函数成为它的友元（ friend）
- 如果类想把一个函数作为它的友元，只需要增加一条以 friend关键字开始的函数声明语句即可

- 友元声明只能出现在类定义的内部，但是在类内出现的具体位置不限。友元不是类的成员也不受它所在区域访问控制级别的约束

```c++
class 
{
friend Sales_data add(const Sales_data&,const Sales_data&);
friend std::istream &read(std::istream &, Sales_data&);
friend std::ostream &print(std::ostream &, const Sales_data&);
private:
    double avg_price() const   
        return unit_sold ? revenue/unit_sold : 0;
    string bookNo;
    unsigned unit_sold = 0;
    double revenue = 0.0;
    ···
}
```

**友元类**

- 类也可声明为友元

```c++
class Screen
{
friend class Window_mgr;
    ···
}
```

**成员函数作为友元**

- Window_mgr的成员函数也可单独作为友元

```c++
class Screen
{
friend void Window_mgr::clear(ScreenIndex);
    ···
}
```

- 要想令某个成员函数作为友元，我们必须仔细组织程序的结构以满足声明和定义的彼此依赖关系。在这个例子中，我们必须按照如下方式设计程序
  - 首先定义window mgr类，其中声明clear函数，但是不能定义它。在clear使用screen的成员之前必须先声明screen
  - 接下来定义Screen，包括对于clear的友元声明。
  - 最后定义clear，此时它才可以使用screen的成员。

**函数重载和友元**

- 尽管重载函数的名字相同，但它们仍然是不同的函数。
- 因此，如果一个类想把一组重载函数声明成它的友元，它需要对这组函数中的每一个分别声明

```

```



***

### 类的其他特性

**定义一个新的类**

- Screen表示显示器中的一个窗口。每个 Screen包含一个用于保存 Screen内容的string成员和三个 string:size type类型的成员，它们分别表示光标的位置以及屏幕的高和宽
- 除了定义数据和函数成员之外，类还可以自定义某种类型在类中的别名。由类定义的类型名字和其他成员一样存在访问限制，可以是 public或者 private中的一种：

```c++
class Screen{
public:
    typedef string::size_type pos;
private:
    pos cursor = 0;
    pos height = 0,width = 0;
    string contents;
}
```

***

**Screen类的成员函数** 

- 要使我们的类更加实用，还需要添加一个构造函数令用户能够定义屏幕的尺寸和内容
- 以及其他两个成员，分别负责移动光标和读取给定位置的字符：

```c++
class Screen{
public:
    typedef string::size_type pos;
    Screen = default();
    Screen(pos ht, pos wt, char c): height(ht), width(wt), contents(ht*wt, c) {}
    char get() const
    	{return contents[cursor];}
   	inline char get(pos ht, pos wt) const;
    Screen &move(pos r, pos c);
private:
    pos cursor = 0;
    pos height = 0,width = 0;
    string contents;
}
```

**可变函数成员**

- 有时（但并不频繁）会发生这样一种情况，我们希望能修改类的某个数据成员，即使是在一个 const 成员函数内
- 可以通过在变量的声明中加入 **mutable** 关键字做到这点一个
- 可变数据成员（ mutable data member）永远不会是 const，即使它是 const对象的成员。因此，一个 const成员函数可以改变一个可变成员的值

***

**类类型**

- 每个类定义了唯一的类型。对于两个类来说，即使它们的成员完全一样，这两个类也是两个不同的类型。例如:

```c++
struct First {
    int memi;
    int getMem () ;
};
struct Second {
    int memi;
    int getMem ();
};
First obj1;
Second obj2 = obj1;//错误:obj1和obj2的类型不同
```

- 即使两个类的成员列表完全一致，它们也是不同的类型。对于一个类来说，它的成员和其他任何类（或者任何其他作用域）的成员都不是一回事儿





***

## 9.顺序容器

- 所有顺序容器都提供了快速顺序访问元素的能力，但是，这些容器在以下方面都有不同的性能折中:
  - 向容器添加或从容器中删除元素的代价
  - 非顺序访问容器中元素的代价

![image-20200908222912661](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200908222912661.png)

- **string和vector**将元素保存在连续的内存空间中，由于元素是连续存储的，由元素的下标来计算其地址是非常快速的
  - 但是，在这两种容器的中回位直添加删除元素就会非常耗时，在一次插入或删除操作后，需要移动插入/删除位置之后的所有元素来保持连续存储。
  - 而且，添加一个元素有时可能还需要分配额外的存储空间，每个元素都必须移动到新的存储空间中。
- **list和forward_list**两个容器的设计目的是令容器任何位置的添加和删除操作都很快速
  - 作为代价，这两个容器不支持元素的随机访问，为了访问一个元素，我们只能遍历整个容器
  - 而且，与vector、deque和array相比，这两个容器的额外内存开销也很大
- **deque**是一个更为复杂的数据结构。与string和vector类似，deque支持快速的随机访问
  - 与string 和vector一样，在 deque的中间位置添加或删除元素的代价(可能）很高
  - 但是，在 deque的两端添加或删除元素都是很快的，与list或forward list添加删除元素的速度相当

***

**确定使用哪种容器**

- 除非你有很好的理由选择其他容器，否则应使用vector。
- 如果程序要求**随机访问元素**，应使用**vector或deque**
- 如果你的程序有很多小的元素，且空间的额外开销很重要，则不要使用list或forward_list。
- 如果程序要求在容器的**中间插入或删除元素**，应使用**list或forward_list**。
- 如果程序需要在**头尾位置插入或删除元素**，但不会在中间位置进行插入或删除操作，则使用**deque**。

***

### 顺序容器操作

**向顺序容器中添加元素**

![image-20200909165643915](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200909165643915.png)

**访问元素的操作**

![image-20200909220216811](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200909220216811.png)

**删除元素**

![image-20200909222759957](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200909222759957.png)

***

**forward_list的插入删除操作**

![image-20200909225401416](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200909225401416.png)

***

**改变容器大小**

- 用resize来增大或缩小容器，与往常一样，array不支持resize。
  - 如果当前大小大于所要求的大小，容器后部的元素会被删除
  - 如果当前大小小于新大小，会将新元素添加到容器后部:

![image-20200910091845654](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200910091845654.png)

***

### 容器操作可能使迭代器失效

- 向容器中添加元素和从容器中删除元素的操作可能会使指向容器元素的指针、引用或迭代器失效
  - 一个失效的指针、引用或迭代器将不再表示任何元素
  - 使用失效的指针、引用或迭代器是一种严重的程序设计错误，很可能引起与使用未初始化指针一样的问题

![image-20200910092221655](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200910092221655.png)

![image-20200910092600227](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200910092600227.png)





***

## 12.动态内存

### 动态内存与智能指针

- 在C++中，动态内存的管理是通过一对运算符来完成的:
  - **new**，在动态内存中为对象分配空间并返回一个指向该对象的指针，我们可以选择对对象进行初始化
  - **delete**，接受一个动态对象的指针，销毁该对象，并释放与之关联的内存
- 为了更容易(同时也更安全)地使用动态内存，新的标准库提供了两种智能指针(smart pointer)类型来管理动态对象
  - 智能指针的行为类似常规指针，重要的区别是它负责自动释放所指向的对象
  - 新标准库提供的这两种智能指针的区别在于管理底层指针的方式:
    - **shared_ptr**允许**多个指针指向同一个对象**
    - **unique_ptr**则“独占”所指向的对象
    - 标准库还定义了一个名为weak_ptr的伴随类，它是一种弱引用，指向shared_ptr所管理的对象
  - 三种指针都定义在memory头文件中

***

### **shared_ptr类**

- 智能指针也是模板

- 声明如同vector一样

  ```c++
  shared_ptr<string> p1;
  shared_ptr<list<int>> p2;
  ```

- 智能指针的使用方式与普通指针类似。解引用一个智能指针返回它指向的对象。

  - 如果在一个条件判断中使用智能指针，效果就是检测它是否为空:

  ```c++
  //如果p1不为空，检查它是否指向一个空string
  if(p1 && p1->empty())
  *p1 = "hi";		//如果p1指向一个空string，解引用p1，将一个新值赋予string
  ```

![img](C:\Users\13793\Desktop\学习笔记\C++学习\`17BVBV5PSS2T{X7VIYD54.png)

****

**make_shared函数**

- 最安全的分配和使用动态内存的方法是调用一个名为**make_shared 的标准库函数**
  - 此函数在动态内存中分配一个对象并初始化它，返回指向此对象的shared_ptr
  - 与智能指针一样，make_shared也定义在头文件memory 中。
  - 当要用make_shared时，必须指定想要创建的对象的类型
  - 定义方式与模板类相同，在函数名之后跟一个尖括号，在其中给出类型:

```c++
shared_ptr<int> p = make_shared<int> (42);
shared_ptr<string> p1 = make_shared<string> (10,'9');
```

**shared_ptr的拷贝和赋值**

- 当进行铂贝或赋值操作时，每个shared_ptr都会记录有多少个其他shared_ptr指向相同的对象
- 我们可以认为每个shared_ptr都有一个关联的计数器，通常称其为**引用计数**(reference
  count）。无论何时我们拷贝一个shared ptr，计数器都会递增
- 一旦一个shared_ptr的计数器变为0，它就会自动释放自己所管理的对象

***

**自动销毁**

- 当指向一个对象的最后一个shared_ptr被销毁时，shared ptr类会自动销毁此对象
- 它是通过另一个特殊的成员函数——**析构函数**(destructor）完成销毁工作的
- 类似于构造函数，每个类都有一个析构函数。就像构造函数控制初始化一样，析构函数控制此类型的对象销毁时做什么操作

***

**StrBlob()函数**

```c++
class StrBlob{
public:
    typedef vector<string>::size_type size_type;
    StrBlob();
    StrBlob(initializer_list<string> il);
    size_type size() const{return data->size();};
    bool empty() const {return data->empty();}
    void push_back(const string &t) {data->push_back(t);};
    void pop_back();
    string& front();
    string& back();
private:
    shared_ptr<vector<string>> data;
    void check(size_type i, const string &msg) const;
};
```

**元素访问成员函数**

- pop_back、front和back操作访问vector中的元素。这些操作在试图访问元素之前**必须检查元素是否存在**
- 由于这些成员函数需要做相同的检查操作，我们为StrBlob定义了一个名为check的private工具函数，它检查一个给定索引是否在合法范围内

```c++
void StrBlob::check(size_type i, const string &msg) const {
    if(i >= data->size())
        throw out_of_range(msg);
}
```

- 除了索引，check 还接受一个string参数，它会将此参数传递给异常处理程序，这个string 描述了错误内容:

- pop_back()这些函数先调用check，如果成功，则用底层vector操作

```c++
string& StrBlob::front(){
    check(0,"front on empty StrBlob");
    return data->front();
}

string& StrBlob::back(){
    check(0, "back on empty StrBlob");
    return data->back();
}

void StrBlob::pop_back(){
    check(0, "pop on empty StrBlob");
    data->pop_back();
}
```

***

**直接管理内存**

- C++语言定义了两个运算符来分配和释放动态内存。运算符new分配内存，delete释放new分配的内存。

```c++
int *p = new int
```

- 默认情况下，动态分配的对象是默认初始化的，内置类型或组合类型的对象的值将是未足义的
- 可以用直接初始化的方式来初始化

```c++
int *pi = new int(1024);
string *s = new string(10,'9');
vector<int> v1 = new vector<int>{1,2,3,4,5}
```

****

**释放动态内存**

```
delete p;
```

- 我们传递给delete的指针**必须指向动态分配的内存**，或者是一个空指针
- 释放一块并**非new分配的内存**，或者将相同的指针值释放多次，其**行为是未定义的**

****

**shared_ptr和new结合使用**

![](C:\Users\13793\Desktop\学习笔记\C++学习\2.png)

![](C:\Users\13793\Desktop\学习笔记\C++学习\3.png)

***

**智能指针使用的注意**

![image-20200914194132633](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200914194132633.png)

****

### unique_ptr类

- 一个unique ptr“拥有”它所指向的对象。
- 与shared ptr不同，某个时刻只能有一个unique _ptr 指向一个给定对象
- 当unique ptr被销毁时，它所指向的对象也销毁

***

- 与shared_ptr不同，没有类似 make_shared的标准库函数返回一个unique_ptr
  - 当我们定义一个unique_ptr时，需要将其绑定到一个new返回的指针上
  - 类似shared ptr，初始化unique_ptr必须采用直接初始化形式:

```c++
unique_ptr<double> p1;
unique_ptr<int> p2(new int(42));
```

- unique_ptr不支持普通拷贝或赋值操作

```c++
unique_ptr<int> p1 = p2;	//错误，不允许赋值
unique_ptr<int> p1(p2);		//不允许拷贝
```

![image-20200914203954572](C:\Users\13793\Desktop\学习笔记\C++学习\image-20200914203954572.png)

- 
  虽然我们不能拷贝或赋值unique ptr，但可以通过调用release或reset将指针的所有权从一个（非const） unique_ptr转移给另一个unique

```c++
//将所有权从p1（指向string Stegosaurus）转移给p2
unique_ptr<string> p2(p1.release());		//release将p1置为空
unique_ptr<string> p3(new string ("Trex"));	
//将所有权从p3转移给p2
p2.reset(p3.release());						//reset释放了p2原来指向的内存
```

****

### 动态数组

- 

***

## 15.面向对象编程





































































































































































****

## 16.模板与泛型编程

### **函数模板**

- 我们可以定义一个通用的函数模板（function template)，而不是为每个类型都定义一个新函数
  - 一个函数模板就是一个公式，可用来生成针对特定类型的函数版本。
  - compare的模板版本可能像下面这样:

```c++
template <typename T>
int compare(const T v1, const T v2){
    if(v1 > v2)
        return 1;
    if(v1 < v2)
        return -1;
    return 0;
}
```

- 模板定义以关键字template开始，后跟一个**模板参数列表**（template parameter list）

  - 这是一个逗号分隔的一个或多个**模板参数**(template parameter）的列表
  - 用小于号(<）和大于号(>）包围起来

  > **在模板定义中，模板参数列表不能为空**

***

**实例化函数模板**

- 当我们调用一个函数模板时，编译器(通常）用函数实参来为我们推断模板实参
  - 即，当我们调用compare时，编译器使用实参的类型来确定绑定到模板参数T的类型
  - 例如，在下面的调用中:
    `cout << compare(1,0)<< endl;//T为int`

- 编译器用推断出的模板参数来为我们实例化（instantiate）一个特定版本的函数

  - 当编译器实例化一个模板时，它使用实际的模板实参代替对应的模板参数来创建出模板的一个新“实例”。例如，给定下面的调用:

    ```
    
    ```

***

**非类型模板参数**

- 除了定义类型参数，还可以在模板中定义**非类型参数**(nontype parameter)
  - 一个非类型参数**表示一个值而非一个类型**。
  - 我们通过一个特定的类型名而非关键字class或typename来指定非类型参数

```c++
template <unsigned N, unsigned M>
int compare(const char (&p1)[N], const char (&p2)[M]){
    return strcmp(p1, p2);
}
```

- 参数必须是常量表达式

***

### 类模板

- 类似函数模板，类模板以关键字template开始，后跟模板参数列表。
- 在类模板（及其成员）的定义中，我们将模板参数当作替身，代替使用模板时用户需要提供的类型或值:

**实例化类模板**

```
Blob<int> a1;
```

**成员函数**

- 定义以模板参数开始

```
template<T>
Blob<T> void Blob::menbership(T& i);
```



****

## C++复习

1. 关于定义“struct A{int x; mutable int y;}const a={1,3};”，如下叙述哪个_________正确:

      A. a.x可被赋值，a.y不可被赋值          B. a.x不可被赋值，a.y可被赋值

      C. a.x和a.y均不可被赋值                	  D. a.x和a.y均可被赋值

   - `mutable` - 容许在即便包含它的对象被声明为 const 时仍可修改声明为 mutable 的类成员。

```c++
const struct
    {
        int n1;
        mutable int n2;
    } x = {0, 0};      // 带 mutable 成员的 const 对象
 
//  x.n1 = 4; // 错误：const 对象的成员为 const
    x.n2 = 4; // ok，const 对象的 mutable 成员不是 const
```

2. 关于union定义的类的叙述_____正确:

   - 联合体不能有基类且不能用作基类

3. `int &f( ); int &&g( );`

   - D.调用f()可被赋值，调用g()不可被赋值

   - 表达式必须是可修改的左值

4. 对于定义 `struct A{ int f( ) ;} `，关于int前面是否可用static和virtual ：
   - 编译器未报错
   - 若同时用static 和virtual，`仅非静态成员函数可以是虚拟的`
5. 对于定义“char *const &f( );”，如下哪个语句是错误的
   - `f( )=(char*) "abcd"; `错误，表达式必须是可修改的左值
6. 