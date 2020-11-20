# Python网络爬虫

## 2.复杂HTML解析

### 2.1 利用CSS属性

```python
from urllib.request import urlopen
from bs4 import BeautifulSoup
html = urlopen("http://www.pythonscraping.com/pages/warandpeace.html")
bsObj = BeautifulSoup(html)

```

- 通过 BeautifulSoup 对象，我们可以用 findAll 函数抽取只包含在 

  <span class="green"></span> 标签里的文字，这样就会得到一个人物名称的 Python 列表

  - findAll 是一个非常灵活的函数，我们后面会经常用到它

- 调用 **`bsObj.findAll(tagName, tagAttributes)`** 可以获取页面中所有指定的标签
- 获取人名列表之后，程序遍历列表中所有的名字，然后打印 name.get_text()，就可以把标签中的内容分开显示了

>.get_text() 会把你正在处理的 HTML 文档中所有的标签都清除，然后返回一个只包含文字的字符串。假如你正在处理一个包含许多超链接、段落和标签的大段源代码，那么 .get_text() 会把这些超链接、段落和标签都清除掉，只剩下一串不带标签的文字

#### 2.2.1 BeautifulSoup的find()和findAll()

- 这两个函数非常相似，BeautifulSoup 文档里两者的定义就是这样：

  ```
  findAll(tag, attributes, recursive, text, limit, keywords)
  find(tag, attributes, recursive, text, keywords)
  ```

>递归参数 recursive 是一个布尔变量。你想抓取 HTML 文档标签结构里多少层的信息？如果recursive 设置为 True，findAll 就会根据你的要求去查找标签参数的所有子标签，以及子标签的子标签。如果 recursive 设置为 False，findAll 就只查找文档的一级标签。findAll默认是支持递归查找的（recursive 默认值是 True）；一般情况下这个参数不需要设置，除非你真正了解自己需要哪些信息，而且抓取速度非常重要，那时你可以设置递归参数

- 文本参数 text 有点不同，它是用标签的文本内容去匹配，而不是用标签的属性。
- 假如我们想查找前面网页中包含“the prince”内容的标签数量，我们可以把之前的 findAll 方法换成下面的代码

```
nameList = bsObj.findAll(text="the prince")
print(len(nameList))
```

- 还有一个关键词参数 keyword，可以让你选择那些具有指定属性的标签

```
allText = bsObj.findAll(id="text")
print(allText[0].get_text())
```

#### 2.2.3 导航树

- 用虚拟的在线购物网站 http://www.pythonscraping.com/pages/page3.html 作为要抓取的示例网页，演示 HTML 导航树的纵向和横向导航

1. 处理子标签和其他后代标签

- 标签就是一个父标签的下一级，而后代标签是指一个父标签下面所有级别的标签

> 如果你只想找出子标签，可以用 .children 标签：

```python
from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen("http://www.pythonscraping.com/pages/page3.html")
bsObj = BeautifulSoup(html)
for child in bsObj.find("table",{"id":"giftList"}).children:
	print(child)
```

2. 处理兄弟标签

```python
from urllib.request import urlopen
from bs4 import BeautifulSoup
html = urlopen("http://www.pythonscraping.com/pages/page3.html")
bsObj = BeautifulSoup(html)
for sibling in bsObj.find("table",{"id":"giftList"}).tr.next_siblings:
	print(sibling)
```

- 选择标签行然后调用 next_siblings，可以选择表格中除了标题行以外的所有行

### 2.3 正则表达式

(1) 字母“a”至少出现一次；
(2) 后面跟着字母“b”重复 5 次；
(3) 后面再跟字母“c”重复任意偶数次；
(4) 最后一位是字母“d”，也可以没有。

- 满足上面规则的字符串有：“aaaabbbbbccccd”“aabbbbbcc”等（有无穷多种变化）。
- 正则表达式就是表达这组规则的缩写。
- 这组规则的正则表达式如下所示：
  aa\*bbbbb(cc)*(d | )
  - **aa***
    a 后面跟着的 a\*（读作 a 星）表示“重复任意次 a，包括 0 次。这样就可以保证字母 a至少出现一次。
  -  **bbbbb**
    这没有什么特别的——就是 5 次 b
  -  **(cc)***
    任意偶数个字符都可以编组，这个规则是用括号两个 c，然后后面跟一个星号，表示有任意次两个 c（也可以是 0 次）
  - **(d|)**
    增加一个竖线（|）在表达式里表示“这个或那个”。本例是表示“增加一个后面跟着空格的 d，或者只有一个空格”。这样我们可以保证字符串的结尾最多是一个后面跟着空格的 d
- 正则表达式在实际中的一个经典应用是识别邮箱地址。虽然不同邮箱服务器的邮箱地址的具体规则不尽相同，但是我们还是可以创建几条通用规则

