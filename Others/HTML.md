# **Hypertext Markup Language**

***

### 1、1 begin with  html

```html
<p>My cat is very grumpy</p>
```

- **The opening tag:** This consists of the name of the element (in this case, p), wrapped in opening and closing **angle brackets**. This states where the element begins or starts to take effect

- **The closing tag:** This is the same as the opening tag, except that it includes a forward slash before the element name. This states where the element ends

- **The content:** This is the content of the element, which in this case is just text.

- **The element:** The opening tag plus the closing tag plus the content equals the element.

***

### 1、2 Nesting elements

```html
<p>My cat is <strong>very</strong> grumpy.</p>
```

- Elements can be placed within other elements too — this is called **nesting**

- If we wanted to state that our cat is **very** grumpy, we could wrap the word "very" in a <strong>element

***

### 1、3 Block versus inline elements（块与内联元素）

- Block-level elements form a visible block on a page — they will appear on a new line from whatever content went before it, and any content that goes after it will also appear on a new line。

  > **A block-level element wouldn't be nested inside an inline element**, but it might be nested inside another block-level element.

- Inline elements are those that are contained within block-level elements and surround only small parts of the document’s content, not entire paragraphs and groupings of content.

```html
<em>first</em><em>second</em><em>third</em>

<p>fourth</p><p>fifth</p><p>sixth</p>
```

输出如下：

```
firstsecondthird 
fourth
fifth
sixth
```

- **< em >** is an inline element, so as you can see below, the first three elements sit on the same line as one another with no space in between.

- < p >  is a block-level element, so each element appears on a new line, with space above and below each

***

### 1、4Empty elements

- Some elements consist only of a single tag, which is usually used to insert/embed something in the document at the place it is included.

```html
<img src="https://raw.githubusercontent.com/mdn/beginner-html-site/gh-pages/images/firefox-icon.png">
```

<img src="https://raw.githubusercontent.com/mdn/beginner-html-site/gh-pages/images/firefox-icon.png">

### 1、5**Attributes**

- An attribute should have:

  

  - A space between it and the element name (or the previous attribute, if the element already has one or more attributes).
  - The attribute name, followed by an equal sign.
  - An attribute value, with opening and closing quote marks wrapped around it.

>- **href**: This attribute's value specifies the web address that you want the link to point to; where the browser navigates to when the link is clicked. For example, `href="https://www.mozilla.org/"`.
>- **title**: The `title` attribute specifies extra information about the link, such as what page is being linked to. For example, `title="The Mozilla homepage"`. This will appear as a tooltip when the element is hovered over.
>- **target**: The `target` attribute specifies the browsing context that will be used to display the link. For example, `target="_blank"` will display the link in a new tab. If you want to display the link in the current tab, just omit this attribute.

```
属性例子 1:
<h1> 定义标题的开始。
<h1 align="center"> 拥有关于对齐方式的附加信息。
```

```html
属性例子 2:
<body> 定义 HTML 文档的主体。
<body bgcolor="yellow"> 拥有关于背景颜色的附加信息。
```

```html
属性例子 3:
<table> 定义 HTML 表格。（您将在稍后的章节学习到更多有关 HTML 表格的内容）
<table border="1"> 拥有关于表格边框的附加信息。
```

- #### 始终为属性值加引号

  属性值应该始终被包括在引号内。双引号是最常用的，不过使用单引号也没有问题。

  在某些个别的情况下，比如属性值本身就含有双引号，那么您必须使用单引号，例如：

```
name='Bill "HelloWorld" Gates'
```

| 属性  | 值                 | 描述                                     |
| ----- | ------------------ | ---------------------------------------- |
| class | *classname*        | 规定元素的类名（classname）              |
| id    | *id*               | 规定元素的唯一 id                        |
| style | *style_definition* | 规定元素的行内样式（inline style）       |
| title | *text*             | 规定元素的额外信息（可在工具提示中显示） |

***

### 1、6HTML标题

