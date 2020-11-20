## 1、基本概念

### 1、1变量

- ECMAScript 的变量是松散类型的，所谓松散类型就是可以用来保存任何类型的数据

- 定义变量时要使用 var 操作符（注意 var 是一个关键 字），后跟变量名（即一个标识符），如下所示： 

var message;

>ECMAScript也支持直接初始 化变量，因此在定义变量的同时就可以设置变量的值，如下所示： 
>
>`var message = "hi"; `
> 在此，变量 message 中保存了一个字符串值"hi"

- 有一点必须注意，即用 var 操作符定义的变量将成为定义该变量的作用域中的局部变量
  - 不过，可以像下面这 样省略 var 操作符，从而创建一个全局变量： 

```javascript
function test(){     
    message = "hi"; // 全局变量 
} 
test(); 
alert(message); // "hi" 
```

> 这个例子省略了 var 操作符，因而 message 就成了全局变量。

***

### 1、2数据类型

> ECMAScript中有 5种简单数据类型（也称为基本数据类型）：**Undefined、Null、Boolean、Number 和String**。
>
> 还有1种复杂数据类型——**Object**，Object 本质上是由一组无序的名值对组成的

- #### **typeof操作符**

  - 鉴于 ECMAScript 是松散类型的，因此需要有一种手段来检测给定变量的数据类型——typeof 就是负责提供这方面信息的操作符

```
"undefined"——如果这个值未定义； 
"boolean"——如果这个值是布尔值； 
"string"——如果这个值是字符串； 
"number"——如果这个值是数值； 
"object"——如果这个值是对象或 null； 
"function"——如果这个值是函数。 
```

> typeof 操作符的操作数可以是变量（message），也可以是数值字面量。
>
> 注意， typeof 是一个操作符而不是函数，因此例子中的圆括号尽管可以使用，但不是必需的

***

- #### **undefined**

> Undefined 类型只有一个值，即特殊的 undefined。在使用 var 声明变量但未对其加以初始化时， 这个变量的值就是 undefined，例如： 

```javascript
var message; 
alert(message == undefined); //true 
```

***

- #### **Null**

> Null 类型是第二个只有一个值的数据类型，这个特殊的值是 null。从逻辑角度来看，null 值表 示一个空对象指针

***

- #### **Boolean**

> 该类型只有两个字面值：true 和 false

需要注意的是，Boolean 类型的字面值 true 和 false 是区分大小写的。也就是说，True 和 False （以及其他的混合大小写形式）都不是 Boolean 值，只是标识符。 

- 要将一个值转换为其对应的 Boolean 值，可以调用转型函数 Boolean()，如下例所示： 

  ```javascript
  var message = "Hello world!"; 
  var messageAsBoolean = Boolean(message); 
  ```

***

#### 1、2、1Number

***

**1.浮点数值** 

> 所谓浮点数值，就是该数值中必须包含一个小数点，并且小数点后面必须至少有一位数字。虽然小 数点前面可以没有整数，但我们不推荐这种写法。以下是浮点数值的几个例子： 

```
var floatNum1 = 1.1; 
var floatNum2 = 0.1; 
var floatNum3 = .1;   // 有效，但不推荐 
```

> 浮点数值的高精度是 17位小数，但在进行算术计算时其精确度远远不如整数。
>
> 例如，0.1加 0.2 的结果不是 0.3，而是 0.30000000000000004。这个小小的舍入误差会导致无法测试特定的浮点数值。 例如： 

```javascript
if (a + b == 0.3)
{          // 不要做这样的测试！     
alert("You got 0.3."); 
} 
```

***

**2.数值范围** 

> 由于内存的限制，ECMAScript并不能保存世界上所有的数值。
>
> ECMAScript能够表示的小数值保 存在 Number.MIN_VALUE 中——在大多数浏览器中，这个值是 5e-324；
>
> 能够表示的大数值保存在 Number.MAX_VALUE 中——在大多数浏览器中，这个值是1.7976931348623157e+308

- 如果某次计算的结果得到了一个超出 JavaScript数值范围的值，那么这个数值将被自动转换成特殊的 Infinity 值。具 体来说，如果这个数值是负数，则会被转换成-Infinity（负无穷），如果这个数值是正数，则会被转 换成 Infinity（正无穷）

- 要想确定一个数值是不是有穷的（换句话说，是不是位于 小和大的数值之间），可以使用 isFinite()函数。这个函数在参数位于小与大数值之间时会返 回 true，如下面的例子所示： 

  `var result = Number.MAX_VALUE + Number.MAX_VALUE; `

   `alert(isFinite(result));  //false `

***

**3、NaN**

> NaN，即非数值（Not a Number）是一个特殊的数值，这个数值用于表示一个本来要返回数值的操作数 未返回数值的情况（这样就不会抛出错误了）
>
> 在ECMAScript中，任何数值除以 0会返回 NaN①，因此不会影响其他代码的执行。 

- NaN 本身有两个非同寻常的特点。

- 首先，任何涉及 NaN 的操作（例如 NaN/10）都会返回 NaN，这个特点在多步计算中有可能导致问题。

- 其次，NaN 与任何值都不相等，包括 NaN 本身。例如，下面的代 码会返回 false： 

  `alert(NaN == NaN);   //false `

> **isNaN()**在接收到一个值之后，会尝试将这个值转换为数值。
>
> 某些不是数值的值会直接转换为数值，例如字符串"10"或 Boolean 值。
>
> 而任何不能被转换为数值的值都会导致这个函数返回 true。请看下面的例子：

```javascript
alert(isNaN(NaN));         //true 
alert(isNaN(10));          //false（10是一个数值） 
alert(isNaN("10"));        //false（可以被转换成数值 10） 
alert(isNaN("blue"));      //true（不能转换成数值） 
alert(isNaN(true));        //false（可以被转换成数值 1） 
```

**4.数值转换** 

- 有 3个函数可以把非数值转换为数值：Number()、parseInt()和 parseFloat()。
- 第一个函数， 即转型函数 Number()可以用于任何数据类型
- 而另两个函数则专门用于把字符串转换成数值

> Number()函数的转换规则如下。 
>
>  **如果是 Boolean 值，true 和 false 将分别被转换为 1和 0。** 
>
>  **如果是数字值，只是简单的传入和返回。** 
>
>  **如果是 null 值，返回 0。** 
>
>  **如果是 undefined，返回 NaN。** 
>
>  **如果是字符串，遵循下列规则： **
>
> - 如果字符串中只包含数字（包括前面带正号或负号的情况），则将其转换为十进制数值，即"1" 会变成 1，"123"会变成 123，而"011"会变成 11（注意：前导的零被忽略了）； 
> - 如果字符串中包含有效的浮点格式，如"1.1"，则将其转换为对应的浮点数值（同样，也会忽 略前导零）； 
> - 如果字符串中包含有效的十六进制格式，例如"0xf"，则将其转换为相同大小的十进制整 数值； 
> -  如果字符串是空的（不包含任何字符），则将其转换为 0； 
> -  如果字符串中包含除上述格式之外的字符，则将其转换为 NaN。
>
> **如果是对象，则调用对象的 valueOf()方法，然后依照前面的规则转换返回的值。如果转换 的结果是 NaN，则调用对象的 toString()方法，然后再次依照前面的规则转换返回的字符 串值。**



- parseInt()函数在转换字符串时，更多的是看其是否符合数值模式。它会忽略字 符串前面的空格，直至找到第一个非空格字符
  - 如果第一个字符不是数字字符或者负号，parseInt() 就会返回 NaN
  - 如果第一个字符是数字字符，parseInt()会继续解析第二个字符，直到解析完所有后续字符或者遇到了 一个非数字字符
  - "1234blue"会被转换为 1234，因为"blue"会被完全忽略。类似地，"22.5" 会被转换为 22，因为小数点并不是有效的数字字符。 

```javascript
var num1 = parseInt("1234blue");    // 1234 
var num2 = parseInt("");            // NaN 
var num3 = parseInt("0xA");         // 10（十六进制数） 
var num4 = parseInt(22.5);          // 22 
var num5 = parseInt("070");         // 56（八进制数） 
var num6 = parseInt("70");         // 70（十进制数） 
var num7 = parseInt("0xf");         // 15（十六进制数） 
```

- 如果知道要解析的值是十六进制格式的字符串，那么指定基数 16作为第 二个参数，可以保证得到正确的结果，例如： 

- var num = parseInt("0xAF", 16);  //175 

- 实际上，如果指定了 16作为第二个参数，字符串可以不带前面的"0x"，如下所示： 

  var num1 = parseInt("AF", 16);  //175 

  var num2 = parseInt("AF");   //NaN 

***

- 与 parseInt()函数类似，parseFloat()也是从第一个字符（位置 0）开始解析每个字符
- 字符串中的第 一个小数点是有效的，而第二个小数点就是无效的了，因此它后面的字符串将被忽略。
- 除了第一个小数点有效之外，parseFloat()与 parseInt()的第二个区别在于它始终都会忽略前导 的零。parseFloat()可以识别前面讨论过的所有浮点数值格式，也包括十进制整数格式。
- 还要注意一点：如果字符串包含的是一个可解析为整数的数（没有小数点，或者小数点后 都是零），parseFloat()会返回整数

```javascript
var num1 = parseFloat("1234blue");        //1234 （整数） 
var num2 = parseFloat("0xA");              //0 
var num3 = parseFloat("22.5");             //22.5 
var num4 = parseFloat("22.34.5");          //22.34 
var num5 = parseFloat("0908.5");          //908.5 
var num6 = parseFloat("3.125e7");          //31250000 
```

***

#### 1、2、2string类型

> String 类型用于表示由零或多个 16位 Unicode字符组成的字符序列，即字符串。字符串可以由双 引号（"）或单引号（'）表示，因此下面两种字符串的写法都是有效的： 

```
var firstName = "Nicholas"; 
var lastName = 'Zakas'; 
```

- 任何字符串的长度都可以通过访问其 length 属性取得，例如： alert(text.length);

- 字符串是不可变的，也就是说，字符串一旦创建，它们的值就不能改变。
- 要改变某个变量保存的字符串，首先要销毁原来的字符串，然后再用另一个包含新值的字符串填充该变量， 例如： 

```
var lang = "Java"; 
lang = lang + "Script"; 
```

- 实现这个操作的过程如下：
  - 首先创建一个能容纳 10个字符的新字符串，然后在这个字符串中填充"Java"和"Script"
  - 后一步是销毁原来的字符串"Java"和字符串"Script"，因为这两个字符串已经没用了。

***