|                             规则                             |                          正则表达式                          |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
| 1. 邮箱地址的第一部分至少包括一种内容：大写字母、小写字母、数字 0~9、点号（.）、加号（+）或下划线（_） | [A-Z a-z 0-9\\ . _ +] + ：这个正则表达式简写非常智慧。例如，它用“A-Z”表示“任意 A~Z 的大写字母”。**把所有可能的序列和符号放在中括号（不是小括号）里表示“括号中的符号里任何一个”**。要注意后面的加号，它表示“这些符号都可以出现多次，且至少出现1 次” |
|              2. 之后，邮箱地址会包含一个 @ 符号              |  @：这个符号很直接。@ 符号必须出现在中间位置，有且仅有 1 次  |
|  3. 在符合 @ 之后，邮箱地址还必须至少包含一个大写或小写字母  | [A-Z a-z]+：可能只在域名的前半部分、符号 @ 后面用字母。<br>而且，至少有一个字母 |
|                    4. 之后跟一个点号（.）                    |               \\.：在域名前必须有一个点号（.）               |
|       5. 最 后 邮 箱 地 址 用 com、org、edu、net 结 尾       | (com\|org\|edu\|net)这样列出了邮箱地址中可能出现在<br/>点号之后的字母序列 |

- 把上面的规则连接起来，就获得了完整的正则表达式：
  `[A-Z a-z 0-9\._+]+@[A-Z a-z]+\.(com|org|edu|net)`

![img](file:///C:\Users\13793\AppData\Roaming\Tencent\Users\1379338142\QQ\WinTemp\RichOle\Q2M1FKKRHIK$45@`_FJA{3B.png)

***

### 2.4 正则表达式和BeautifulSoup

- 在抓取网页的时候，BeautifulSoup 和正则表达式总是配合使用的。其实，大多数支持字符串参数的函数（比如，find(id="aTagIdHere")）都可以用正则表达式实现
- 让我们看几个例子，待抓取的网页是 http://www.pythonscraping.com/pages/page3.html
- 注意观察网页上有几个商品图片——它们的源代码形式如下：
- `<img src="../img/gifts/img3.jpg">`
- 非常直接的做法就是用 findAll("img") 抓取所有图片，但是，有个问题。除了那些明显“多余的”图片（比如，LOGO）之外，新式的网站里都有一些隐藏图片，用于网页布局留白和元素对齐的空白图片，以及一些不容
  易察觉到的图片标签。总之，你不能仅用商品图片来统计网页上所有的图片
- 解决这类问题的办法，就是直接定位那些标签来查找信息。在本例中，我们直接通过商品图片的文件路径来查找

```python
from urllib.request import urlopen
from bs4 import BeautifulSoup
import re
html = urlopen("http://www.pythonscraping.com/pages/page3.html")
bsObj = BeautifulSoup(html)
images = bsObj.findAll("img",{"src":re.compile("\.\.\/img\/gifts/img.*\.jpg")})
for image in images:
    print(image["src"])
```

- 正则表达式可以作为 BeautifulSoup 语句的任意一个参数，让你的目标元素查找工作极具灵活性***

***

### 2.5 获取属性

- 在网络数据采集时你经常不需要查找标签的内容，而是需要查找标签属性。比如标签 \<a> 指向的 URL 链接包含在 href 属性中，或者 \<img> 标签的图片文件包含在 src 属性中，这时获取标签属性就变得非常有用了

- 对于一个标签对象，可以用下面的代码获取它的全部属性：
  `myTag.attrs`
- 要注意这行代码返回的是一个 Python 字典对象，可以获取和操作这些属性。比如要获取图片的资源位置 src，可以用下面这行代码：
  `myImgTag.attrs["src"]`

***

### 2.6 Lambda表达式

- Lambda 表达式本质上就是一个函数，可以作为其他函数的变量使用；也就是说，一个函数不是定义成 f(x, y)，而是定义成 f(g(x), y)，或 f(g(x), h(x)) 的形式

- BeautifulSoup 允许我们把特定函数类型当作 findAll 函数的参数。

  - 唯一的限制条件是这些函数必须把一个标签作为参数且返回结果是布尔类型
  - BeautifulSoup 用这个函数来评估它遇到的每个标签对象，最后把评估结果为“真”的标签保留，把其他标签剔除

- 下面的代码就是获取有两个属性的标签：
  `soup.findAll(lambda tag: len(tag.attrs) == 2)`
  这行代码会找出下面的标签：

  `<div class="body" id="content"></div>`

  `<span style="color:red" class="title"></span>`

***

## 3.开始采集

- 之所以叫网络爬虫（Web crawler）是因为它们可以沿着网络爬行。它们的本质就是一种递归方式。为了找到 URL 链接，它们必须首先获取网页内容，检查这个页面的内容，再寻找另一个 URL，然后获取 URL 对应的网页内容，不断循环这一过程

***

### 3.1 遍历单个域名

- 