- 标题（Heading）是通过 <h1> - <h6> 等标签进行定义的。

  ```html
  <h1> 定义最大的标题。<h6> 定义最小的标题。
  ```

  请确保将 HTML heading 标签只用于标题。不要仅仅是为了产生粗体或大号的文本而使用标题

  搜索引擎使用标题为您的网页的结构和内容编制索引。

  因为用户可以通过标题来快速浏览您的网页，所以用标题来呈现文档结构是很重要的。

  应该将 h1 用作主标题（最重要的），其后是 h2（次重要的），再其次是 h3，以此类推。

- ```html
  <hr /> 标签在 HTML 页面中创建水平线。
  ```

<hr /> 

**HTML注释**

可以将注释插入 HTML 代码中，这样可以提高其可读性，使代码更易被人理解。浏览器会忽略注释，也不会显示它们。

注释是这样写的：

```html
<!-- This is a comment -->
```

- **注释：**开始括号之后（左边的括号）需要紧跟一个叹号，结束括号之前（右边的括号）不需要。

- **HTML 提示 - 如何查看源代码**

  您一定曾经在看到某个网页时惊叹道 “WOW! 这是如何实现的？”

  如果您想找到其中的奥秘，只需要单击右键，然后选择“查看源文件”（IE）或“查看页面源代码”（Firefox），其他浏览器的做法也是类似的。这么做会打开一个包含页面 HTML 代码的窗口。

| 标签    | 描述         |
| :------ | :----------- |
| <html>  | 定义文档     |
| <body>  | 定义文档主体 |
| <h1>    | 定义HTML标题 |
| <hr/>   | 定义水平线   |
| <! - -> | 定义注释     |

***

### 1、7HTML段落

- 段落是通过 <p> 标签定义的。

- 浏览器会自动地在段落的前后添加空行。（<p> 是块级元素）

```
提示：使用空的段落标记 <p></p> 去插入一个空行是个坏习惯。用 <br /> 标签代替它！
```

- **HTML 折行**

  如果您希望在不产生一个新段落的情况下进行换行（新行），请使用 < br /> 标签：

```html
<p>This is<br />a para<br />graph with line breaks</p>
```

<p>This is<br />a para<br />graph with line breaks</p>

> **当显示页面时，浏览器会移除源代码中多余的空格和空行。所有连续的空格或空行都会被算作一个空格。需要注意的是，HTML 代码中的所有连续的空行（换行）也被显示为一个空格。**

```html
<p>
这个段落
在源代码中
包含许多行
但是浏览器
忽略了它们。
</p>

<p>
这个段落
在源代码       中
包含   许多行
但是      浏览器
忽略了  它们。
</p>

<p>
段落的行数依赖于浏览器窗口的大小。如果调节浏览器窗口的大小，将改变段落中的行数。
</p>

</body>
</html>
```

显示如下：

```
这个段落 在源代码中 包含许多行 但是浏览器 忽略了它们。 
这个段落 在源代码 中 包含 许多行 但是 浏览器 忽略了 它们。 
段落的行数依赖于浏览器窗口的大小。如果调节浏览器窗口的大小，将改变段落中的行数。 
```

***

### 1、8HTML样式

- **背景颜色**

```html
<html>

<body style="background-color:yellow">
<h2 style="background-color:red">This is a heading</h2>
<p style="background-color:green">This is a paragraph.</p>
</body>

</html>
```

- **字体、颜色和尺寸**

  **font-family、color 以及 font-size** 属性分别定义元素中文本的字体系列、颜色和字体尺寸：

```html
<html>

<body>
<h1 style="font-family:verdana">A heading</h1>
<p style="font-family:arial;color:red;font-size:20px;">A paragraph.</p>
</body>

</html>
```

- **文本对齐**

text-align 属性规定了元素中文本的水平对齐方式

```html
<html>

<body>
<h1 style="text-align:center">This is a heading</h1>
<p>The heading above is aligned to the center of this page.</p>
</body>

</html>
```

***

### 1、9HTML文本格式化

```html
<html>

<body>

<b>This text is bold</b>

<strong>This text is strong</strong>

<big>This text is big</big>

<em>This text is emphasized</em>

<i>This text is italic</i>

<small>This text is small</small>

This text contains
<sub>subscript</sub>

This text contains
<sup>superscript</sup>

</body>
</html>
```

<b>This text is bold</b>