- 要把一个值转换为一个字符串有两种方式。
- 第一种是使用几乎每个值都有的 toString()方法（第 5章将讨论这个方法的特点）。这个方法唯一要做的就是返回相应值的字符串表现。来看下面的例子： 

```javascript
var age = 11; 
var ageAsString = age.toString();         // 字符串"11" 
var found = true;
var foundAsString = found.toString();     // 字符串"true" 
```

- 而通过传递基数，toString()可以输出以二进制、八进制、十六进制，乃至其他任意有效进制格 式表示的字符串值。下面给出几个例子： 

```
var num = 10; 
alert(num.toString());         // "10" 
alert(num.toString(2));        // "1010" 
alert(num.toString(8));        // "12" 
alert(num.toString(10));       // "10" 
alert(num.toString(16));       // "a" 
```

***

- 在不知道要转换的值是不是 null 或 undefined 的情况下，还可以使用转型函数 **String()**
- 这个函数能够将任何类型的值转换为字符串。
- String()函数遵循下列转换规则： 
  - 如果值有 toString()方法，则调用该方法（没有参数）并返回相应的结果； 
  -  如果值是 null，则返回"null"； 
  -  如果值是 undefined，则返回"undefined"。

```javascript
var value1 = 10; 
var value2 = true; 
var value3 = null; 
var value4; 
 alert(String(value1));     // "10" 
 alert(String(value2));     // "true" 
 alert(String(value3));     // "null" 
 alert(String(value4));     // "undefined" 
```

***

### 1、3操作类型符

#### 1、3、1一元操作符

- 在对非数值应用一元加操作符时，该操作符会像 Number()转型函数一样对这个值执行转换。 
- 换句话说，布尔值 false 和 true 将被转换为 0和 1
- 字符串值会被按照一组特殊的规则进行解析
- 而 对象是先调用它们的**valueOf()**和（或）**toString()**方法，再转换得到的值。 
- 下面的例子展示了对不同数据类型应用一元加操作符的结果： 

```javascript
var s1 = "01"; 
var s2 = "1.1"; 
var s3 = "z"; 
var b = false; 
var f = 1.1; 
var o = {     
	valueOf: function() {         
		return -1;     
	} 
}; 

s1 = +s1;     // 值变成数值 1 
s2 = +s2;     // 值变成数值 1.1 
s3 = +s3;     // 值变成 
NaN b = +b;       // 值变成数值 0 
f = +f;       // 值未变，仍然是 1.1 
o = +o;       // 值变成数值-1 
```

***

#### 1、3、2位操作符

1. **按位非（NOT）** 

   按位非操作符由一个波浪线（~）表示，执行按位非的结果就是返回数值的反码。

   按位非是 ECMAScript操作符中少数几个与二进制计算有关的操作符之一。下面看一个例子： 

```
var num1 = 25;        // 二进制 00000000000000000000000000011001 
var num2 = ~num1;       // 二进制 11111111111111111111111111100110 
alert(num2);             // -26 
```

> **按位非操作的本质：操作数的负值减 1。** 

​	2.**无符号右移>>>**

​	无符号右移无符号右移操作符由 3个大于号（>>>）表示，这个操作符会将数值的所有 32位都向右移动。

​	对正 数来说，无符号右移的结果与有符号右移相同。

- 但是对负数来说，情况就不一样了。
- 首先，无符号右移是以 0来填充空位，而不是像有符号右移那 样以符号位的值来填充空位。

- 其次，无符号右移操作符会把负数的二进制码当成正数的二进制码。而且，由于负数以其绝对 值的二进制补码形式表示，因此就会导致无符号右移后的结果非常之大，如下面的例子所示： 

  ```
  var oldValue = -64;               // 等于二进制的 11111111111111111111111111000000 var newValue = oldValue >>> 5;  // 等于十进制的 134217726 
  ```

***

#### 1、3、3布尔操作符

1. 逻辑非 

   逻辑非操作符由一个叹号（！）表示，可以应用于 ECMAScript中的任何值。无论这个值是什么数据 类型，这个操作符都会返回一个布尔值。逻辑非操作符首先会将它的操作数转换为一个布尔值，然后再 对其求反。

```
alert(!false);       // true 
alert(!"blue");      // false 
alert(!0);           // true 
alert(!NaN);         // true 
alert(!"");          // true 
alert(!12345);       // false 
```

***

2. 逻辑与 

   逻辑与操作符由两个和号（&&）表示

   > 逻辑与操作属于短路操作，即如果第一个操作数能够决定结果，那么就不会再对第二个操作数求值。
   >
   >  对于逻辑与操作而言，如果第一个操作数是 false，则无论第二个操作数是什么值，结果都不再可能是 true 了

- 在有一个操作数不是布尔值的情况 下，逻辑与操作就不一定返回布尔值；此时，它遵循下列规则： 
  - 如果第一个操作数是对象，则返回第二个操作数； 
  -  如果第二个操作数是对象，则只有在第一个操作数的求值结果为 true 的情况下才会返回该对象； 
  -  如果两个操作数都是对象，则返回第二个操作数； 
  -  如果有一个操作数是 null，则返回 null； 
  -  如果有一个操作数是 NaN，则返回 NaN； 
  -  如果有一个操作数是 undefined，则返回 undefined。 

***

3. 逻辑或 

   逻辑或操作符由两个竖线符号（||）表示

- 与逻辑与操作相似，如果有一个操作数不是布尔值，逻辑或也不一定返回布尔值；此时，它遵循下列规则： 
  - 如果第一个操作数是对象，则返回第一个操作数； 
  -  如果第一个操作数的求值结果为 false，则返回第二个操作数； 
  -  如果两个操作数都是对象，则返回第一个操作数； 
  -  如果两个操作数都是 null，则返回 null； 
  -  如果两个操作数都是 NaN，则返回 NaN； 
  -  如果两个操作数都是 undefined，则返回 undefined。 

> 与逻辑与操作符相似，逻辑或操作符也是短路操作符。也就是说，如果第一个操作数的求值结果为 true，就不会对第二个操作数求值了

```
var found = true; 
var result = (found || someUndefinedVariable);     // 不会发生错误 
alert(result);    // 会执行（"true"）
```

- 我们可以利用逻辑或的这一行为来避免为变量赋 null 或 undefined 值。例如： 

  `var myObject = preferredObject || backupObject; `

  > 在这个例子中，变量 myObject 将被赋予等号后面两个值中的一个。
  >
  > 变量 preferredObject 中包含优先赋给变量 myObject 的值
  >
  > 变量 backupObject 负责在 preferredObject 中不包含有效值的情况下提供后备值

***

#### 1、3、4乘性操作符

1. 乘法 

- 在处理特殊值的情况下，乘法操作符遵循下列特殊的规则： 
  - 如果操作数都是数值，执行常规的乘法计算，即两个正数或两个负数相乘的结果还是正数，而如果只有一个操作数有符号，那么结果就是负数
  - 如果乘积超过了 ECMAScript数值的表示范围， 则返回 Infinity 或-Infinity
  - 如果有一个操作数是 NaN，则结果是 NaN
  - 如果是 Infinity 与 0相乘，则结果是 NaN； 
  - 如果是 Infinity 与非 0数值相乘，则结果是 Infinity 或-Infinity，取决于有符号操作数 的符号； 
  - 如果是 Infinity 与 Infinity 相乘，则结果是 Infinity； 
  - 如果有一个操作数不是数值，则在后台调用 Number()将其转换为数值，然后再应用上面的规则

***

2. 除法 

   除法操作符由一个斜线符号（/）表示

- 与乘法操作符类似，除法操作符对特殊的值也有特殊的处理规则。这些规则如下： 
  - 如果操作数都是数值，执行常规的除法计算，即两个正数或两个负数相除的结果还是正数，而如果只有一个操作数有符号，那么结果就是负数
  - 如果商超过了 ECMAScript数值的表示范围， 则返回 Infinity 或-Infinity； 
  - 如果有一个操作数是 NaN，则结果是 NaN； 
  - 如果是 Infinity 被 Infinity 除，则结果是 NaN； 
  - 如果是零被零除，则结果是 NaN； 
  - 如果是非零的有限数被零除，则结果是 Infinity 或-Infinity，取决于有符号操作数的符号；

  - 如果是 Infinity 被任何非零数值除，则结果是 Infinity 或-Infinity，取决于有符号操作 数的符号； 

***

3. 求模 

   求模（余数）操作符由一个百分号（%）表示，

- 与另外两个乘性操作符类似，求模操作符会遵循下列特殊规则来处理特殊的值： 
  - 如果操作数都是数值，执行常规的除法计算，返回除得的余数； 
  -  如果被除数是无穷大值而除数是有限大的数值，则结果是 NaN； 
  -  如果被除数是有限大的数值而除数是零，则结果是 NaN； 
  -  如果是 Infinity 被 Infinity 除，则结果是 NaN； 
  -  如果被除数是有限大的数值而除数是无穷大的数值，则结果是被除数； 
  -  如果被除数是零，则结果是零； 
  -  如果有一个操作数不是数值，则在后台调用 Number()将其转换为数值，然后再应用上面的规则。 

***

#### 1、3、5关系操作符

**1.相等和不相等**

- 在转换不同的数据类型时，相等和不相等操作符遵循下列基本规则： 
  - 如果有一个操作数是布尔值，则在比较相等性之前先将其转换为数值——false 转换为 0，而 true 转换为 1； 
  -  如果一个操作数是字符串，另一个操作数是数值，在比较相等性之前先将字符串转换为数值； 
  - 如果一个操作数是对象，另一个操作数不是，则调用对象的 valueOf()方法，用得到的基本类 型值按照前面的规则进行比较； 这两个操作符在进行比较时则要遵循下列规则。 
  - null 和 undefined 是相等的。  要比较相等性之前，不能将 null 和 undefined 转换成其他任何值。 
  - 如果有一个操作数是 NaN，则相等操作符返回 false，而不相等操作符返回 true。重要提示： 即使两个操作数都是 NaN，相等操作符也返回 false；因为按照规则，NaN 不等于 NaN。 
  - 如果两个操作数都是对象，则比较它们是不是同一个对象。如果两个操作数都指向同一个对象， 则相等操作符返回 true；否则，返回 false。 

***

**2.全等和不全等**

- 全等操作符由3个等于号（===）表示，它只在两个操作数未经转换就相等的情况下返回 true，如下面的 例子所示： 

  ```
   var result1 = ("55" == 55);    //true 因为转换后相等 
   var result2 = ("55" === 55);  //false 因为不同的数据类型不相等
  ```