<strong>This text is strong</strong>

<big>This text is big</big>

<em>This text is emphasized</em>

<i>This text is italic</i>

<small>This text is small</small>

This text contains<sub>subscript</sub>

This text contains<sup>superscript</sup>

***

```html
<pre>
这是
预格式文本。
它保留了      空格
和换行。
</pre>
```

- **pre 标签很适合显示计算机代码**

> <code> 元素不保留多余的空格和折行,
>
> 如需解决该问题，您必须在 <pre> 元素中包围代码：

```html
<code>Computer code</code>
<br />
<kbd>Keyboard input</kbd>
<br />
<tt>Teletype text</tt>
<br />
<samp>Sample text</samp>
<br />
<var>Computer variable</var>
<br />
```

- **地址**

此元素一般以斜体显示：

```html
<address>
Written by <a href="mailto:webmaster@example.com">Donald Duck</a>.<br> 
Visit us at:<br>
Example.com<br>
Box 564, Disneyland<br>
USA
</address>
```

- <address>
  Written by <a href="mailto:webmaster@example.com">Donald Duck</a>.<br> 
  Visit us at:<br>
  Example.com<br>
  Box 564, Disneyland<br>
  USA
  </address>

- **缩写和首字母缩写**

```html
<abbr title="etcetera">etc.</abbr>
<br />
<acronym title="World Wide Web">WWW</acronym>
```

- **文字方向**

```html
<p>
如果您的浏览器支持 bi-directional override (bdo)，下一行会从右向左输出 (rtl)；
</p>

<bdo dir="rtl">
Here is some Hebrew text
</bdo>
```

如下所示：
<bdo dir="rtl">
Here is some Hebrew text

- **块引用**

```html
这是长的引用：
<blockquote>
这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。这是长的引用。
</blockquote>

这是短的引用：
<q>
这是短的引用。
</q>
```

- 使用 blockquote 元素的话，浏览器会插入换行和外边距，而 q 元素不会有任何特殊的呈现。

***

- **删除和下划线效果**

```html
<p>一打有 <del>二十</del> <ins>十二</ins> 件。</p>

<p>大多数浏览器会改写为删除文本和下划线文本。</p>

<p>一些老式的浏览器会把删除文本和下划线文本显示为普通文本。</p>
```

***

| 标签     | 描述           |
| :------- | :------------- |
| <b>      | 定义粗体文本。 |
| <big>    | 定义大号字。   |
| <em>     | 定义着重文字。 |
| <i>      | 定义斜体字。   |
| <small>  | 定义小号字。   |
| <strong> | 定义加重语气。 |
| <sup>    | 定义下标字。   |
| <sub>    | 定义上标字。   |
| <ins>    | 定义插入字。   |
| <del>    | 定义删除字。   |

***

| 标签         | 描述               |
| :----------- | :----------------- |
| <abbr>       | 定义缩写。         |
| <acronym>    | 定义首字母缩写。   |
| <adress>     | 定义地址。         |
| <bdo>        | 定义文字方向。     |
| <blockquote> | 定义长的引用。     |
| <q>          | 定义短的引用语。   |
| <cite>       | 定义引用、引证。   |
| <dfn>        | 定义一个定义项目。 |

- <abbr>缩写

```html
<p><abbr title="World Health Organization">WHO</abbr> 成立于 1948 年。</p>
```

-  如果设置了 <dfn> 元素的 title 属性，则定义项目：

```html
<p><dfn title="World Health Organization">WHO</dfn> 成立于 1948 年。</p>
```

-  如果 <dfn> 元素包含具有标题的 <abbr> 元素，则 title 定义项目：

```html
<p><dfn><abbr title="World Health Organization">WHO</abbr></dfn> 成立于 1948 年。</p>
```

-  否则，<dfn> 文本内容即是项目，并且父元素包含定义。

```html
<p><dfn>WHO</dfn> World Health Organization 成立于 1948 年。</p>
```

***

- HTML元素定义著作的标题。

  浏览器通常会以斜体显示 <cite> 元素。

```html
<p><cite>The Scream</cite> by Edward Munch. Painted in 1893.</p>
```

***

- 文字返向

```html
<bdo dir="rtl">This text will be written from right to left</bdo>
```

***

-  <var>*元素定义*数学变量*：

```html
<p>Einstein wrote:</p>

<p><var>E = m c<sup>2</sup></var></p>
```

***

### 1、10HTML链接

- 创建超级链接

```html
<a href="/index.html">本文本</a> 是一个指向本网站中的一个页面的链接。</p>

<p><a href="http://www.microsoft.com/">本文本</a> 是一个指向万维网上的页面的链接。</p>
```

> href 属性规定链接的目标。

> 开始标签和结束标签之间的文字被作为超级链接来显示。

- 将图像作为链接

```html
<a href="/example/html/lastpage.html">
<img border="0" src="/i/eg_buttonnext.gif" />
</a>
```

> 有两种使用 <a> 标签的方式：

1. 通过使用 href 属性 - 创建指向另一个文档的链接
2. 通过使用 name 属性 - 创建文档内的书签

- **target属性**

使用 Target 属性，你可以定义被链接的文档在何处显示。

下面的这行会在新窗口打开文档：

```html
<a href="http://www.w3school.com.cn/" target="_blank">Visit W3School!</a>
```

***

- **name 属性**

>name 属性规定锚（anchor）的名称。
>
>您可以使用 name 属性创建 HTML 页面中的书签。
>
>书签不会以任何特殊方式显示，它对读者是不可见的。
>
>当使用命名锚（named anchors）时，我们可以创建直接跳至该命名锚（比如页面中某个小节）的链接，这样使用者就无需不停地滚动页面来寻找他们需要的信息了。

命名锚的方法：

```html
<a name="label">锚（显示在页面上的文本）</a>
```

- 锚的名称可以是任何你喜欢的名字
- 您可以使用 id 属性来替代 name 属性，命名锚同样有效。

**实例**

首先，我们在 HTML 文档中对锚进行命名（创建一个书签）：

```html
<a name="tips">基本的注意事项 - 有用的提示</a>
```

然后，我们在同一个文档中创建指向该锚的链接：

```html
<a href="#tips">有用的提示</a>
```

您也可以在其他页面中创建指向该锚的链接：

```html
<a href="http://www.w3school.com.cn/html/html_links.asp#tips">有用的提示</a>
```

在上面的代码中，我们将 # 符号和锚名称添加到 URL 的末端，就可以直接链接到 tips 这个命名锚了。

***

### 1、11HTML图像

- **图像标签（<img>）和源属性（Src）**

  - 在 HTML 中，图像由 <img> 标签定义。

  - <img> 是空标签，意思是说，它只包含属性，并且没有闭合标签

  - 要在页面上显示图像，你需要使用源属性（src）

  - src 指 "source"。源属性的值是图像的 URL 地址。

    定义图像的语法是：

```html
<img src="url" />
```

- URL 指存储图像的位置。如果名为 "boat.gif" 的图像位于 www.w3school.com.cn 的 images 目录中，那么其 URL 为 http://www.w3school.com.cn/images/boat.gif。

***

- **替换文本属性（Alt）**

alt 属性用来为图像定义一串预备的可替换的文本。替换文本属性的值是用户定义的。

```html
<img src="boat.gif" alt="Big Boat">
```

> 在浏览器无法载入图像时，替换文本属性告诉读者她们失去的信息。
>
> 此时，浏览器将显示这个替代性的文本而不是图像。
>
> 为页面上的图像都加上替换文本属性是个好习惯，这样有助于更好的显示信息，
>
> 并且对于那些使用纯文本浏览器的人来说是非常有用的。

**实例**

- 背景图片(如果图像小于页面，图像会进行重复)

```html
<body background="/i/eg_background.jpg">
```

- 排列图片

```html
未设置对齐方式的图像:
<p>图像 <img src ="/i/eg_cute.gif"> 在文本中</p>

已设置对齐方式的图像：
<p>图像 <img src="/i/eg_cute.gif" align="bottom"> 在文本中</p>
<p>图像 <img src ="/i/eg_cute.gif" align="middle"> 在文本中</p>
<p>图像 <img src ="/i/eg_cute.gif" align="top"> 在文本中</p>

请注意，bottom 对齐方式是默认的对齐方式
```