- 不全等操作符由一个叹号后跟两个等于号（!==）表示，它在两个操作数未经转换就不相等的情况 下返回 true。例如： 

  ```
   var result1 = ("55" != 55);     //false，因为转换后相等 
   var result2 = ("55" !== 55);    //true，因为不同的数据类型不相等 
  ```

***

### 1、4语句

#### 1、4、1 if 语句

- 我们推荐的做法则是像下面这样： 

```javascript
if (i > 25) {     
    alert("Greater than 25."); 
} else if (i < 0) {     
    alert("Less than 0."); 
} else {     
    alert("Between 0 and 25, inclusive."); 
}
```

***

#### 1、4、2for-in 语句

- for-in 语句是一种精准的**迭代语句**，可以用来**枚举对象的属性**。以下是 for-in 语句的语法： 

  `for (property in expression) statement `
   下面是一个示例： 

  `for (var propName in window) {      

  ​	document.write(propName); 

  } `

- 在这个例子中，我们使用 for-in 循环来显示了 BOM中 window 对象的所有属性。每次执行循环 时，都会将 window 对象中存在的一个属性名赋值给变量 propName。这个过程会一直持续到对象中的 所有属性都被枚举一遍为止

- 但是，如果表示要迭代的对象的变量值为 **null 或 undefined**，for-in 语句会抛出错误。 ECMAScript 5更正了这一行为；对这种情况不再抛出错误，而只是不执行循环体

#### 1、4、3label语句

- label语句 使用 label 语句可以在代码中添加标签，以便将来使用。以下是 label 语句的语法： 

  label: statement 
   下面是一个示例： 

```javascript
start: for (var i=0; i < count; i++) {    
	alert(i);  
} 
```

> 这个例子中定义的 start 标签可以在将来由 break 或 continue 语句引用。加标签的语句一般都 要与 for 语句等循环语句配合使用

***

#### 1、4、4break 和 continue语句

- break 和 continue 语句都可以与 label 语句联合使用，从而返回代码中特定的位置。这种联合使用的情况多发生在循环嵌套的情况下，如下面的例子所示： 

```javascript
var num = 0; 
outermost: 
for (var i=0; i < 10; i++) {      
    for (var j=0; j < 10; j++) {         
        if (i == 5 && j == 5) {             
            break outermost;        
        }        
        num++;     
    } 
} 
alert(num);    //55 
```

> - 内部循环中 的 break 语句带了一个参数：要返回到的标签。
> - 添加这个标签的结果将导致 break 语句不仅会退出内 部的 for 语句（即使用变量 j 的循环），而且也会退出外部的 for 语句（即使用变量 i 的循环）。
> - 为此， 当变量 i 和 j 都等于 5时，num 的值正好是 55

***

#### 1、4、5with语句

- with 语句的作用是将代码的作用域设置到一个特定的对象中。with 语句的语法如下： 

`with (expression) statement; `

- 定义 with 语句的目的主要是为了简化多次编写同一个对象的工作，如下面的例子所示： 

```
var qs = location.search.substring(1); 
var hostName = location.hostname; 
var url = location.href; 
```

> 上面几行代码都包含 location 对象。如果使用 with 语句，可以把上面的代码改写成如下所示：

```javascript
with(location){     
    var qs = search.substring(1);    
    var hostName = hostname;    
    var url = href;
} 
```

> **由于大量使用 with 语句会导致性能下降，同时也会给调试代码造成困难，因此 在开发大型应用程序时，不建议使用 with 语句。** 

***

#### 1、4、6switch语句

- 虽然 ECMAScript中的 switch 语句借鉴自其他语言，但这个语句也有自己的特色。
- 首先，可以在 switch 语句中使用任何数据类型（在很多其他语言中只能使用数值），无论是字符串，还是对象都没有问题
- 其次，每个 case的值不一定是常量，可以是变量，甚至是表达式

```javascript
switch ("hello world") {    
    case "hello" + " world":         
        alert("Greeting was found.");     
        break;     
    case "goodbye":        
        alert("Closing was found.");       
        break;   
    default:         
        alert("Unexpected message was found.");
}
```

> switch 语句在比较值时使用的是全等操作符，因此不会发生类型转换（例如， 字符串"10"不等于数值 10）

***

### 1、5函数

- ECMAScript中的函数使用 function 关键字来声明，后跟一组参数以及函数体。 函数的基本语法如下所示： 

```javascript
function functionName(arg0, arg1,...,argN) {    
    statements 
} 
 以下是一个函数示例： 
 
function sayHi(name, message) {    
    alert("Hello " + name + "," + message); 
}
```

#### 1、5、1理解参数

- ECMAScript函数的参数与大多数其他语言中函数的参数有所不同。ECMAScript函数不介意传递进来多少个参数，也不在乎传进来参数是什么数据类型。

- ECMAScript中的参数在内部是用一个**数组**来表示的。函数接收 到的始终都是这个数组，而不关心数组中包含哪些参数（如果有参数的话）

- 在函数体内可以通过 **arguments 对象**来 访问这个参数数组，从而获取传递给函数的每一个参数

> arguments 对象只是与数组类似（它并不是 Array 的实例），因为可以使用方括号语法访 问它的每一个元素

> 使 用 length 属性来确定传递进来多少个参数

```javascript
function sayHi() {     
    alert("Hello " + arguments[0] + "," + arguments[1]); 
} 
```

> **这个事实说明了 ECMAScript函数的一个重要特点：命名的参数只提供便利，但不是必需的**

- 通过访问 arguments 对象的 length 属性可以获知有多少个参数传递给了函数。下面这个函数会 在每次被调用时，输出传入其中的参数个数： 


```javascript
function howManyArgs() {     
    alert(arguments.length); 
} 
howManyArgs("string", 45);  //2 
howManyArgs();              //0 
howManyArgs(12);            //1 
```

- 由此可见，开发人员可以利用这一点让 函数能够接收任意个参数并分别实现适当的功能。请看下面的例子： 

```javascript
function doAdd() {    
    if(arguments.length == 1) {   
        alert(arguments[0] + 10);     
    } else if (arguments.length == 2) {      
        alert(arguments[0] + arguments[1]);    
    } 
} 
doAdd(10);        //20 
doAdd(30, 20);     //50 
```

***

## 2、变量、作用域和内存问题 

### 2、1基本类型和引用类型的值 

- ECMAScript 变量可能包含两种不同数据类型的值：**基本类型值和引用类型值**。
- 基本类型值指的是简单的数据段
- 引用类型值指那些可能由多个值构成的对象。 

#### 2、1、1动态的属性 

> 定义基本类型值和引用类型值的方式是类似的：创建一个变量并为该变量赋值。
>
> 对于引用类型的值，我们可以为其添加属性和方法，也可以改变和删除其属性和方法

```
var person = new Object();  
person.name = "Nicholas"; 
alert(person.name);    //"Nicholas" 
```

***

#### 2、1、2复制变量值

> 当从一个变量向另一个变量复制引用类型的值时，同样也会将存储在变量对象中的值复制一份放到为新变量分配的空间中。
>
> 不同的是，这个值的副本实际上是一个指针，而这个指针指向存储在堆中的一个对象。
>
> 复制操作结束后，两个变量实际上将引用同一个对象。
>
> 因此，改变其中一个变量，就会影响另一个变量，如下面的例子所示： 

```javascript
var obj1 = new Object(); 
var obj2 = obj1; 
obj1.name = "Nicholas"; 
alert(obj2.name);  //"Nicholas" 
```

***

#### 2、1、3传递参数

> ECMAScript 中所有函数的参数都是按值传递的。也就是说，把函数外部的值复制给函数内部的参数，就和把值从一个变量复制到另一个变量一样。
>
> - 基本类型值的传递如同基本类型变量的复制一样
> - 引用类型值的传递，则如同引用类型变量的复制一样。

#### 2、1、4检测类型

> 要检测一个变量是不是基本数据类型？第 3章介绍的 typeof 操作符是最佳的工具。说得更具体一 点，typeof 操作符是确定一个变量是字符串、数值、布尔值，还是 undefined 的最佳工具。如果变 量的值是一个对象或 null，则 typeof 操作符会像下面例子中所示的那样返回"object"： 

```javascript
var s = "Nicholas"; 
var b = true; 
var i = 22; 
var u; 
var n = null; 
var o = new Object(); 

alert(typeof s);   //string 
alert(typeof i);   //number 
alert(typeof b);   //boolean 
alert(typeof u);   //undefined 
alert(typeof n);   //object 
alert(typeof o);   //object 
```

> 通常，我们并不是想知道某个值是对象，而是想知道它是什么类型的对象。为此，ECMAScript 提供了 instanceof 操作符，其语法如下所示： 

`result = variable instanceof constructor `

- 如果变量是给定引用类型（根据它的原型链来识别；第 6 章将介绍原型链）的实例，那么 instanceof 操作符就会返回 true。请看下面的例子： 

```javascript
alert(person instanceof Object); // 变量 person 是 Object 吗？ 
alert(colors instanceof Array);  // 变量 colors 是 Array 吗？ 
alert(pattern instanceof RegExp);  // 变量 pattern 是 RegExp 吗？ 
```

> 根据规定，所有引用类型的值都是 Object 的实例。因此，在检测一个引用类型值和 Object 构造函数时，instanceof 操作符始终会返回 true。当然，如果使用 instanceof 操作符检测基本类型的 值，则该操作符始终会返回 false，因为基本类型不是对象

***

## 3、引用类型

### 3、1object函数

- 创建 Object 实例的方式有两种
- 第一种是使用 new 操作符后跟 Object 构造函数，如下所示： 

```javascript
var person = new Object(); 
person.name = "Nicholas"; 
person.age = 29; 
```

- 另一种方式是使用对象字面量表示法。对象字面量是对象定义的一种简写形式，目的在于简化创建包含大量属性的对象的过程。下面这个例子就使用了对象字面量语法定义了与前面那个例子中相同的 person 对象： 

```javascript
var person = {     
    name : "Nicholas",     
    age : 29 
}; 
```