- 浮动图片

```html
<img src ="/i/eg_cute.gif" align ="left"> 
带有图像的一个段落。图像的 align 属性设置为 "left"。图像将浮动到文本的左侧。
</p>

<p>
<img src ="/i/eg_cute.gif" align ="right"> 
带有图像的一个段落。图像的 align 属性设置为 "right"。图像将浮动到文本的右侧。
</p>
```

- 调整图像尺寸

```html
<img src="/i/eg_mouse.jpg" width="50" height="50">

<img src="/i/eg_mouse.jpg" width="100" height="100">

<img src="/i/eg_mouse.jpg" width="200" height="200">

通过改变 img 标签的 "height" 和 "width" 属性的值，您可以放大或缩小图像。
```

- 为图片显示替换文本

```html
<img src="/i/eg_goleft.gif" alt="向左转" />
```

- 图像链接

```html
<a href="/example/html/lastpage.html">
<img border="0" src="/i/eg_buttonnext.gif" />
</a>
```

- 创建图像映射

> 本例显示如何创建带有可供点击区域的图像地图。其中的每个区域都是一个超级链接。

```html
<img
src="/i/eg_planets.jpg"
border="0" usemap="#planetmap"
alt="Planets" />

<map name="planetmap" id="planetmap">

<area
shape="circle"      <!定义链接形状>
coords="180,139,14"  <!确定圆心的位置>
href ="/example/html/venus.html"
target ="_blank"
alt="Venus" />

<area
shape="circle"
coords="129,161,10"
href ="/example/html/mercur.html"
target ="_blank"
alt="Mercury" />
```

注：img 元素中的 "usemap" 属性引用 map 元素中的 "id" 或 "name" 属性（根据浏览器），所以我们同时向 map 元素添加了 "id" 和 "name" 属性。

***

### 1、12HTML表格

- 表格由 <table> 标签来定义。每个表格均有若干行（由 <tr> 标签定义），每行被分割为若干单元格（由 <td> 标签定义）。字母 td 指表格数据（table data），即数据单元格的内容。数据单元格可以包含文本、图片、列表、段落、表单、水平线、表格等等。

```html
<table border="1">
<tr>
<td>row 1, cell 1</td>
<td>row 1, cell 2</td>
</tr>
<tr>
<td>row 2, cell 1</td>
<td>row 2, cell 2</td>
</tr>
</table>
```

<table border="1"> <tr> <td>row 1, cell 1</td> <td>row 1, cell 2</td> </tr> <tr> <td>row 2, cell 1</td> <td>row 2, cell 2</td> </tr> </table>

- border属性改变表格边框的大小

***

- **表格的表头**

  > 表格的表头使用 <th> 标签进行定义。
  >
  > 大多数浏览器会把表头显示为粗体居中的文本：

```html
<table border="1">
<tr>
<th>Heading</th>
<th>Another Heading</th>
</tr>
<tr>
<td>row 1, cell 1</td>
<td>row 1, cell 2</td>
</tr>
<tr>
<td>row 2, cell 1</td>
<td>row 2, cell 2</td>
</tr>
</table>
```

<table border="1"> <tr><caption>practise</caption> <th>Heading</th> <th>Another Heading</th> </tr> <tr> <td>row 1, cell 1</td> <td>row 1, cell 2</td> </tr> <tr> <td>row 2, cell 1</td> <td>row 2, cell 2</td> </tr> </table>

***

| 表格       | 描述                   |
| :--------- | :--------------------- |
| <table>    | 定义表格               |
| <caption>  | 定义表格标题。         |
| <th>       | 定义表格的表头。       |
| <tr>       | 定义表格的行。         |
| <td>       | 定义表格单元。         |
| <thead>    | 定义表格的页眉。       |
| <tbody>    | 定义表格的主体。       |
| <tfoot>    | 定义表格的页脚。       |
| <col>      | 定义用于表格列的属性。 |
| <colgroup> | 定义表格列的组。       |

- 跨行或列的单元格

```html
<table border="1">
<tr>
  <th>姓名</th>
  <th colspan="2">电话</th>
</tr>
<tr>
  <td>Bill Gates</td>
  <td>555 77 854</td>
  <td>555 77 855</td>
</tr>
</table>
```

<table border="1">
<tr>
  <th>姓名</th>
  <th colspan="2">电话</th>
</tr>
<tr>
  <td>Bill Gates</td>
  <td>555 77 854</td>
  <td>555 77 855</td>
</tr>
</table>
***

```html
 <th rowspan="2">电话</th>
```

<h6>横跨两行的单元格：</h6>
<table border="1">
<tr>
  <th>姓名</th>
  <td>Bill Gates</td>
</tr>
<tr>
  <th rowspan="2">电话</th>
  <td>555 77 854</td>
</tr>
<tr>
  <td>555 77 855</td>
</tr>
</table>
***

- 单元格边距

```html
<table border="1" 
cellpadding="10">  <!通过cellpadding控制单元格边距>
```

- 单元格间距

```html
<table border="1" 
cellspacing="10">
```

- 单元格背景或图像

```html
<table border="1" 
bgcolor="red">

<table border="1" 
background="/i/eg_bg_07.gif">
```

***

### 1、13HTML列表

- **无序列表**

  无序列表是一个项目的列表，此列项目使用粗体圆点（典型的小黑圆圈）进行标记。

  无序列表始于 <ul> 标签。每个列表项始于 <li>。

```html
<ul>
<li>Coffee</li>
<li>Milk</li>
</ul>
```

<ul> <li>Coffee</li> <li>Milk</li> </ul>

***

- **有序列表**
- 同样，有序列表也是一列项目，列表项目使用数字进行标记。
- 有序列表始于 <ol> 标签。每个列表项始于 <li> 标签。

```html
<ol>
<li>Coffee</li>
<li>Milk</li>
</ol>
```

<ol> <li>Coffee</li> <li>Milk</li> </ol>

- **定义列表**

  > 自定义列表不仅仅是一列项目，而是项目及其注释的组合
  >
  > 自定义列表以 <dl> 标签开始。每个自定义列表项以 <dt> 开始。每个自定义列表项的定义以 <dd> 开始。

```html
<dl>
<dt>Coffee</dt>
<dd>Black hot drink</dd>
<dt>Milk</dt>
<dd>White cold drink</dd>
</dl>
```



<dl> <dt>Coffee</dt> <dd>Black hot drink</dd> <dt>Milk</dt> <dd>White cold drink</dd> </dl>

***

- 不同类型 的无序列表

```html
<ul type="disc">
<ul type="circle">
<ul type="square">
```

分别为

- disc
  - circle
    - square

***

- 不同类型的有序列表

```html
<ol type="A">
<ol type="a">
<ol type="I">
<ol type="i">
```

***

### 1、14HTML类

- **分类块级元素**

> HTML <div> 元素是*块级元素*。它能够用作其他 HTML 元素的容器。
>
> 设置 <div> 元素的类，使我们能够为相同的 <div> 元素设置相同的类

```html
<head>
<style>
.cities {
    background-color:black;
    color:white;
    margin:20px;
    padding:20px;
}	
</style>
</head>

<div class="cities">
<h2>London</h2>

<p>London is the capital city of England. It is the most populous city in the United Kingdom, with a metropolitan area of over 13 million inhabitants.</p>

<p>Standing on the River Thames, London has been a major settlement for two millennia, its history going back to its founding by the Romans, who named it Londinium.</p>
</div> 
```

***

- **分类行内元素**

  > HTML <span> 元素是行内元素，能够用作文本的容器。
  >
  > 设置 <span> 元素的类，能够为相同的 <span> 元素设置相同的样式。

```html
<head>
<style>
span.red {
    color:red;
}
</style>
</head>

<h1>我的<span class="red">重要的</span>标题</h1>
```

***

### 1、15HTML布局

- **使用 <div> 元素的 HTML 布局**

  > **注释：**<div> 元素常用作布局工具，因为能够轻松地通过 CSS 对其进行定位。
  >
  > 这个例子使用了四个 <div> 元素来创建多列布局：