> 在这个例子中，左边的花括号（{）表示对象字面量的开始，因为它出现在了表达式上下文 （expression context）中。ECMAScript中的表达式上下文指的是能够返回一个值（表达式）。

***

对象字面量也是向函数传递大量可选参 数的首选方式，例如： 

```javascript
function displayInfo(args) {    
    var output = ""; 
    if (typeof args.name == "string"){  
        output += "Name: " + args.name + "\n";     
    } 
    if (typeof args.age == "number") {         
        output += "Age: " + args.age + "\n";     
    } 
 
    alert(output); 
} 
 
displayInfo({      
    name: "Nicholas",      
    age: 29 }); 
 
displayInfo({     
    name: "Greg" }); 
```

> 在这个例子中，函数displayInfo()接受一个名为args的参数。这个参数可能带有一个名为name 或 age 的属性，也可能这两个属性都有或者都没有。在这个函数内部，我们通过 typeof 操作符来检测 每个属性是否存在，然后再基于相应的属性来构建一条要显示的消息

- 在 JavaScript 也可以使用方括号表示法来访问对象的属性。在使用方括号语法时，应该将要访问的属性 以字符串的形式放在方括号中，如下面的例子所示。 

`alert(person["name"]);       //"Nicholas" `

 `alert(person.name);         //"Nicholas" `

> 由于"first name"中包含一个空格，所以不能使用点表示法来访问它。然而，属性名中是可以包 含非字母非数字的，这时候就可以使用方括号表示法来访问它们。 通常，除非必须使用变量来访问属性，否则我们建议使用点表示法
>
> `person["first name"] = "Nicholas"; `

***

### 3、2Array类型

- ECMAScript 数组的每一项可以保存任何类型的数据
- ECMAScript 数组的大小是可以动态调整的，即可以随着数据的添加自动增长以容纳新增数据

> 创建数组的基本方式有两种。第一种是使用 Array 构造函数，如下面的代码所示。 

`var colors = new Array(); `

>如果预先知道数组要保存的项目数量，也可以给构造函数传递该数量，而该数量会自动变成 length 属性的值。例如，下面的代码将创建 length 值为 20的数组。 

`var colors = new Array(20); `

>也可以向Array 构造函数传递数组中应该包含的项。以下代码创建了一个包含3个字符串值的数组：

`var colors = new Array("red", "blue", "green"); `

> 另外，在使用 Array 构造函数时也可以省略 new 操作符。如下面的例子所示，省略 new 操作符的 结果相同： 

```
var colors = Array(3);             // 创建一个包含 3 项的数组 
var names = Array("Greg");   // 创建一个包含 1 项，即字符串"Greg"的数组 
```

> 创建数组的第二种基本方式是使用数组字面量表示法。数组字面量由一对包含数组项的方括号表 示，多个数组项之间以逗号隔开，如下所示:

```javascript
var colors = ["red", "blue", "green"]; // 创建一个包含 3 个字符串的数组 
var names = [];                      // 创建一个空数组 
var values = [1,2,];                  // 不要这样！这样会创建一个包含 2 或 3 项的数组 
var options = [,,,,,];                  // 不要这样！这样会创建一个包含 5 或 6 项的数组 
```

- 数组的项数保存在其 length 属性中，这个属性始终会返回 0或更大的值

- 数组的 length 属性很有特点——它不是只读的。因此，通过设置这个属性，可以从数组的末尾移 除项或向数组中添加新项。请看下面的例子： 

```javascript
var colors = ["red", "blue", "green"];     // 创建一个包含 3 个字符串的数组 
colors.length = 2; 
alert(colors[2]);                 //undefined
```

> 如果将其 length 属性设置为大于数组 项数的值，则新增的每一项都会取得 undefined 值，如下所示： 

```javascript
var colors = ["red", "blue", "green"];    // 创建一个包含 3 个字符串的数组 
colors.length = 4; 
alert(colors[3]);                 //undefined 
```

> 利用 length 属性也可以方便地在数组末尾添加新项，如下所示： 

```javascript
var colors = ["red", "blue", "green"];    // 创建一个包含 3 个字符串的数组
colors[colors.length] = "black";          //（在位置 3）添加一种颜色 
colors[colors.length] = "brown";          //（在位置 4）再添加一种颜色 
```

***

#### 3、2、1转换方法

- 所有对象都具有 **toLocaleString()**、**toString()**和 **valueOf()**方法。
- 其中，调用数组的 toString()方法会返回由数组中**每个值的字符串形式拼接**而成的一个**以逗号分隔**的字符串
- 调用 valueOf()返回的还是数组

```javascript
var colors = ["red", "blue", "green"];    // 创建一个包含 3 个字符串的数组 
alert(colors.toString());     // red,blue,green 
alert(colors.valueOf());      // red,blue,green 
alert(colors);                // red,blue,green 
```

> 显式地调用了 toString()方法，以便返回数组的字符串表示，每个值的字符串 表示拼接成了一个字符串，中间以逗号分隔
>
> 接着调用 valueOf()方法，而后一行代码直接将数组 传递给了 alert()
>
> 由于 alert()要接收字符串参数，所以它会在后台调用 toString()方法，由此 会得到与直接调用 toString()方法相同的结果。 

- 如果使用 join()方法，则可以使用不同的分隔符来构建这个字符串。join()方 法只接收一个参数，即用作分隔符的字符串，然后返回包含所有数组项的字符串。请看下面的例子： 

```javascript
var colors = ["red", "green", "blue"]; 
alert(colors.join(","));       //red,green,blue 
alert(colors.join("||"));      //red||green||blue 
```

***

#### 3、2、2栈方法

> **栈是一种 LIFO（Last-In-First-Out， 后进先出）的数据结构**

- ECMAScript为数组专门提供了 push()和 pop()方法，以便 实现类似栈的行为。 
- push()方法可以接收任意数量的参数，把它们逐个添加到数组末尾，并返回修改后数组的长度。
- 而 pop()方法则从数组末尾移除后一项，减少数组的 length 值，然后返回移除的项。请看下面的例子

```javascript
var colors = new Array();                  // 创建一个数组 
var count = colors.push("red", "green");   // 推入两项 
alert(count);  //2 
 
count = colors.push("black");              // 推入另一项 
alert(count);     //3 
 
var item = colors.pop();                  // 取得最后一项 
alert(item);      //"black" 
alert(colors.length);   //2 
```

#### 3、2、3队列方法

> **队列数据结构的访问规则是 FIFO（First-In-First-Out， 先进先出）**

- 实现这一操作的数组方法就是 shift()，它能够移除数组中的第一个项并返回该项，同时将数组长度减 1。
- 结合使用 shift()和 push()方法，可以像使用队列一样使用数组

```javascript
var colors = new Array();                   //创建一个数组 
var count = colors.push("red", "green");    //推入两项 
alert(count);  //2 
 
count = colors.push("black");               //推入另一项 
alert(count);     //3 
 
var item = colors.shift();                  //取得第一项 
alert(item);      //"red" 
alert(colors.length); //2 
```

- unshift()与 shift()的用途相反： 它能在数组前端添加任意个项并返回新数组的长度。
- 因此，同时使用 unshift()和 pop()方法，可以从相反的方向来模拟队列，即在数组的前端添加项，从数组末端移除项

```javascript
var colors = new Array();                     //创建一个数组 
var count = colors.unshift("red", "green");      //推入两项 
alert(count);   //2 
count = colors.unshift("black");                //推入另一项 
alert(count);   //3 
 
var item = colors.pop();                       //取得最后一项 
alert(item);    //"green" 
alert(colors.length); //2 
```

#### 3、2、4重排序方法

- 数组中已经存在两个可以直接用来重排序的方法：**reverse()和 sort()**。
  - **reverse()**方法会反转数组项的顺序。请看下面这个例子。 

```javascript
var values = [1, 2, 3, 4, 5]; 
values.reverse(); 
alert(values);        //5,4,3,2,1 
```

- 在默认情况下，sort()方法按升序排列数组项——即小的值位于前面，大的值排在后面。 
- 为了实现排序，sort()方法会调用每个数组项的 toString()转型方法，然后比较得到的字符串，以确定如何排序。
- 即使数组中的每一项都是数值，sort()方法比较的也是字符串

```javascript
var values = [0, 1, 5, 10, 15]; 
values.sort(); 
alert(values);   //0,1,10,15,5 
```

> **reverse()和 sort()方法的返回值是经过排序之后的数组**

#### 3、2、5操作方法

- **concat()方法**可以基于当前数 组中的所有项创建一个新数组。具体来说，这个方法会先创建当前数组一个副本，然后将接收到的参数 添加到这个副本的末尾，后返回新构建的数组
  - 如果传递给 concat()方法的是一或多个数组，则该方法会将这些数组中的 每一项都添加到结果数组中。
  - 如果传递的值不是数组，这些值就会被简单地添加到结果数组的末尾

```javascript
var colors = ["red", "green", "blue"]; 
var colors2 = colors.concat("yellow", ["black", "brown"]); 
 
alert(colors);     //red,green,blue         
alert(colors2);    //red,green,blue,yellow,black,brown 
```

- 下一个方法是 **slice()**，它能够基于当前数组中的一或多个项创建一个新数组。
  - slice()方法可以 接受一或两个参数，即要返回项的起始和结束位置
  - 在只有一个参数的情况下，slice()方法返回从该 参数指定位置开始到当前数组末尾的所有项
  - 如果有两个参数，该方法返回起始和结束位置之间的项— —但**不包括结束位置的项**

```javascript
var colors = ["red", "green", "blue", "yellow", "purple"]; 
var colors2 = colors.slice(1); 
var colors3 = colors.slice(1,4); 
 
alert(colors2);   //green,blue,yellow,purple 
alert(colors3);   //green,blue,yellow 
```

- **splice()**的主要用途是向数组的中部插入项，但使用这种方法的方式则有如下 3种

  - **删除**：可以删除任意数量的项，只需指定 2 个参数：**要删除的第一项的位置和要删除的项数**。 例如，splice(0,2)会删除数组中的前两项。 

  - **插入**：可以向指定位置插入任意数量的项，只需提供 3个参数：起始位置、0（要删除的项数） 和要插入的项。如果要插入多个项，可以再传入第四、第五，以至任意多个项。例如， splice(2,0,"red","green")会从当前数组的位置 2开始插入字符串"red"和"green"。 

  - **替换**：可以向指定位置插入任意数量的项，且同时删除任意数量的项，只需指定 3 个参数：起始位置、要删除的项数和要插入的任意数量的项。插入的项数不必与删除的项数相等。例如

    splice(2,1,"red","green")会删除当前数组位置 2 的项，然后再从位置 2 开始插入字符串 "red"和"green"。 

> splice()方法始终都会返回一个数组，该数组中包含从原始数组中删除的项（如果没有删除任何 项，则返回一个空数组）

```javascript
var colors = ["red", "green", "blue"]; 
var removed = colors.splice(0,1);                // 删除第一项 
alert(colors);     // green,blue 
alert(removed);    // red，返回的数组中只包含一项 
 
removed = colors.splice(1, 0, "yellow", "orange");   // 从位置 1 开始插入两项 
alert(colors);     // green,yellow,orange,blue 
alert(removed);    // 返回的是一个空数组 
 
removed = colors.splice(1, 1, "red", "purple");      // 插入两项，删除一项 
alert(colors);     // green,red,purple,orange,blue 
alert(removed);    // yellow，返回的数组中只包含一项 
```

#### 3、2、6位置方法

- **indexOf()和 lastIndexOf()**

  - 这两个方法都接收两个参数：要查找的项和（可选的）表示查找起点位置的索引

  - 其中，indexOf()方法从数组的开头（位 置 0）开始向后查找

  - lastIndexOf()方法则从数组的末尾开始向前查找

- 这两个方法都返回要查找的项在**数组中的位置**

```javascript
var numbers = [1,2,3,4,5,4,3,2,1]; 
 
alert(numbers.indexOf(4));        //3 
alert(numbers.lastIndexOf(4));    //5 
 
alert(numbers.indexOf(4, 4));     //5 
alert(numbers.lastIndexOf(4, 4)); //3 
 
var person = { name: "Nicholas" }; 
var people = [{ name: "Nicholas" }]; 
 
var morePeople = [person]; 
 
alert(people.indexOf(person));     //-1 
alert(morePeople.indexOf(person)); //0 
```

#### 3、2、7迭代方法

- 每个方法都接收两个参数：要在**每一项上运行的函数**和 （可选的）**运行该函数的作用域对象**——影响 this 的值
  - **every()**：对数组中的每一项运行给定函数，如果该函数对每一项都返回 true，则返回 true。
  - **filter()**：对数组中的每一项运行给定函数，返回该函数会返回 true 的项组成的数组。 
  - **forEach()**：对数组中的每一项运行给定函数。这个方法没有返回值。 
  - **map()**：对数组中的每一项运行给定函数，返回每次函数调用的结果组成的数组。 
  - **some()**：对数组中的每一项运行给定函数，如果该函数对任一项返回 true，则返回 true
- 传入这些方法中的函数会接收三个参数：**数组项的值**、**该项在数组中的位置**和**数组对象本身**
- 根据使用的方法不同，这个函数执行后的返回值可能 会也可能不会影响方法的返回值

```javascript
var numbers = [1,2,3,4,5,4,3,2,1]; 
 
var everyResult = numbers.every(function(item, index, array){     
    return (item > 2);  
}); 
 
alert(everyResult);    //false 
 
var someResult = numbers.some(function(item, index, array){     
    return (item > 2); 
}); 

alert(someResult);     //true 
```

> 以上代码调用了every()和some()，传入的函数只要给定项大于2就会返回true。对于every()， 它返回的是 false，因为只有部分数组项符合条件。对于 some()，结果就是 true，因为至少有一项 是大于 2的

- 下面再看一看 filter()函数，它利用指定的函数确定是否在返回的数组中包含某一项。例如，要 返回一个所有数值都大于 2的数组，可以使用以下代码。 

```javascript
var numbers = [1,2,3,4,5,4,3,2,1]; 
 
var filterResult = numbers.filter(function(item, index, array){     
    return (item > 2); 
}); 
 
alert(filterResult);  //[3,4,5,4,3] 
```

- map()也返回一个数组，而这个数组的每一项都是在原始数组中的对应项上运行传入函数的结果。 例如，可以给数组中的每一项乘以 2，然后返回这些乘积组成的数组，如下所示

```javascript
var numbers = [1,2,3,4,5,4,3,2,1]; 
 
var mapResult = numbers.map(function(item, index, array){     
    return item * 2; 
}); 
 
alert(mapResult);  //[2,4,6,8,10,8,6,4,2] 
```

#### 3、2、8归并方法

- **reduce()**和 **reduceRight()**
- 这两个方法都会迭代数组的所有项，然后构建一个终返回的值
  - 其中，reduce()方法从数组的第一项开始，逐个遍历到后。
  - reduceRight()则从数组的后一项开始，向前遍历到第一项

- 这两个方法都接收两个参数：一个在**每一项上调用的函数**和（可选的）**作为归并基础的初始值**

- 传给 reduce()和 reduceRight()的函数接收 4 个参数：**前一个值、当前值、项的索引和数组对象**

- 这个函数返回的任何值都会作为第一个参数自动传给下一项。第一次迭代发生在数组的第二项上，因此第 一个参数是数组的第一项，第二个参数就是数组的第二项

> 使用 reduce()方法可以执行求数组中所有值之和的操作，比如： 

```javascript
var values = [1,2,3,4,5]; 
var sum = values.reduce(function(prev, cur, index, array){     
    return prev + cur;  
}); 
alert(sum); //15 
```

> 第一次执行回调函数，prev 是 1，cur 是 2。第二次，prev 是 3（1加 2的结果），cur 是 3（数组 的第三项）。这个过程会持续到把数组中的每一项都访问一遍，后返回结果

***

>reduceRight()的作用类似，只不过方向相反而已。来看下面这个例子。 

```javascript
var values = [1,2,3,4,5]; 
var sum = values.reduceRight(function(prev, cur, index, array){     
    return prev + cur; 
}); 
alert(sum); //15 
```

***

### 3、3Data类型

- 要创建一个日期对象，使用 new 操作符和 Date 构造函数即可，如下所示。 

  `var now = new Date(); `

- 在调用 Date 构造函数而不传递参数的情况下，新创建的对象自动获得当前日期和时间
- 如果想根据特定的日期和时间创建日期对象，必须传入表示该日期的毫秒数（即从 UTC时间 1970年 1月 1日午 夜起至该日期止经过的毫秒数）
- 为了简化这一计算过程，ECMAScript 提供了两个方法：Date.parse() 和 Date.UTC()
  - Date.parse()方法接收一个表示日期的字符串参数，然后尝试根据这个字符串返回相应日期的毫秒数
    - 将地区设置为美国的浏览器通常都接受下列日期格式:
    - “月/日/年”，如 6/13/2004； 
    - “英文月名 日,年”，如 January 12,2004； 
    - “英文星期几 英文月名 日 年 时:分:秒 时区”，如 Tue May 25 2004 00:00:00 GMT-0700
    -  ISO 8601 扩展格式 YYYY-MM-DDTHH:mm:ss.sssZ（例如 2004-05-25T00:00:00）

- 要为 2004年 5月 25日创建一个日期对象，可以使用下面的代码： 
  ` var someDate = new Date(Date.parse("May 25, 2004")); `

- 如果传入 Date.parse()方法的字符串不能表示日期，那么它会返回 NaN
- 实际上，如果直接将表 示日期的字符串传递给 Date 构造函数，也会在后台调用 Date.parse()。换句话说，下面的代码与前 面的例子是等价的： 
  ` var someDate = new Date("May 25, 2004"); `

***

- Date.UTC()方法同样也返回表示日期的毫秒数，但它与 Date.parse()在构建值时使用不同的信息。
- Date.UTC()的参数分别是年份、基于 0的月份（一月是 0，二月是 1，以此类推）、月中的哪一天 （1 到 31）、小时数（0 到 23）、分钟、秒以及毫秒数
- 如果省略其他参数，则统统假设为 0

```
// GMT 时间 2000 年 1 月 1 日午夜零时 
var y2k = new Date(Date.UTC(2000, 0)); 
 
// GMT 时间 2005 年 5 月 5 日下午 5:55:55 
var allFives = new Date(Date.UTC(2005, 4, 5, 17, 55, 55)); 
```

***

- Data.now()方法

- 返回表示调用这个方法时的日期和时间的毫秒数。这个方法简化了使用 Data 对象分析代码的工作。例如： 

```
//取得开始时间 
var start = Date.now(); 
 
//调用函数 
doSomething(); 
 
//取得停止时间 var stop = Date.now(),     
result = stop – start; 
```

***

#### 3、3、1继承方法

- **toLocaleString()方法**会按照与浏览器 设置的地区相适应的格式返回日期和时间。这大致意味着时间格式中会包含 AM或 PM，但不会包含时 区信息

- **toString()方法**则通常返回带有时区信息的日期和 时间，其中时间一般以军用时间（即小时的范围是 0 到 23）

- 至于 Date 类型的 valueOf()方法，则根本不返回字符串，而是返回日期的毫秒表示。因此，可以 方便使用比较操作符（小于或大于）来比较日期值

```javascript
var date1 = new Date(2007, 0, 1);    //"January 1, 2007" 
var date2 = new Date(2007, 1, 1);    //"February 1, 2007" 
 
alert(date1 < date2); //true 
alert(date1 > date2); //false 
```

#### 3、3、2日期格式化方法

- Date 类型还有一些专门用于将日期格式化为字符串的方法，这些方法如下。 
  -  toDateString()——以特定于实现的格式显示星期几、月、日和年； 
  -  toTimeString()——以特定于实现的格式显示时、分、秒和时区； 
  -  toLocaleDateString()——以特定于地区的格式显示星期几、月、日和年； 
  -  toLocaleTimeString()——以特定于实现的格式显示时、分、秒； 
  -  toUTCString()——以特定于实现的格式完整的 UTC日期。 

***

### 3、4正则表达式RegExp

- 创建一个正则表达式:

`var expression = / pattern / flags ; `

- 其中的模式（pattern）部分可以是任何简单或复杂的正则表达式，可以包含字符类、限定符、分组、 向前查找以及反向引用

- 每个正则表达式都可带有一或多个标志（flags），用以标明正则表达式的行为。
  - 正则表达式的匹配模式支持下列 3个标志。 
    - g：表示全局（global）模式，即模式将被应用于所有字符串，而非在发现第一个匹配项时立即停止； 
    - i：表示不区分大小写（case-insensitive）模式，即在确定匹配项时忽略模式与字符串的大小写；
    - m：表示多行（multiline）模式，即在到达一行文本末尾时还会继续查找下一行中是否存在与模 式匹配的项。

```javascript
/* * 匹配字符串中所有"at"的实例 */ 
var pattern1 = /at/g; 
 
/* * 匹配第一个"bat"或"cat"，不区分大小写 */ 
var pattern2 = /[bc]at/i; 
 
/* * 匹配所有以"at"结尾的 3 个字符的组合，不区分大小写 */ 
var pattern3 = /.at/gi; 
```

- 与其他语言中的正则表达式类似，模式中使用的所有元字符都必须转义。正则表达式中的元字符包括：


```
( [ { \ ^ $ | ) ? * + .]} 
```

- 这些元字符在正则表达式中都有一或多种特殊用途，因此如果想要匹配字符串中包含的这些字符， 就必须对它们进行转义

```javascript
/* * 匹配第一个"bat"或"cat"，不区分大小写 */ 
var pattern1 = /[bc]at/i; 
 
/* * 匹配第一个" [bc]at"，不区分大小写 */ 
var pattern2 = /\[bc\]at/i; 
 
/* * 匹配所有以"at"结尾的 3 个字符的组合，不区分大小写 */ 
var pattern3 = /.at/gi; 
 
/* * 匹配所有".at"，不区分大小写 */ 
var pattern4 = /\.at/gi; 
 
```

- 另一种创建正则表达式的方式是使用 RegExp 构造函数
- 它接收两个参数：一个是要匹配的字符串模式，另一个是可选的标志字符串

```javascript
/* * 匹配第一个"bat"或"cat"，不区分大小写 */ 
var pattern1 = /[bc]at/i; 
 
/* * 与 pattern1 相同，只不过是使用构造函数创建的 */ 
var pattern2 = new RegExp("[bc]at", "i"); 
```

> 要注意的是，传递给 RegExp 构造 函数的两个参数都是字符串（不能把正则表达式字面量传递给 RegExp 构造函数）。
>
> 由于 RegExp 构造 函数的模式参数是字符串，所以在某些情况下要对字符进行**双重转义**

```
/\[bc\]at/ 					"\\[bc\\]at" 
/\.at/ 						"\\.at" 
/name\/age/ 				"name\\/age" 
/\d.\d{1,2}/ 				"\\d.\\d{1,2}" 
/\w\\hello\\123/ 			"\\w\\\\hello\\\\123"
```

#### 3、4、1RegExp实例属性 

- RegExp 的每个实例都具有下列属性，通过这些属性可以取得有关模式的各种信息 
  - global：布尔值，表示是否设置了 g 标志。 
  - ignoreCase：布尔值，表示是否设置了 i 标志。 
  - lastIndex：整数，表示开始搜索下一个匹配项的字符位置，从 0算起。 
  - multiline：布尔值，表示是否设置了 m 标志。 
  - source：正则表达式的字符串表示，按照字面量形式而非传入构造函数中的字符串模式返回。 

#### 3、4、2RegExp实例方法 

- RegExp 对象的主要方法是 **exec()**，该方法是专门为捕获组而设计的。
- exec()接受一个参数，即要**应用模式的字符串**，然后返回包含第一个匹配项信息的数组；或者在没有匹配项的情况下返回 null
- 返回的数组虽然是 Array 的实例，但包含两个额外的属性：**index 和 input**
- index 表示匹配项在字符串中的位置，而 input 表示应用正则表达式的字符串
- 在数组中，第一项是与整个模式匹配 的字符串，其他项是与模式中的捕获组匹配的字符串（如果模式中没有捕获组，则该数组只包含一项）

```javascript
var text = "mom and dad and baby"; 
var pattern = /mom( and dad( and baby)?)?/gi; 
 
var matches = pattern.exec(text); 
alert(matches.index);     // 0 
alert(matches.input);     // "mom and dad and baby" 
alert(matches[0]);        // "mom and dad and baby" 
alert(matches[1]);        // " and dad and baby" 
alert(matches[2]);        // " and baby" 
```

- 正则表达式的第二个方法是 **test()**
- 它接受一个**字符串参数**。在模式与该参数匹配的情况下返回 true；否则，返回 false







***

### 3、5Function类型

- 第一种方法

```
function sum (num1, num2) {     
	return num1 + num2; 
} 
```

- 第二种方法

```
var sum = function(num1, num2){     
	return num1 + num2; 
}; 
```

- 由于函数名仅仅是指向函数的指针，因此函数名与包含对象指针的其他变量没有什么不同。换句话说，一个函数可能会有多个名字，如下面的例子所示

```javascript
function sum(num1, num2){     
    return num1 + num2; 
} 
alert(sum(10,10));        //20 
 
var anotherSum = sum; 
alert(anotherSum(10,10)); //20 
 
sum = null; 
alert(anotherSum(10,10)); //20 
```

#### 3、5、1函数的属性和方法

- 每个函数都包含两个属性：**length 和 prototype**。
- 其中，length 属性表示函数希望接收的命名参数的个数，如下面的例子所示。 

```javascript
function sayName(name){     
    alert(name); 
}       
 
function sum(num1, num2){     
    return num1 + num2; 
} 
 
function sayHi(){     
    alert("hi"); 
} 
 
alert(sayName.length);      //1 
alert(sum.length);          //2 
alert(sayHi.length);        //0 
```

- 首先，apply()方法接收两个参数：一个 是在其中运行函数的作用域，另一个是参数数组

```javascript
function sum(num1, num2){     
    return num1 + num2; 
} 
 
function callSum1(num1, num2){     
    return sum.apply(this, arguments);        // 传入 arguments 对象 
} 
 
function callSum2(num1, num2){     
    return sum.apply(this, [num1, num2]);    // 传入数组
} 
 
alert(callSum1(10,10));   //20 
alert(callSum2(10,10));   //20 
```

- call()方法与 apply()方法的作用相同，它们的区别仅在于接收参数的方式不同。

  > 对于 call() 方法而言，第一个参数是 this 值没有变化，变化的是其余参数都直接传递给函数。换句话说，在使用 call()方法时，传递给函数的参数必须逐个列举出来，如下面的例子所示

```javascript
function sum(num1, num2){    
    return num1 + num2; 
} 
 
function callSum(num1, num2){   
    return sum.call(this, num1, num2); 
} 
 
alert(callSum(10,10));   //20 
```

- 事实上，传递参数并非 apply()和 call()真正的用武之地;它们真正强大的地方是能够扩充函数赖以运行的作用域

```javascript
window.color = "red"; 
var o = { color: "blue" }; 
 
function sayColor(){     
    alert(this.color); 
} 
 
sayColor();                //red 
 
sayColor.call(this);       //red 
sayColor.call(window);     //red 
sayColor.call(o);          //blue 
```

***

### 3、6基本包装类型

- 为了便于操作基本类型值，ECMAScript 还提供了 3 个特殊的引用类型：Boolean、Number 和 String
- 每当读取一个基本类型值的时候，后台就会创建一个对应的基本包装类型的对象，从而让我们 能够调用一些方法来操作这些数据

#### 3、6、1String类型

- String 类型是字符串的对象包装类型，可以像下面这样使用 String 构造函数来创建。 

  `var stringObject = new String("hello world"); `

  - String 对象的方法也可以在所有基本的字符串值中访问到
  - 其中，继承的 valueOf()、toLocale- String()和 toString()方法，都返回对象所表示的基本字符串值

- String 类型的每个实例都有一个 length 属性，表示字符串中包含多个字符。来看下面的例子。 

```
var stringValue = "hello world"; 
alert(stringValue.length);     //"11" 
```

1. **字符方法** 

   - 两个用于访问**字符串中特定字符**的方法是：charAt()和 charCodeAt()

   - 这两个方法都接收一个 参数，即基于 0 的字符位置

   - charAt()方法以单字符字符串的形式返回给定位置的那个字符 

   - ```
     var stringValue = "hello world";
     alert(stringValue.charAt(1));   //"e" 
     ```

   - 如果你想得到 的不是字符而是字符编码，那么就要像下面这样使用 charCodeAt()了

   - ```
     var stringValue = "hello world";
     alert(stringValue.charCodeAt(1));   //输出"101" 
     ```

2. **字符串操作方法** 

   - 下面介绍与**操作字符串**有关的几个方法

   - 第一个就是 concat()，用于将一或多个字符串拼接起来， 返回拼接得到的新字符串

```javascript
var stringValue = "hello "; 
var result = stringValue.concat("world"); 
alert(result);          //"hello world" 
alert(stringValue);      //"hello" 
```

- - concat()方法可以接受任意多个参数，也就是说可以通过它 拼接任意多个字符串

  ```javascript
  var stringValue = "hello "; 
  var result = stringValue.concat("world", "!"); 
   
  alert(result);          //"hello world!" 
  alert(stringValue);      //"hello" 
  ```

> 虽然 concat()是专门用来拼接字符串的方 法，但**实践中使用更多的还是加号操作符（+）**。而且，使用加号操作符在大多数情况下都比使用concat() 方法要简便易行（特别是在拼接多个字符串的情况下）

- ECMAScript还提供了三个基于子字符串创建新字符串的方法：slice()、substr()和substring()。 
- 这三个方法都会返回被操作字符串的一个子字符串，而且也都接受一或两个参数
  - 第一个参数指定子字符串的开始位置，第二个参数（在指定的情况下）表示子字符串到哪里结束
  - slice()和 substring()的第二个参数指定的是子字符串后一个字符后面的位置
  - 而 substr()的第二个参数指定的则是返回的字符个数

```javascript
var stringValue = "hello world"; 
alert(stringValue.slice(3));         //"lo world" 
alert(stringValue.substring(3));     //"lo world" 
alert(stringValue.substr(3));        //"lo world" 
alert(stringValue.slice(3, 7));      //"lo w" 
alert(stringValue.substring(3,7));   //"lo w" 
alert(stringValue.substr(3, 7));     //"lo worl" 
```

3. **字符串位置方法** 

   - 有两个可以从字符串中查找子字符串的方法：indexOf()和 lastIndexOf()
   - 这两个方法都是从 一个字符串中搜索给定的子字符串，然后返子字符串的位置
   - indexOf()方法从字符串的开头向后搜索子字符串
   - 而 lastIndexOf()方法 是从字符串的末尾向前搜索子字符串

   ```
   var stringValue = "hello world"; 
   alert(stringValue.indexOf("o"));             //4 
   alert(stringValue.lastIndexOf("o"));         //7 
   ```

   - 这两个方法都可以接收可选的第二个参数，表示从字符串中的哪个位置开始搜索

   ```
   var stringValue = "hello world"; 
   alert(stringValue.indexOf("o", 6));         //7 
   alert(stringValue.lastIndexOf("o", 6));     //4     
   ```

4. **trim()方法**

   -  ECMAScript 5为所有字符串定义了 trim()方法。这个方法会创建一个字符串的副本，删除前置及 后缀的所有空格，然后返回结果

   ```
   var stringValue = "   hello world   "; 
   var trimmedStringValue = stringValue.trim(); 
   alert(stringValue);            //"   hello world   "
   alert(trimmedStringValue);     //"hello world" 
   ```


5. **字符串大小写转换方法** 

   - 接下来我们要介绍的是一组与大小写转换有关的方法
   - ECMAScript 中涉及字符串大小写转换的方法有 4个：
     - toLowerCase()
     - toLocaleLowerCase()
     - toUpperCase()
     - toLocaleUpperCase()

   ```
   var stringValue = "hello world"; 
   alert(stringValue.toLocaleUpperCase());  //"HELLO WORLD" 
   alert(stringValue.toUpperCase());        //"HELLO WORLD" 
   alert(stringValue.toLocaleLowerCase());  //"hello world" 
   alert(stringValue.toLowerCase());        //"hello world" 
   ```

6. **字符串的模式匹配方法**

   - String 类型定义了几个用于在字符串中匹配模式的方法
   - 第一个方法就是 match()，在字符串上 调用这个方法，本质上与调用 RegExp 的 exec()方法相同。match()方法只接受一个参数，要么是一 个正则表达式，要么是一个 RegExp 对象

   ```javascript
   var text = "cat, bat, sat, fat";  
   var pattern = /.at/; 
    
   //与 pattern.exec(text)相同 
   var matches = text.match(pattern);         
   alert(matches.index);            //0 
   alert(matches[0]);                //"cat" 
   alert(pattern.lastIndex);         //0 
   ```

   

































***

### 3、7单体内置对象

#### 3、7、1eval（）方法

- eval() 方法就像是一个完整的 ECMAScript解析器，它只接受一个参数，即要执行的 ECMAScript（或 JavaScript） 字符串

  `eval("alert('hi')"); `
   这行代码的作用等价于下面这行代码： 

  `alert("hi");`

***

## 4、基础

### 4、1对象

- JavaScript的对象是一种无序的集合数据类型，它由若干键值对组成。

  JavaScript的对象用于描述现实世界中的某个对象。例如，为了描述“小明”这个淘气的小朋友，我们可以用若干键值对来描述他：

  ```javascript
  var xiaoming = {
      name: '小明',
      birth: 1990,
      school: 'No.1 Middle School',
      height: 1.70,
      weight: 65,
      score: null
  };
  ```

- JavaScript用一个`{...}`表示一个对象，键值对以`xxx: xxx`形式申明，用`,`隔开。注意，最后一个键值对不需要在末尾加`,`，如果加了，有的浏览器（如低版本的IE）将报错

- 上述对象申明了一个`name`属性，值是`'小明'`，`birth`属性，值是`1990`，以及其他一些属性。最后，把这个对象赋值给变量`xiaoming`后，就可以通过变量`xiaoming`来获取小明的属性了：

  ```
  xiaoming.name; // '小明'
  xiaoming.birth; // 1990
  ```

- 访问属性是通过`.`操作符完成的，但这要求属性名必须是一个有效的变量名。如果属性名包含特殊字符，就必须用`''`括起来：

  ```
  var xiaohong = {
      name: '小红',
      'middle-school': 'No.1 Middle School'
  };
  ```

  `xiaohong`的属性名`middle-school`不是一个有效的变量，就需要用`''`括起来。访问这个属性也无法使用`.`操作符，必须用`['xxx']`来访问：

  ```
  xiaohong['middle-school']; // 'No.1 Middle School'
  xiaohong['name']; // '小红'
  xiaohong.name; // '小红'
  ```

- 如果访问一个不存在的属性会返回什么呢？JavaScript规定，访问不存在的属性不报错，而是返回`undefined`：

  ```
  'use strict'; 
  var xiaoming = {    
  	name: '小明' 
  };
  ```

- 由于JavaScript的对象是动态类型，你可以自由地给一个对象添加或删除属性：

  ```
  var xiaoming = {
      name: '小明'
  };
  xiaoming.age; // undefined
  xiaoming.age = 18; // 新增一个age属性
  xiaoming.age; // 18
  delete xiaoming.age; // 删除age属性
  xiaoming.age; // undefined
  delete xiaoming['name']; // 删除name属性
  xiaoming.name; // undefined
  delete xiaoming.school; // 删除一个不存在的school属性也不会报错
  ```

- 如果我们要检测`xiaoming`是否拥有某一属性，可以用`in`操作符：

  ```
  var xiaoming = {
      name: '小明',
      birth: 1990,
      school: 'No.1 Middle School',
      height: 1.70,
      weight: 65,
      score: null
  };
  'name' in xiaoming; // true
  'grade' in xiaoming; // false
  ```

- 要判断一个属性是否是`xiaoming`自身拥有的，而不是继承得到的，可以用`hasOwnProperty()`方法：

  ```
  var xiaoming = {
      name: '小明'
  };
  xiaoming.hasOwnProperty('name'); // true
  xiaoming.hasOwnProperty('toString'); // false
  ```

***

### 4、2Map

- `Map`是一组键值对的结构，具有极快的查找速度

- 初始化`Map`需要一个二维数组，或者直接初始化一个空`Map`。`Map`具有以下方法：

  ```javascript
  var m = new Map(); // 空Map
  m.set('Adam', 67); // 添加新的key-value
  m.set('Bob', 59);
  m.has('Adam'); // 是否存在key 'Adam': true
  m.get('Adam'); // 67
  m.delete('Adam'); // 删除key 'Adam'
  m.get('Adam'); // undefined
  ```

- **Set**

  `Set`和`Map`类似，也是一组key的集合，但不存储value。由于key不能重复，所以，在`Set`中，没有重复的key。

  要创建一个`Set`，需要提供一个`Array`作为输入，或者直接创建一个空`Set`：

  ```
  var s1 = new Set(); // 空Set
  var s2 = new Set([1, 2, 3]); // 含1, 2, 3
  ```

- 通过`add(key)`方法可以添加元素到`Set`中，可以重复添加，但不会有效果：

  ```
  s.add(4);
  s; // Set {1, 2, 3, 4}
  s.add(4);
  s; // 仍然是 Set {1, 2, 3, 4}
  ```

- 通过`delete(key)`方法可以删除元素：

  ```
  var s = new Set([1, 2, 3]);
  s; // Set {1, 2, 3}
  s.delete(3);
  s; // Set {1, 2}
  ```

***

- 遍历`Array`可以采用下标循环，遍历`Map`和`Set`就无法使用下标。为了统一集合类型，ES6标准引入了新的`iterable`类型，`Array`、`Map`和`Set`都属于`iterable`类型。

- 具有`iterable`类型的集合可以通过新的`for ... of`循环来遍历。

- 用`for ... of`循环遍历集合，用法如下：

  ```
  var a = ['A', 'B', 'C'];
  var s = new Set(['A', 'B', 'C']);
  var m = new Map([[1, 'x'], [2, 'y'], [3, 'z']]);
  for (var x of a) { // 遍历Array
      console.log(x);
  }
  for (var x of s) { // 遍历Set
      console.log(x);
  }
  for (var x of m) { // 遍历Map
      console.log(x[0] + '=' + x[1]);
  }
  ```

***

### 4、3函数的定义和调用

- 在JavaScript中，定义函数的方式如下：

  ```
  function abs(x) {
      if (x >= 0) {
          return x;
      } else {
          return -x;
      }
  }
  ```

- 如果没有`return`语句，函数执行完毕后也会返回结果，只是结果为`undefined`。

  由于JavaScript的函数也是一个对象，上述定义的`abs()`函数实际上是一个函数对象，而函数名`abs`可以视为指向该函数的变量。

  因此，第二种定义函数的方式如下：

  ```
  var abs = function (x) {
      if (x >= 0) {
          return x;
      } else {
          return -x;
      }
  };
  ```

- 上述两种定义*完全等价*，**注意第二种方式按照完整语法需要在函数体末尾加一个`;`，表示赋值语句结束**

***

-  **arguments**

  JavaScript还有一个免费赠送的关键字`arguments`，它只在函数内部起作用，并且永远指向当前函数的调用者传入的所有参数。

```
function foo(x) {
    console.log('x = ' + x); // 10
    for (var i=0; i<arguments.length; i++) {
        console.log('arg ' + i + ' = ' + arguments[i]); // 10, 20, 30
    }
}
foo(10, 20, 30);
```

- 利用`arguments`，你可以获得调用者传入的所有参数。也就是说，即使函数不定义任何参数，还是可以拿到参数的值

***

- ES6标准引入了**rest参数**，上面的函数可以改写为：

```
function foo(a, b, ...rest) {
    console.log('a = ' + a);
    console.log('b = ' + b);
    console.log(rest);
}

foo(1, 2, 3, 4, 5);
// 结果:
// a = 1
// b = 2
// Array [ 3, 4, 5 ]

foo(1);
// 结果:
// a = 1
// b = undefined
// Array []
```

- return语句

如果把return语句拆成两行：

```
function foo() {
    return
        { name: 'foo' };
}

foo(); // undefined
```

*要小心了*，由于JavaScript引擎在行末自动添加分号的机制，上面的代码实际上变成了：

```
function foo() {
    return; // 自动添加了分号，相当于return undefined;
        { name: 'foo' }; // 这行语句已经没法执行到了
}
```

所以正确的多行写法是：

```
function foo() {
    return { // 这里不会自动加分号，因为{表示语句尚未结束
        name: 'foo'
    };
}
```

***

### 4、4generate

- generator跟函数很像，定义如下：

```
function* foo(x) {
    yield x + 1;
    yield x + 2;
    return x + 3;
}
```

- generator和函数不同的是，generator由`function*`定义（注意多出的`*`号），并且，除了`return`语句，还可以用`yield`返回多次。

- 调用generator对象有两个方法，一是不断地调用generator对象的`next()`方法：

  ```
  var f = fib(5);
  f.next(); // {value: 0, done: false}
  f.next(); // {value: 1, done: false}
  f.next(); // {value: 1, done: false}
  f.next(); // {value: 2, done: false}
  f.next(); // {value: 3, done: false}
  f.next(); // {value: undefined, done: true}
  ```

- `next()`方法会执行generator的代码，然后，每次遇到`yield x;`就返回一个对象`{value: x, done: true/false}`，然后“暂停”

***

### 4、5json

- ### 序列化

  让我们先把小明这个对象序列化成JSON格式的字符串：

  ```javascript
  'use strict'; 
  var xiaoming = {    
      name: '小明',    
      age: 14,    
      gender: true,    
      height: 1.65,    
      grade: null,    
      'middle-school': '\"W3C\" Middle School',    
      skills: ['JavaScript', 'Java', 'Python', 'Lisp'] 
  };
  ```

```javascript
var s = JSON.stringify(xiaoming);
console.log(s);
```

要输出得好看一些，可以加上参数，按缩进输出：

```javascript
JSON.stringify(xiaoming, null, '  ');
```

***

### 4、6浏览器对象

- **window**

  `window`对象不但充当全局作用域，而且表示浏览器窗口。

  `window`对象有`innerWidth`和`innerHeight`属性，可以获取浏览器窗口的内部宽度和高度。内部宽高是指除去菜单栏、工具栏、边框等占位元素后，用于显示网页的净宽高

- **navigator**

  `navigator`对象表示浏览器的信息，最常用的属性包括：

  - navigator.appName：浏览器名称；
  - navigator.appVersion：浏览器版本；
  - navigator.language：浏览器设置的语言；
  - navigator.platform：操作系统类型；
  - navigator.userAgent：浏览器设定的`User-Agent`字符串

- **screen**

  `screen`对象表示屏幕的信息，常用的属性有：

  - screen.width：屏幕宽度，以像素为单位；
  - screen.height：屏幕高度，以像素为单位；
  - screen.colorDepth：返回颜色位数，如8、16、24

- **location**

  `location`对象表示当前页面的URL信息。例如，一个完整的URL：

  ```
  http://www.example.com:8080/path/index.html?a=1&b=2#TOP
  ```

  可以用`location.href`获取。要获得URL各个部分的值，可以这么写：

  ```
  location.protocol; // 'http'
  location.host; // 'www.example.com'
  location.port; // '8080'
  location.pathname; // '/path/index.html'
  location.search; // '?a=1&b=2'
  location.hash; // 'TOP'
  ```

### 4、7操作表单

- HTML表单的输入控件主要有以下几种：
  - 文本框，对应的`<input type="text">`，用于输入文本；
  - 口令框，对应的`<input type="password">`，用于输入口令；
  - 单选框，对应的`<input type="radio">`，用于选择一项；
  - 复选框，对应的`<input type="checkbox">`，用于选择多项；
  - 下拉框，对应的`<select>`，用于选择一项；
  - 隐藏文本，对应的`<input type="hidden">`，用户不可见，但表单提交时会把隐藏文本发送到服务器。

- **HTML5控件**

  HTML5新增了大量标准控件，常用的包括`date`、`datetime`、`datetime-local`、`color`等，它们都使用`<input>`标签：

  ```
  <input type="date" value="2015-07-01">
  ```

***

### 4、8操作文件

- 在HTML表单中，可以上传文件的唯一控件就是`<input type="file">`。

  *注意*：当一个表单包含`<input type="file">`时，表单的`enctype`必须指定为`multipart/form-data`，`method`必须指定为`post`，浏览器才能正确编码并以`multipart/form-data`格式发送表单的数据。













## 10、DOM

### 10、1**HTML DOM 改变 HTML 内容**

- **改变 HTML 内容**

  修改 HTML 内容的最简单的方法是使用 **innerHTML 属性**。

  如需改变 HTML 元素的内容，请使用这个语法：

  `document.getElementById(*id*).innerHTML=*new HTML`*

```html
<html>
<body>

<p id="p1">Hello World!</p>

<script>
document.getElementById("p1").innerHTML="New text!";
</script>

</body>
</html>
```

实例讲解：

- 下面的 HTML 文档含有 id="header" 的 <h1> 元素
- 我们使用 HTML DOM 来获得 id="header" 的元素
- JavaScript 更改此元素的内容 (innerHTML)

```html
<h1 id="header">Old Header</h1>

<script>
var element=document.getElementById("header");
element.innerHTML="New Header";
</script>
```

- **改变 HTML 属性**

如需改变 HTML 元素的属性，请使用这个语法：

document.getElementById(*id*).*attribute=new value*

本例改变了 <img> 元素的 src 属性：

```html
<img id="image" src="smiley.gif">

<script>
document.getElementById("image").src="landscape.jpg";
</script>
```

- 上面的 HTML 文档含有 id="image" 的 <img> 元素
- 我们使用 HTML DOM 来获得 id="image" 的元素
- JavaScript 更改此元素的属性（把 "smiley.gif" 改为 "landscape.jpg"）

***

### 10、2**HTML DOM 改变 CSS**

- **改变 HTML 样式**

  如需改变 HTML 元素的样式，请使用这个语法：    

  `document.getElementById(id).style.property=new style    `

  下面的例子会改变 <p> 元素的样式：

```html
<p id="p2">Hello World!</p> 

<script> 
document.getElementById("p2").style.color="blue"; 
</script> 

<p>The paragraph above was changed by a script.</p> 
```

- 本例改变了 id="id1" 的 HTML 元素的样式，当用户点击按钮时：

```html
<h1 id="id1">My Heading 1</h1> 
<button type="button" 
onclick="document.getElementById('id1').style.color='red'"> 
Click Me!</button> 
```

- 隐藏文本

```html
<p id="p1">这是一个文本。。</p>
<input type="button" value="隐藏文本" onclick="document.getElementById('p1').style.visibility='hidden'" />
<input type="button" value="显示文本" onclick="document.getElementById('p1').style.visibility='visible'" />
```

### 10、3**HTML DOM 事件**

- **对事件做出反应**

  我们可以在事件发生时执行 JavaScript，比如当用户在 HTML 元素上点击时。

  如需在用户点击某个元素时执行代码，请向一个 HTML 事件属性添加 JavaScript 代码：

`onclick=JavaScript`

- HTML 事件的例子：
  - 当用户点击鼠标时
  - 当网页已加载时
  - 当图像已加载时
  - 当鼠标移动到元素上时
  - 当输入字段被改变时
  - 当提交 HTML 表单时
  - 当用户触发按键时

```html
<body> 
<h1 onclick="this.innerHTML='Ooops!'">点击文本!</h1> 
</body> 
```

- 本例从事件处理器调用一个函数：

```html
<html> 
<head> 
<script> 
function changetext(id) 
{ 
id.innerHTML="Ooops!"; 
} 
</script> 
</head> 
<body> 
<h1 onclick="changetext(this)">Click on this text!</h1> 
</body> 
</html>
```

- **HTML 事件属性**

  如需向 HTML 元素分配 事件，您可以使用事件属性

```html
向 button 元素分配 onclick 事件：
<button onclick="displayDate()">点我</button>

<script>
function displayDate()
{
	document.getElementById("demo").innerHTML=Date();
}
</script>
<p id="demo"></p>
```

- **onchange 事件**

  onchange 事件常结合对输入字段的验证来使用。

  下面是一个如何使用 onchange 的例子。当用户改变输入字段的内容时，会调用 upperCase() 函数。

```html
<html>
<head>
<meta charset="utf-8">
<title>W3Cschool教程(w3cschool.cn)</title>
</head>
<head>
<script>
function myFunction(){
	var x=document.getElementById("fname");
	x.value=x.value.toUpperCase();
}
</script>
</head>
<body>

输入你的名字: <input type="text" id="fname" onchange="myFunction()">
<p>当你离开输入框后，函数将被触发，将小写字母转为大写字母。</p>

</body>
</html>
```

- **onmouseover 和 onmouseout 事件**

  onmouseover 和 onmouseout 事件可用于在用户的鼠标移至 HTML 元素上方或移出元素时触发函数。

```html
<html>
<head>
<meta charset="utf-8">
<title>W3Cschool教程(w3cschool.cn)</title>
</head>
<body>

<div onmouseover="mOver(this)" onmouseout="mOut(this)" style="background-color:#D94A38;width:120px;height:20px;padding:40px;">Mouse Over Me</div>
<script>
function mOver(obj){
	obj.innerHTML="Thank You"
}
function mOut(obj){
	obj.innerHTML="Mouse Over Me"
}
</script>

</body>
</html>
```

- onmousedown和onmouseup事件

```html
<head>
<script>
function lighton(){
	document.getElementById('myimage').src="/statics/images/course/pic_bulbon.gif";
}
function lightoff(){
	document.getElementById('myimage').src="/statics/images/course/pic_bulboff.gif";
}
</script>
</head>

<body>
<img id="myimage" onmousedown="lighton()" onmouseup="lightoff()" src="/statics/images/course/pic_bulboff.gif" width="100" height="180" />
<p>点击不释放鼠标灯将一直亮着!</p>
```

- onfocus事件

```html
<head>
<meta charset="utf-8">
<title>W3Cschool教程(w3cschool.cn)</title>
<script>
function myFunction(x){
	x.style.background="yellow";
}
</script>
</head>
<body>

输入你的名字: <input type="text" onfocus="myFunction(this)">
<p>当输入框获取焦点时，修改背景色（background-color属性） 将被触发。</p>
```

***

### 10、4**HTML DOM EventListener**

- addEventListener() 方法

当用户点击按钮时触发监听事件：

`document.getElementById("myBtn").addEventListener("click", displayDate);`

### 10、5**HTML DOM 元素**

- 创建新的 HTML 元素

  在文档对象模型 (DOM) 中，每个节点都是一个对象。DOM 节点有三个重要的属性，分别是：

  1. nodeName : 节点的名称
  2. nodeValue ：节点的值
  3. nodeType ：节点的类型

```html
<div id="div1">
<p id="p1">This is a paragraph.</p>
<p id="p2">This is another paragraph.</p>
</div>

<script>
var para=document.createElement("p");
var node=document.createTextNode("This is new.");
para.appendChild(node);

var element=document.getElementById("div1");
element.appendChild(para);
</script>
```

- 这段代码创建新的<p> 元素：

  ` var para=document.createElement("p");`

  如需向 <p> 元素添加文本，您必须首先创建文本节点。这段代码创建了一个文本节点： 

  ` var node=document.createTextNode("This is a new paragraph.");`

  然后您必须向 <p> 元素追加这个文本节点：

   `para.appendChild(node);`

  最后您必须向一个已有的元素追加这个新元素。 

  这段代码找到一个已有的元素：

  ` var element=document.getElementById("div1");`

  以下代码在已存在的元素后添加新元素：

   `element.appendChild(para);`

- **删除已有的 HTML 元素**

  以下代码将已有的元素删除：

```html
<div id="div1">
<p id="p1">This is a paragraph.</p>
<p id="p2">This is another paragraph.</p>
</div>
<script>
var parent=document.getElementById("div1");
var child=document.getElementById("p1");
parent.removeChild(child);
</script>
```

- 这个 HTML 文档含有拥有两个子节点（两个 <p> 元素）的 <div> 元素：

   <div id="div1"> <p id="p1">This is a paragraph.</p> <p id="p2">This is another paragraph.</p> </div>

  找到 id="div1" 的元素：

   `var parent=document.getElementById("div1");`

  找到 id="p1" 的 <p> 元素：

   `var child=document.getElementById("p1");`

  从父元素中删除子元素：

   `parent.removeChild(child);`