```html
<head>
<style>
#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}
#nav {
    line-height:30px;
    background-color:#eeeeee;
    height:300px;
    width:100px;
    float:left;
    padding:5px;	      
}
#section {
    width:350px;
    float:left;
    padding:10px;	 	 
}
#footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
   padding:5px;	 	 
}
</style>
</head>

<body>

<div id="header">
<h1>City Gallery</h1>
</div>

<div id="nav">
London<br>
Paris<br>
Tokyo<br>
</div>

<div id="section">
<h2>London</h2>
<p>
London is the capital city of England. It is the most populous city in the United Kingdom,
with a metropolitan area of over 13 million inhabitants.
</p>
<p>
Standing on the River Thames, London has been a major settlement for two millennia,
its history going back to its founding by the Romans, who named it Londinium.
</p>
</div>

<div id="footer">
Copyright ? W3Schools.com
</div>
```

***

**HTML5 语义元素**

| 语义元素 |                                |
| -------- | ------------------------------ |
| header   | 定义文档或节的页眉             |
| nav      | 定义导航链接的容器             |
| section  | 定义文档中的节                 |
| article  | 定义独立的自包含文章           |
| aside    | 定义内容之外的内容（比如侧栏） |
| footer   | 定义文档或节的页脚             |
| details  | 定义额外的细节                 |
| summary  | 定义 details 元素的标题        |

***

### 1、16**HTML 响应式 Web 设计**

**什么是响应式 Web 设计？**

- RWD 指的是响应式 Web 设计（Responsive Web Design）
- RWD 能够以可变尺寸传递网页
- RWD 对于平板和移动设备是必需的

**使用 Bootstrap**

- 另一个创建响应式设计的方法，是使用现成的 CSS 框架。
- Bootstrap 是最流行的开发响应式 web 的 HTML, CSS, 和 JS 框架。
- Bootstrap 帮助您开发在任何尺寸都外观出众的站点：显示器、笔记本电脑、平板电脑或手机：

***

### 1、17**HTML Iframe**

- 添加Iframe的语法

```html
<iframe src="URL"></iframe>
```

- 设定窗口的宽度和高度

> height 和 width 属性用于规定 iframe 的高度和宽度。
>
> 属性值的默认单位是像素，但也可以用百分比来设定（比如 "80%"）。

```html
<iframe src="demo_iframe.htm" width="200" height="200"></iframe>
```

- 删除边框

  > frameborder 属性规定是否显示 iframe 周围的边框。
  >
  > 设置属性值为 "0" 就可以移除边框：

```html
<iframe src="demo_iframe.htm" frameborder="0"></iframe>
```

- **使用 iframe 作为链接的目标**

> iframe 可用作链接的目标（target）。
>
> 链接的 target 属性必须引用 iframe 的 name 属性：

```html
<iframe src="demo_iframe.htm" name="iframe_a"></iframe>
<p><a href="http://www.w3school.com.cn" target="iframe_a">W3School.com.cn</a></p>
```

> **注释**：由于链接的目标匹配 iframe 的名称，所以链接会在 iframe 中打开。

***

### 1、18HTML背景

- 背景颜色**bgcolor**

> 背景颜色属性将背景设置为某种颜色。属性值可以是十六进制数、RGB 值或颜色名。

```
<body bgcolor="#000000">
<body bgcolor="rgb(0,0,0)">
<body bgcolor="black">
```

- **背景（Background）**

> 背景属性将背景设置为图像。属性值为图像的URL。如果图像尺寸小于浏览器窗口，那么图像将在整个浏览器窗口进行复制

```
<body background="clouds.gif">
<body background="http://www.w3school.com.cn/clouds.gif">
```

URL可以是相对地址，如第一行代码。也可以使绝对地址，如第二行代码。

***

### 1、19HTML文件路径

| 路径                            | 描述                                         |
| :------------------------------ | :------------------------------------------- |
| <img src="picture.jpg">         | picture.jpg 位于与当前网页相同的文件夹       |
| <img src="images/picture.jpg">  | picture.jpg 位于当前文件夹的 images 文件夹中 |
| <img src="/images/picture.jpg"> | picture.jpg 当前站点根目录的 images 文件夹中 |
| <img src="../picture.jpg">      | picture.jpg 位于当前文件夹的上一级文件夹中   |

***

### 1、20HTML头部

- **HTML <head> 元素**

  ```
  <head> 元素是所有头部元素的容器。<head> 内的元素可包含脚本，指示浏览器在何处可以找到样式表，提供元信息，等等。以下标签都可以添加到 head 部分：<title>、<base>、<link>、<meta>、<script> 以及 <style>。
  ```

- title元素

> < title > 标签定义文档的标题。
>
> title 元素在所有 HTML/XHTML 文档中都是必需的。
>
> title 元素能够：
>
> - 定义浏览器工具栏中的标题
> - 提供页面被添加到收藏夹时显示的标题
> - 显示在搜索引擎结果中的页面标题

```html
<html>
    
<head>
<title>Title of the document</title>
</head>

<body>
The content of the document......
</body>

</html>
```

- base元素

```html
<base> 标签为页面上的所有链接规定默认地址或默认目标（target）：
<head>
<base href="http://www.w3school.com.cn/images/" />
<base target="_blank" />
</head>
```

- link元素

> <link> 标签定义文档与外部资源之间的关系。
>
> <link> 标签最常用于连接样式表：

```html
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css" />
</head>
```

- style元素

>< style > 标签用于为 HTML 文档定义样式信息。
>您可以在 style 元素内规定 HTML 元素在浏览器中呈现的样式：

```html
<head>
<style type="text/css">
body {background-color:yellow}
p {color:blue}
</style>
</head>
```

- meta元素

> 元数据（metadata）是关于数据的信息。
>
> < meta > 标签提供关于 HTML 文档的元数据。元数据不会显示在页面上，但是对于机器是可读的。
>
> 典型的情况是，meta 元素被用于规定**页面的描述、关键词、文档的作者、最后修改时间**以及其他元数据。
>
> < meta > 标签始终位于 head 元素中。
>
> 元数据可用于浏览器（如何显示内容或重新加载页面），搜索引擎（关键词），或其他 web 服务。



一些搜索引擎会利用 meta 元素的 name 和 content 属性来索引您的页面。

- 下面的 meta 元素定义页面的描述：

```html
<meta name="description" content="Free Web tutorials on HTML, CSS, XML" />
```

- 下面的 meta 元素定义页面的关键词：

```html
<meta name="keywords" content="HTML, CSS, XML" />
```

***

### 1、21HTML实体

- **HTML 中的预留字符必须被替换为字符实体。**

在 HTML 中，某些字符是预留的。

在 HTML 中不能使用小于号（<）和大于号（>），这是因为浏览器会误认为它们是标签。

如果希望正确地显示预留字符，我们必须在 HTML 源代码中使用字符实体（character entities）。

字符实体类似这样：

```
&entity_name;

或者

&#entity_number;

如需显示小于号，我们必须这样写：&lt; 或 &#60;
```

- 不间断空格

HTML 中的常用字符实体**是不间断空格(\&nbsp;)**。

浏览器总是会截短 HTML 页面中的空格。如果您在文本中写 10 个空格，在显示该页面之前，浏览器会删除它们中的 9 个。如需在页面中增加空格的数量，您需要使用 \&nbsp; 字符实体。

***

### 1、22HTML URL

遵守一下规则

```
scheme://host.domain:port/path/filename
```

- scheme - 定义因特网服务的类型。最常见的类型是 http
- host - 定义域主机（http 的默认主机是 www）
- domain - 定义因特网域名，比如 w3school.com.cn
- :port - 定义主机上的端口号（http 的默认端口号是 80）
- path - 定义服务器上的路径（如果省略，则文档必须位于网站的根目录中）。
- filename - 定义文档/资源的名称

| Scheme | 访问               | 用于...                             |
| :----- | :----------------- | :---------------------------------- |
| http   | 超文本传输协议     | 以 http:// 开头的普通网页。不加密。 |
| https  | 安全超文本传输协议 | 安全网页。加密所有信息交换。        |
| ftp    | 文件传输协议       | 用于将文件下载或上传至网站。        |
| file   |                    | 您计算机上的文件。                  |