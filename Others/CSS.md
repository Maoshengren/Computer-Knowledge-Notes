---
 typora-root-url: pictures
---

<img src="C:\Users\13793\Desktop\学习笔记\pictures\E9[4F2`3I63[K}`_W~YQX{O.png">



# CSS学习笔记

### 1、1CSS背景

- **背景色**

  > 可以使用 **background-color** 属性为元素设置背景色。这个属性接受任何合法的颜色值。
  >
  > 这条规则把元素的背景设置为灰色：
  >
  > ```
  > p {background-color: gray;}
  > ```
  >
  > 如果您希望背景色从元素中的文本向外少有延伸，只需增加一些内边距：
  >
  > ```
  > p {background-color: gray; padding: 20px;}
  > ```

**background-color 不能继承**，其默认值是 transparent。transparent 有“透明”之意。也就是说，如果一个元素没有指定背景色，那么背景就是透明的，这样其祖先元素的背景才能可见。

***

- **背景图像**

> 要把图像放入背景，需要使用 **background-image 属性**。background-image 属性的默认值是 none，表示背景上没有放置任何图像

- 如果需要设置一个背景图像，必须为这个属性设置一个 URL 值：

```
body {background-image: url(/i/eg_bg_04.gif);}
```

> 大多数背景都应用到 body 元素，不过并不仅限于此。

- 下面例子为一个段落应用了一个背景，而不会对文档的其他部分应用背景：

```
p.flower {background-image: url(/i/eg_bg_03.gif);}
```

- 您甚至可以为行内元素设置背景图像，下面的例子为一个链接设置了背景图像：

```
a.radio {background-image: url(/i/eg_bg_07.gif);}
```

***

- **背景重复**

> 如果需要在页面上对背景图像进行平铺，可以使用  background-repeat 属性

- 属性值 repeat 导致图像在水平垂直方向上都平铺，就像以往背景图像的通常做法一样。
- repeat-x 和 repeat-y 分别导致图像只在水平或垂直方向上重复，no-repeat 则不允许图像在任何方向上平铺。
- 默认地，背景图像将从一个元素的左上角开始。请看下面的例子：

```
body
  { 
  background-image: url(/i/eg_bg_03.gif);
  background-repeat: repeat-y;
  }
```

***

- **背景定位**

> 可以利用 **background-position** 属性改变图像在背景中的位置。

下面的例子在 body 元素中将一个背景图像居中放置：

```
body
  { 
    background-image:url('/i/eg_bg_03.gif');
    background-repeat:no-repeat;
    background-position:center;
  }
```

> 为 background-position 属性提供值有很多方法。
>
> - 首先，可以使用一些关键字：top、bottom、left、right 和 center。
> - 通常，这些关键字会成对出现，不过也不总是这样。
> - 还可以使用长度值，如 100px 或 5cm，最后也可以使用百分数值。
> - 不同类型的值对于背景图像的放置稍有差异。

- **关键字**

  > - 图像放置关键字最容易理解，其作用如其名称所表明的。例如，top right 使图像放置在元素内边距区的右上角。
  >
  > - 根据规范，位置关键字可以按任何顺序出现，只要保证不超过两个关键字 - 一个对应水平方向，另一个对应垂直方向。
  >
  > - 如果只出现一个关键字，则认为另一个关键字是 center

| 单一关键字 | 等价的关键字                   |
| :--------- | :----------------------------- |
| center     | center center                  |
| top        | top center 或 center top       |
| bottom     | bottom center 或 center bottom |
| right      | right center 或 center right   |
| left       | left center 或 center left     |

***

- **长度值**

  > 长度值解释的是元素内边距区左上角的偏移。偏移点是图像的左上角。

  比如，如果设置值为 50px 100px，图像的左上角将在元素内边距区左上角向右 50 像素、向下 100 像素的位置上：

  ```
  body
    { 
      background-image:url('/i/eg_bg_03.gif');
      background-repeat:no-repeat;
      background-position:50px 100px;
    }
  ```

***

- **百分数值**

  > 百分数值的表现方式更为复杂。假设你希望用百分数值将图像在其元素中居中，这很容易：

  ```
  body
    { 
      background-image:url('/i/eg_bg_03.gif');
      background-repeat:no-repeat;
      background-position:50% 50%;
    }
  ```

  > 这会导致图像适当放置，其中心与其元素的中心对齐。**换句话说，百分数值同时应用于元素和图像。**也就是说，图像中描述为 50% 50% 的点（中心点）与元素中描述为 50% 50% 的点（中心点）对齐。

***

- **背景关联**

  > 如果文档比较长，那么当文档向下滚动时，背景图像也会随之滚动。当文档滚动到超过图像的位置时，图像就会消失。

  您可以通过 **background-attachment** 属性防止这种滚动。通过这个属性，可以声明图像相对于可视区是固定的（fixed），因此不会受到滚动的影响：

  ```
  body 
    {
    background-image:url(/i/eg_bg_02.gif);
    background-repeat:no-repeat;
    background-attachment:fixed
    }
  ```

> background-attachment 属性的默认值是 scroll，也就是说，在默认的情况下，背景会随文档滚动。

***

**CSS 背景属性**

| 属性                    | 描述                                         |
| :---------------------- | :------------------------------------------- |
| [background](           | 简写属性，作用是将背景属性设置在一个声明中。 |
| [background-attachment] | 背景图像是否固定或者随着页面的其余部分滚动。 |
| [background-color]      | 设置元素的背景颜色。                         |
| [background-image]      | 把图像设置为背景。                           |
| [background-position]   | 设置背景图像的起始位置。                     |
| [background-repeat]     | 设置背景图像是否及如何重复。                 |

***

### 1、2CSS文本

- 通过使用 text-indent 属性，所有元素的第一行都可以缩进一个给定的长度，甚至该长度可以是负值。

  这个属性最常见的用途是将段落的首行缩进，下面的规则会使所有段落的首行缩进 5 em：

```html
p {text-indent: 5em;}
```

***

- **使用负值**

text-indent 还可以设置为负值。利用这种技术，可以实现很多有趣的效果，比如“悬挂缩进”，即第一行悬挂在元素中余下部分的左边：

```
p {text-indent: -5em;}
```

不过在为 text-indent 设置负值时要当心，如果对一个段落设置了负值，那么首行的某些文本可能会超出浏览器窗口的左边界。为了避免出现这种显示问题，建议针对负缩进再设置一个外边距或一些内边距：

```
p {text-indent: -5em; padding-left: 5em;}
```

***

- **使用百分比值**

> text-indent 可以使用所有长度单位，包括百分比值。

百分数要相对于缩进元素父元素的宽度。换句话说，如果将缩进值设置为 20%，所影响元素的第一行会缩进其父元素宽度的 20%。

在下例中，缩进值是父元素的 20%，即 100 个像素：

```
div {width: 500px;}
p {text-indent: 20%;}

<div>
<p>this is a paragragh</p>
</div>
```

- **justify**

  > 最后一个水平对齐属性是 text-align: justify。

  在两端对齐文本中，文本行的左右两端都放在父元素的内边界上。然后，调整单词和字母间的间隔，使各行的长度恰好相等。您也许已经注意到了，两端对齐文本在打印领域很常见

***

- 字间隔

> word-spacing 属性接受一个正长度值或负长度值。如果提供一个正长度值，那么字之间的间隔就会增加。为 word-spacing 设置一个负值，会把它拉近：

```
p.spread {word-spacing: 30px;}
p.tight {word-spacing: -0.5em;}

<p class="spread">
This is a paragraph. The spaces between words will be increased.
</p>

<p class="tight">
This is a paragraph. The spaces between words will be decreased.
</p>
```

- 字母间隔

> 与 word-spacing 属性一样，letter-spacing 属性的可取值包括所有长度。默认关键字是 normal（这与 letter-spacing:0 相同）。输入的长度值会使字母之间的间隔增加或减少指定的量：

```
h1 {letter-spacing: -0.5em}
h4 {letter-spacing: 20px}

<h1>This is header 1</h1>
<h4>This is header 4</h4>
```

****

- **字符转换**

  > text-transform 属性处理文本的大小写。这个属性有 4 个值：

  - none
  - uppercase
  - lowercase
  - capitalize
    - 默认值 none 对文本不做任何改动，将使用源文档中的原有大小写。
    - 顾名思义，uppercase 和 lowercase 将文本转换为全大写和全小写字符。
    - 最后，capitalize 只对每个单词的首字母大写。

  作为一个属性，text-transform 可能无关紧要，不过如果您突然决定把所有 h1 元素变为大写，这个属性就很有用。不必单独地修改所有 h1 元素的内容，只需使用 text-transform 为你完成这个修改：

  ```
  h1 {text-transform: uppercase}
  ```

***

- **文本装饰**

text-decoration 有 5 个值：

- none
- underline
- overline
- line-through
- blink

> 不出所料，underline 会对元素加下划线，就像 HTML 中的 U 元素一样。
>
> overline 的作用恰好相反，会在文本的顶端画一个上划线。
>
> 值 line-through 则在文本中间画一个贯穿线，等价于 HTML 中的 S 和 strike 元素。
>
> blink 会让文本闪烁，类似于 Netscape 支持的颇招非议的 blink 标记。

none 值会关闭原本应用到一个元素上的所有装饰。通常，无装饰的文本是默认外观，但也不总是这样。例如，链接默认地会有下划线。如果您希望去掉超链接的下划线，可以使用以下 CSS 来做到这一点：

```
a {text-decoration: none;}
```

-  **值 pre-wrap 和 pre-line**

> CSS2.1 引入了值 pre-wrap 和 pre-line，这在以前版本的 CSS 中是没有的。这些值的作用是允许创作人员更好地控制空白符处理。
>
> 如果元素的 white-space 设置为 pre-wrap，那么该元素中的文本会保留空白符序列，但是文本行会正常地换行。
>
> 如果设置为这个值，源文本中的行分隔符以及生成的行分隔符也会保留。
>
> pre-line 与 pre-wrap 相反，会像正常文本中一样合并空白符序列，但保留换行符。

- 下面的表格总结了 white-space 属性的行为：

| 值       | 空白符 | 换行符 | 自动换行 |
| :------- | :----- | :----- | :------- |
| pre-line | 合并   | 保留   | 允许     |
| normal   | 合并   | 忽略   | 允许     |
| nowrap   | 合并   | 忽略   | 不允许   |
| pre      | 保留   | 保留   | 不允许   |
| pre-wrap | 保留   | 保留   | 允许     |

***

- **文本方向**

> direction 属性影响块级元素中文本的书写方向、表中列布局的方向、内容水平填充其元素框的方向、以及两端对齐元素中最后一行的位置。

**注释：**对于行内元素，只有当 unicode-bidi 属性设置为 embed  或 bidi-override 时才会应用 direction 属性。

- direction 属性有两个值：ltr 和 rtl。大多数情况下，默认值是 ltr，显示从左到右的文本。如果显示从右到左的文本，应使用值 rtl。

***

**CSS 文本属性**

| 属性              | 描述                                                        |
| :---------------- | :---------------------------------------------------------- |
| [color]           | 设置文本颜色                                                |
| [direction]       | 设置文本方向。                                              |
| [line-height]     | 设置行高。                                                  |
| [letter-spacing]  | 设置字符间距。                                              |
| [text-align]      | 对齐元素中的文本。                                          |
| [text-decoration] | 向文本添加修饰。                                            |
| [text-indent]     | 缩进元素中文本的首行。                                      |
| text-shadow       | 设置文本阴影。CSS2 包含该属性，但是 CSS2.1 没有保留该属性。 |
| [text-transform]  | 控制元素中的字母。                                          |
| unicode-bidi      | 设置文本方向。                                              |
| [white-space]     | 设置元素中空白的处理方式。                                  |
| [word-spacing]    | 设置字间距。                                                |

***

### 1、3CSS字体

- **字体加粗**

> font-weight 属性设置文本的粗细。
>
> 使用 bold 关键字可以将文本设置为粗体。
>
> - 关键字 100 ~ 900 为字体指定了 9 级加粗度。
> - 如果一个字体内置了这些加粗级别，那么这些数字就直接映射到预定义的级别，100 对应最细的字体变形，900 对应最粗的字体变形。数字 400 等价于 normal，而 700 等价于 bold。
> - 如果将元素的加粗设置为 bolder，浏览器会设置比所继承值更粗的一个字体加粗。与此相反，关键词 lighter 会导致浏览器将加粗度下移而不是上移。

```
h1 {font-size:60px;}
h2 {font-size:40px;}
p {font-size:14px;}
```

- **使用 em 来设置字体大小**

  > 如果要避免在 Internet Explorer 中无法调整文本的问题，许多开发者使用 em 单位代替 pixels。
  >
  > W3C 推荐使用 em 尺寸单位。
  >
  > - 1em 等于当前的字体尺寸。如果一个元素的 font-size 为 16 像素，那么对于该元素，1em 就等于 16 像素。在设置字体大小时，em 的值会相对于父元素的字体大小改变。
  > - 浏览器中默认的文本大小是 16 像素。因此 1em 的默认尺寸是 16 像素。

**CSS 字体属性**

| 属性             | 描述                                                         |
| :--------------- | :----------------------------------------------------------- |
| font             | 简写属性。作用是把所有针对字体的属性设置在一个声明中。       |
| font-family      | 设置字体系列。                                               |
| font-size        | 设置字体的尺寸。                                             |
| font-size-adjust | 当首选字体不可用时，对替换字体进行智能缩放。（CSS2.1 已删除该属性。） |
| font-stretch     | 对字体进行水平拉伸。（CSS2.1 已删除该属性。）                |
| font-style       | 设置字体风格。                                               |
| font-variant     | 以小型大写字体或者正常字体显示文本。                         |
| font-weight      | 设置字体的粗细。                                             |

***

### 1、4CSS链接

> 链接的四种状态：

- a:link - 普通的、未被访问的链接
- a:visited - 用户已访问的链接
- a:hover - 鼠标指针位于链接的上方
- a:active - 链接被点击的时刻

```
a:link {color:#FF0000;}		/* 未被访问的链接 */
a:visited {color:#00FF00;}	/* 已被访问的链接 */
a:hover {color:#FF00FF;}	/* 鼠标指针移动到链接上 */
a:active {color:#0000FF;}	/* 正在被点击的链接 */
```

- 文本修饰

text-decoration 属性大多用于去掉链接中的下划线：

**实例**

```
a:link {text-decoration:none;}
a:visited {text-decoration:none;}
a:hover {text-decoration:underline;}
a:active {text-decoration:underline;}
```

- **背景色**

  background-color 属性规定链接的背景色：

  **实例**

  ```
  a:link {background-color:#B2FF99;}
  a:visited {background-color:#FFFF85;}
  a:hover {background-color:#FF704D;}
  a:active {background-color:#FF704D;}
  ```

***

### 1、5CSS列表

- **列表类型**

  要影响列表的样式，最简单（同时支持最充分）的办法就是改变其标志类型。

  要修改用于列表项的标志类型，可以使用属性 **list-style-type**：

  ```
  ul {list-style-type : square}
  ```

- **列表项图像**

  有时，常规的标志是不够的。你可能想对各标志使用一个图像，这可以利用 **list-style-image** 属性做到：

  ```
  ul li {list-style-image : url(xxx.gif)}
  ```

  只需要简单地使用一个 url() 值，就可以使用图像作为标志。

- **简写列表样式**

  为简单起见，可以将以上 3 个列表样式属性合并为一个方便的属性：**list-style**，就像这样：

  ```
  li {list-style : url(example.gif) square inside}
  ```

  > list-style 的值可以按任何顺序列出，而且这些值都可以忽略。只要提供了一个值，其它的就会填入其默认值。

***

### 1、6CSS表格

- **表格边框**

  > 如需在 CSS 中设置表格边框，请使用 border 属性。

  下面的例子为 table、th 以及 td 设置了蓝色边框：

  ```
  table, th, td
    {
    border: 1px solid blue;
    }
  ```

**请注意，上例中的表格具有双线条边框。这是由于 table、th 以及 td 元素都有独立的边框。**

**如果需要把表格显示为单线条边框，请使用 border-collapse 属性。**

***

- **折叠边框**

  border-collapse 属性设置是否将表格边框折叠为单一边框：

  ```
  table
    {
    border-collapse:collapse;
    }
  
  table,th, td
    {
    border: 1px solid black;
    }
  ```

***

- **表格宽度和高度**

  通过 width 和 height 属性定义表格的宽度和高度。

  下面的例子将表格宽度设置为 100%，同时将 th 元素的高度设置为 50px：

  ```
  table
    {
    width:100%;
    }
  
  th
    {
    height:50px;
    }
  ```

***

- **表格文本对齐**

  text-align 和 vertical-align 属性设置表格中文本的对齐方式。

  > text-align 属性设置水平对齐方式，比如左对齐、右对齐或者居中：

  ```
  td
    {
    text-align:right;
    }
  ```

> vertical-align 属性设置垂直对齐方式，比如顶部对齐、底部对齐或居中对齐：

```
td
  {
  height:50px;
  vertical-align:bottom;
  }
```

***

- **表格颜色**

  下面的例子设置边框的颜色，以及 th 元素的文本和背景颜色：

  ```
  table, td, th
    {
    border:1px solid green;
    }
  
  th
    {
    background-color:green;
    color:white;
    }
  ```

**CSS Table 属性**

| 属性            | 描述                                 |
| :-------------- | :----------------------------------- |
| border-collapse | 设置是否把表格边框合并为单一的边框。 |
| border-spacing  | 设置分隔单元格边框的距离。           |
| caption-side    | 设置表格标题的位置。                 |
| empty-cells     | 设置是否显示表格中的空单元格。       |
| table-layout    | 设置显示单元、行和列的算法。         |

***

### 1、7CSS轮廓

- **轮廓（outline）是绘制于元素周围的一条线，位于边框边缘的外围，可起到突出元素的作用。**

  **CSS outline 属性规定元素轮廓的样式、颜色和宽度。**



**CSS 边框属性**

"CSS" 列的数字指示哪个 CSS 版本定义了该属性。

| 属性          | 描述                             | CSS  |
| :------------ | :------------------------------- | :--- |
| outline       | 在一个声明中设置所有的轮廓属性。 | 2    |
| outline-color | 设置轮廓的颜色。                 | 2    |
| outline-style | 设置轮廓的样式。                 | 2    |
| outline-width | 设置轮廓的宽度。                 | 2    |

```html
<style type="text/css">
p
{
border: red solid thin;
}
p.dotted {outline-style: dotted}
p.dashed {outline-style: dashed}
p.solid {outline-style: solid}
p.double {outline-style: double}
p.groove {outline-style: groove}
p.ridge {outline-style: ridge}
p.inset {outline-style: inset}
p.outset {outline-style: outset}
</style>
```



### 1、8CSS框模型

<img src="C:\Users\13793\Desktop\学习笔记\pictures\QQ图片20200302115403.png">

- 在 CSS 中，width 和 height 指的是内容区域的宽度和高度。增加内边距、边框和外边距不会影响内容区域的尺寸，但是会增加元素框的总尺寸。
- 假设框的每个边上有 10 个像素的外边距和 5 个像素的内边距。如果希望这个元素框达到 100 个像素，就需要将内容的宽度设置为 70 像素，请看下图：

<img src="C:\Users\13793\Desktop\学习笔记\pictures\QQ图片20200302115609.png">

**提示：**外边距可以是负值，而且在很多情况下都要使用负值的外边距。

***

#### 1、8、1CSS内边距

- **CSS padding 属性**

  CSS padding 属性定义元素的内边距。padding 属性接受长度值或百分比值，但不允许使用负值。

  例如，如果您希望所有 h1 元素的各边都有 10 像素的内边距，只需要这样：

  ```
  h1 {padding: 10px;}
  ```

  您还可以按照上、右、下、左的顺序分别设置各边的内边距，各边均可以使用不同的单位或百分比值：

  ```
  h1 {padding: 10px 0.25em 2ex 20%;}
  ```

- **单边内边距属性**

  也通过使用下面四个单独的属性，分别设置上、右、下、左内边距：

  - padding-top
  - padding-right
  - padding-bottom
  - padding-left

  您也许已经想到了，下面的规则实现的效果与上面的简写规则是完全相同的：

  ```
  h1 {
    padding-top: 10px;
    padding-right: 0.25em;
    padding-bottom: 2ex;
    padding-left: 20%;
    }
  ```

***

#### 1、8、2CSS边框

- 元素的边框 (border) 是围绕元素内容和内边距的一条或多条线。

  CSS border 属性允许你规定元素边框的样式、宽度和颜色。

- **边框的样式**

| 值      | 描述                                                         |
| :------ | :----------------------------------------------------------- |
| none    | 定义无边框。                                                 |
| hidden  | 与 "none" 相同。不过应用于表时除外，对于表，hidden 用于解决边框冲突。 |
| dotted  | 定义点状边框。在大多数浏览器中呈现为实线。                   |
| dashed  | 定义虚线。在大多数浏览器中呈现为实线。                       |
| solid   | 定义实线。                                                   |
| double  | 定义双线。双线的宽度等于 border-width 的值。                 |
| groove  | 定义 3D 凹槽边框。其效果取决于 border-color 的值。           |
| ridge   | 定义 3D 垄状边框。其效果取决于 border-color 的值。           |
| inset   | 定义 3D inset 边框。其效果取决于 border-color 的值。         |
| outset  | 定义 3D outset 边框。其效果取决于 border-color 的值。        |
| inherit | 规定应该从父元素继承边框样式。                               |

- **定义多种样式**

  您可以为一个边框定义多个样式，例如：

  ```
  p.aside {border-style: solid dotted dashed double;}
  ```

  > 上面这条规则为类名为 aside 的段落定义了四种边框样式：实线上边框、点线右边框、虚线下边框和一个双线左边框。



- **定义单边样式**

如果您希望为元素框的某一个边设置边框样式，而不是设置所有 4 个边的边框样式，可以使用下面的单边边框样式属性：

- border-top-style
- border-right-style
- border-bottom-style
- border-left-style

> **注意：**如果要使用第二种方法，必须把单边属性放在简写属性之后。因为如果把单边属性放在 border-style 之前，简写属性的值就会覆盖单边值 none。



- **边框的宽度**

  > 您可以通过 border-width 属性为边框指定宽度。

  为边框指定宽度有两种方法：可以指定长度值，比如 2px 或 0.1em；或者使用 3 个关键字之一，它们分别是 thin 、medium（默认值） 和 thick。

您也可以通过下列属性分别设置边框各边的宽度：

- border-top-width
- border-right-width
- border-bottom-width
- border-left-width

***

#### 1、8、3CSS外边距

- **CSS margin 属性**

设置外边距的最简单的方法就是使用 **margin 属性**。

> margin 属性接受任何长度单位，可以是像素、英寸、毫米或 em。

margin 可以设置为 auto。更常见的做法是为外边距设置长度值。下面的声明在 h1 元素的各个边上设置了 1/4 英寸宽的空白：

```
h1 {margin : 0.25in;}
```

- 下面的例子为 h1 元素的四个边分别定义了不同的外边距，所使用的长度单位是像素 (px)：

```
h1 {margin : 10px 0px 15px 5px;}
```

- 与内边距的设置相同，这些值的顺序是从上外边距 (top) 开始围着元素顺时针旋转的：

```
margin: top right bottom left
```

- 另外，还可以为 margin 设置一个百分比数值：

```
p {margin : 10%;}
```



>**值复制**

还记得吗？我们曾经在前两节中提到过值复制。下面我们为您讲解如何使用值复制。

- 有时，我们会输入一些重复的值：

```
p {margin: 0.5em 1em 0.5em 1em;}
```

- 通过值复制，您可以不必重复地键入这对数字。上面的规则与下面的规则是等价的：

```
p {margin: 0.5em 1em;}
```

这两个值可以取代前面 4 个值。这是如何做到的呢？CSS 定义了一些规则，允许为外边距指定少于 4 个值。规则如下：

- 如果缺少左外边距的值，则使用右外边距的值。
- 如果缺少下外边距的值，则使用上外边距的值。
- 如果缺少右外边距的值，则使用上外边距的值。

下图提供了更直观的方法来了解这一点：

<img src="C:\Users\13793\Desktop\学习笔记\pictures\ct_css_margin_value.gif">

***

- ## 单边外边距属性

  您可以使用单边外边距属性为元素单边上的外边距设置值。假设您希望把 p 元素的左外边距设置为 20px。不必使用 margin（需要键入很多 auto），而是可以采用以下方法：

  ```
  p {margin-left: 20px;}
  ```

  您可以使用下列任何一个属性来只设置相应上的外边距，而不会直接影响所有其他外边距：

  - margin-top
  - margin-right
  - margin-bottom
  - margin-left

  一个规则中可以使用多个这种单边属性，例如：

  ```
  h2 {
    margin-top: 20px;
    margin-right: 30px;
    margin-bottom: 30px;
    margin-left: 20px;
    }
  ```



***

#### 1、8、4CSS外边距合并

- 外边距合并指的是，当两个垂直外边距相遇时，它们将形成一个外边距。
- 合并后的外边距的高度等于两个发生合并的外边距的高度中的较大者。

<img src="C:\Users\13793\Desktop\学习笔记\pictures\QQ图片20200302165209.png" width="500">



- 当一个元素包含在另一个元素中时（假设没有内边距或边框把外边距分隔开），它们的上和/或下外边距也会发生合并。请看下图：

<img src="C:\Users\13793\Desktop\学习笔记\pictures\ct_css_margin_collapsing_example_2.gif">



- 假设有一个空元素，它有外边距，但是没有边框或填充。在这种情况下，上外边距与下外边距就碰到了一起，它们会发生合并：

<img src="C:\Users\13793\Desktop\学习笔记\pictures\ct_css_margin_collapsing_example_3.gif">

> 如果这个外边距遇到另一个元素的外边距，它还会发生合并：

<img src="C:\Users\13793\Desktop\学习笔记\pictures\ct_css_margin_collapsing_example_4.gif">

**注释：**只有普通文档流中块框的垂直外边距才会发生外边距合并。行内框、浮动框或绝对定位之间的外边距不会合并。

***

### 1、9CSS定位

- **CSS 定位机制**

  > CSS 有三种基本的定位机制：普通流、浮动和绝对定位。

  - 除非专门指定，否则所有框都在普通流中定位。也就是说，普通流中的元素的位置由元素在 (X)HTML 中的位置决定。

  - 块级框从上到下一个接一个地排列，框之间的垂直距离是由框的垂直外边距计算出来。

  ***

- **CSS position 属性**

  > 通过使用 position 属性，我们可以选择 4 种不同类型的定位，这会影响元素框生成的方式。

  position 属性值的含义：

  - **static**

    元素框正常生成。块级元素生成一个矩形框，作为文档流的一部分，行内元素则会创建一个或多个行框，置于其父元素中。

  - **relative**

    元素框偏移某个距离。元素仍保持其未定位前的形状，它原本所占的空间仍保留。

    ```
    h2.pos_left
    {
    position:relative;
    left:-20px
    }
    h2.pos_right
    {
    position:relative;
    left:20px
    }
    ```

    **相对位置会使元素框左右移动**

    ***

  - **absolute**

    元素框从文档流完全删除，并相对于其包含块定位。包含块可能是文档中的另一个元素或者是初始包含块。元素原先在正常文档流中所占的空间会关闭，就好像元素原来不存在一样。元素定位后生成一个块级框，而不论原来它在正常流中生成何种类型的框。

    ```
    h2.pos_abs
    {
    position:absolute;
    left:100px;
    top:150px
    }
    ```

    - 通过绝对定位，元素可以放置到页面上的任何位置

    - 提示：因为绝对定位的框与文档流无关，所以它们可以覆盖页面上的其它元素。
    - 可以通过设置 **z-index 属性**来控制这些框的堆放次序。

    ***

  - **fixed**

    元素框的表现类似于将 position 设置为 absolute，不过其包含块是视窗本身。

    ```
    p.one
    {
    position:fixed;
    left:5px;
    top:5px;
    }
    p.two
    {
    position:fixed;
    top:30px;
    right:5px;
    }
    ```

**CSS 定位属性**

***

CSS 定位属性允许你对元素进行定位。

| 属性           | 描述                                                         |
| :------------- | :----------------------------------------------------------- |
| position       | 把元素放置到一个静态的、相对的、绝对的、或固定的位置中。     |
| top            | 定义了一个定位元素的上外边距边界与其包含块上边界之间的偏移。 |
| right          | 定义了定位元素右外边距边界与其包含块右边界之间的偏移。       |
| bottom         | 定义了定位元素下外边距边界与其包含块下边界之间的偏移。       |
| left           | 定义了定位元素左外边距边界与其包含块左边界之间的偏移。       |
| overflow       | 设置当元素的内容溢出其区域时发生的事情。                     |
| clip           | 设置元素的形状。元素被剪入这个形状之中，然后显示出来。       |
| vertical-align | 设置元素的垂直对齐方式。                                     |
| z-index        | 设置元素的堆叠顺序。                                         |

- **使用固定值设置图像的上边缘**

```
img
{
position:absolute;
top:100px;
left:10px;
}
```

> 也可使用**百分比**设置

- 如何使用**滚动条来显示元素内溢出**的内容 **overflow** 

```html
div 
{
background-color:#00FFFF;
width:150px;
height:150px;
overflow: scroll;
}
```

- **隐藏内容** 

```
div 
{
background-color:#00FFFF;
width:150px;
height:150px;
overflow: hidden
}
```

- **自动处理**

overflow: auto

- **设置元素形状**

```
img 
{
position:absolute;
clip:rect(0px 50px 200px 0px)
}
```

- **垂直排列图像**

```
<style type="text/css">
img.top {vertical-align:text-top}
img.bottom {vertical-align:text-bottom}
</style>
```

<img src="C:\Users\13793\Desktop\学习笔记\pictures\5.png" width="300" position="left">

- **元素显示的顺序**

```
img.x
{
position:absolute;
left:0px;
top:0px;
z-index:-1
}
```

<img src="C:\Users\13793\Desktop\学习笔记\pictures\6.png">

```
img.x
{
position:absolute;
left:0px;
top:0px;
z-index:1
}
```

<img src="C:\Users\13793\Desktop\学习笔记\pictures\7.png">

***

- **CSS浮动**
  - 浮动的框可以向左或向右移动，直到它的外边缘碰到包含框或另一个浮动框的边框为止。
  - 由于浮动框不在文档的普通流中，所以文档的普通流中的块框表现得就像浮动框不存在一样。

> 请看下图，当把框 1 向右浮动时，它脱离文档流并且向右移动，直到它的右边缘碰到包含框的右边缘：

<img src="C:\Users\13793\Desktop\学习笔记\pictures\8.png" width="500">

***

> 再请看下图，当框 1 向左浮动时，它脱离文档流并且向左移动，直到它的左边缘碰到包含框的左边缘。因为它不再处于文档流中，所以它不占据空间，实际上覆盖住了框 2，使框 2 从视图中消失。

<img src="C:\Users\13793\Desktop\学习笔记\pictures\9.png" width="500">

- 如果把所有三个框都向左移动，那么框 1 向左浮动直到碰到包含框，另外两个框向左浮动直到碰到前一个浮动框。

***

> 如下图所示，如果包含框太窄，无法容纳水平排列的三个浮动元素，那么其它浮动块向下移动，直到有足够的空间。如果浮动元素的高度不同，那么当它们向下移动时可能被其它浮动元素“卡住”：

<img src="C:\Users\13793\Desktop\学习笔记\pictures\10.png " width="500">

***

- **在 CSS 中，我们通过 float 属性实现元素的浮动。**

  - **行框和清理**

    浮动框旁边的行框被缩短，从而给浮动框留出空间，行框围绕浮动框。

    因此，创建浮动框可以使文本围绕图像：

<img src="C:\Users\13793\Desktop\学习笔记\pictures\11.png" width=500>

> 要想阻止行框围绕浮动框，需要对该框应用 **clear 属性**。clear 属性的值可以是 left、right、both 或 none，它表示框的哪些边不应该挨着浮动框。

***

- 让我们更详细地看看浮动和清理。假设希望让一个图片浮动到文本块的左边，并且希望这幅图片和文本包含在另一个具有背景颜色和边框的元素中。您可能编写下面的代码：

<img src="C:\Users\13793\Desktop\学习笔记\pictures\12.png" >

**不幸的是出现了一个新的问题**，由于没有现有的元素可以应用清理，所以我们只能添加一个空元素并且清理它。

```
.news {
  background-color: gray;
  border: solid 1px black;
  }

.news img {
  float: left;
  }

.news p {
  float: right;
  }

.clear {
  clear: both;
  }

<div class="news">
<img src="news-pic.jpg" />
<p>some text</p>
<div class="clear"></div>
</div>
```

**不过我们还有另一种办法，那就是对容器 div 进行浮动：**

```
<div class="news">
```

***

### 1、10CSS选择器

- **通配符选择器**

CSS2 引入了一种新的简单选择器 - 通配选择器（universal selector），显示为一个星号（*）。该选择器可以与任何元素匹配，就像是一个通配符。

例如，下面的规则可以使文档中的每个元素都为红色：

```
* {color:red;}
```

> 这个声明等价于列出了文档中所有元素的一个分组选择器。利用通配选择器，只需敲一次键（仅一个星号）就能使文档中所有元素的 color 属性值指定为 red。

***

- **类选择器**

> 语法

我们使用以下语法向这些归类的元素应用样式，即类名前有一个点号（.），然后结合通配选择器：

```
*.important {color:red;}
```

如果您只想选择所有类名相同的元素，可以在类选择器中忽略通配选择器，这没有任何不好的影响：

```
.important {color:red;}
```

- **结合元素选择器**

类选择器可以结合元素选择器来使用。

例如，您可能希望只有段落显示为红色文本：

```
p.important {color:red;}
```

- 选择器现在会匹配 class 属性包含 important 的所有 p 元素，但是其他任何类型的元素都不匹配，不论是否有此 class 属性。
- 选择器 p.important 解释为：“其 class 属性值为 important 的所有段落”。 因为 h1 元素不是段落，这个规则的选择器与之不匹配，因此 h1 元素不会变成红色文本。
- 如果你确实希望为 h1 元素指定不同的样式，可以使用选择器 h1.important：

```
p.important {color:red;}
h1.important {color:blue;}
```

***

- **CSS 多类选择器**

  > 在 HTML 中，一个 class 值中可能包含一个词列表，各个词之间用空格分隔。
  >
  > 例如，如果希望将一个特定的元素同时标记为重要（important）和警告（warning），就可以写作：

  ```
  <p class="important warning">
  This paragraph is a very important warning.
  </p>
  ```

  这两个词的顺序无关紧要，写成 warning important 也可以。

  > 我们假设 class 为 important 的所有元素都是粗体，而 class 为 warning 的所有元素为斜体，
  >
  > class 中同时包含 important 和 warning 的所有元素还有一个银色的背景 。就可以写作：

  ```
  .important {font-weight:bold;}
  .warning {font-style:italic;}
  .important.warning {background:silver;}
  ```

***

- **CSSid选择器**
  - 语法
  - 首先，ID 选择器前面有一个 # 号 - 也称为棋盘号或井号。
  - 请看下面的规则：

```
*#intro {font-weight:bold;}
```

与类选择器一样，ID 选择器中可以忽略通配选择器。前面的例子也可以写作：

```
#intro {font-weight:bold;}
```

> 第二个区别是 ID 选择器不引用 class 属性的值，毫无疑问，它要引用 id 属性中的值。

以下是一个实际 ID 选择器的例子：

```
<p id="intro">This is a paragraph of introduction.</p>
```

***

- **区别 1：只能在文档中使用一次**

与类不同，在一个 HTML 文档中，ID 选择器会使用一次，而且仅一次。

- **区别 2：不能使用 ID 词列表**

不同于类选择器，ID 选择器不能结合使用，因为 ID 属性不允许有以空格分隔的词列表。

- **区别 3：ID 能包含更多含义**

您只知道每个文档都会有这么一个最重要的内容，它可能在任何元素中，而且只能出现一个。在这种情况下，可以编写如下规则：

> 这个规则会与以下各个元素匹配（这些元素不能在同一个文档中同时出现，因为它们都有相同的 ID 值）：

```
<h1 id="mostImportant">This is important!</h1>
<em id="mostImportant">This is important!</em>
<ul id="mostImportant">This is important!</ul>
```

注：**ID区分大小写**

- 属性选择器

**CSS 选择器参考手册**

| 选择器               | 描述                                                         |
| :------------------- | :----------------------------------------------------------- |
| [attribute]          | 用于选取带有指定属性的元素。                                 |
| [attribute=value]    | 用于选取带有指定属性和值的元素。                             |
| [attribute~=value]   | 用于选取属性值中包含指定词汇的元素。                         |
| [attribute\|=value]  | 用于选取带有以指定值开头的属性值的元素，该值必须是整个单词。 |
| [attribute^=value]   | 匹配属性值以指定值开头的每个元素。                           |
| [attribute$=value]   | 匹配属性值以指定值结尾的每个元素。                           |
| [attribute**=value*] | 匹配属性值中包含指定值的每个元素。                           |

***

- **后代选择器**

  - 根据上下文选择元素

    > 我们可以定义后代选择器来创建一些规则，使这些规则在某些文档结构中起作用，而在另外一些结构中不起作用。
    >
    > 举例来说，如果您希望只对 h1 元素中的 em 元素应用样式，可以这样写：

```
h1 em {color:red;}
```

> 上面这个规则会把作为 h1 元素后代的 em 元素的文本变为 红色。其他 em 文本（如段落或块引用中的 em）则不会被这个规则选中：

```
<h1>This is a <em>important</em> heading</h1>
<p>This is a <em>important</em> paragraph.</p>
```

***

**具体应用**

假设有一个文档，其中有一个边栏，还有一个主区。边栏的背景为蓝色，主区的背景为白色，这两个区都包含链接列表。不能把所有链接都设置为蓝色，因为这样一来边栏中的蓝色链接都无法看到。

> 解决方法是使用后代选择器。在这种情况下，可以为包含边栏的 div 指定值为 sidebar 的 class 属性，并把主区的 class 属性值设置为 maincontent。然后编写以下样式：

```
div.sidebar {background:blue;}
div.maincontent {background:white;}
div.sidebar a:link {color:white;}
div.maincontent a:link {color:blue;}
```

- 有关后代选择器有一个易被忽视的方面，即两个元素之间的层次间隔可以是无限的。
- 例如，如果写作 ul em，这个语法就会选择从 ul 元素继承的所有 em 元素，而不论 em 的嵌套层次多深。



***

- **选择相邻兄弟**

如果需要选择紧接在另一个元素后的元素，而且二者有相同的父元素，可以使用相邻兄弟选择器（Adjacent sibling selector）。

例如，如果要增加紧接在 h1 元素后出现的段落的上边距，可以这样写：

```
h1 + p {margin-top:50px;}
```

这个选择器读作：“选择紧接在 h1 元素后出现的段落，h1 和 p 元素拥有共同的父元素”。

***



### 1、11CSS伪类

- 伪类的语法：

  ```
  selector : pseudo-class {property: value}
  ```

  CSS 类也可与伪类搭配使用。

  ```
  selector.class : pseudo-class {property: value}
  ```

- **锚伪类**

> 在支持 CSS 的浏览器中，链接的不同状态都可以不同的方式显示，这些状态包括：活动状态，已被访问状态，未被访问状态，和鼠标悬停状态。

```
a:link {color: #FF0000}		/* 未访问的链接 */
a:visited {color: #00FF00}	/* 已访问的链接 */
a:hover {color: #FF00FF}	/* 鼠标移动到链接上 */
a:active {color: #0000FF}	/* 选定的链接 */
```

**提示：**在 CSS 定义中，a:hover 必须被置于 a:link 和 a:visited 之后，才是有效的。

**提示：**在 CSS 定义中，a:active 必须被置于 a:hover 之后，才是有效的。

***

- first-child 伪类

您可以使用 :first-child 伪类来选择元素的第一个子元素

```
p:first-child {font-weight: bold;}
li:first-child {text-transform:uppercase;}
```

> 第一个规则将作为某元素第一个子元素的所有 p 元素设置为粗体。第二个规则将作为某个元素（在 HTML 中，这肯定是 ol 或 ul 元素）第一个子元素的所有 li 元素变成大写。

***



### 1、12CSS伪元素

- **first-line 伪元素**

> "first-line" 伪元素用于向文本的首行设置特殊样式。
>
> 在下面的例子中，浏览器会根据 "first-line" 伪元素中的样式对 p 元素的第一行文本进行格式化：

```
p:first-line
  {
  color:#ff0000;
  font-variant:small-caps;
  }
```

**注释：**"first-line" 伪元素只能用于块级元素。

**注释：**下面的属性可应用于 "first-line" 伪元素：

- font
- color
- background
- word-spacing
- letter-spacing
- text-decoration
- vertical-align
- text-transform
- line-height
- clear

***

- **first-letter 伪元素**

  "first-letter" 伪元素用于向文本的首字母设置特殊样式：

  ```
  p:first-letter
    {
    color:#ff0000;
    font-size:xx-large;
    }
  ```

**注释：**"first-letter" 伪元素只能用于块级元素。

**注释：**下面的属性可应用于 "first-letter" 伪元素：

- font
- color
- background
- margin
- padding
- border
- text-decoration
- vertical-align (仅当 float 为 none 时)
- text-transform
- line-height
- float
- clear

***

- **before 伪元素**

  "before" 伪元素可以在元素的内容前面插入新内容。

  下面的例子在每个 <h1> 元素前面插入一幅图片：

  ```
  h1:before
    {
    content:url(logo.gif);
    }
  ```

- **CSS2 - :after 伪元素**

  ":after" 伪元素可以在元素的内容之后插入新内容。

  下面的例子在每个 <h1> 元素后面插入一幅图片：

  ```
  h1:after
    {
    content:url(logo.gif);
    }
  ```



****

### 1、13CSS对齐

- **对齐块元素**

  块元素指的是占据全部可用宽度的元素，并且在其前后都会换行。

- **使用 margin 属性来水平对齐**

  可通过将左和右外边距设置为 "auto"，来对齐块元素。

  **注释：**除非已经声明了 **!DOCTYPE**，否则使用 margin:auto 在 IE8 以及更早的版本中是无效的。

  把左和右外边距设置为 auto，规定的是均等地分配可用的外边距。结果就是居中的元素：

  **实例**

  ```
  .center
  {
  margin-left:auto;
  margin-right:auto;
  width:70%;
  background-color:#b0e0e6;
  }
  ```

***

- **使用 position 属性进行左和右对齐**

  对齐元素的方法之一是使用绝对定位：

  **实例**

  ```
  .right
  {
  position:absolute;
  right:0px;
  width:300px;
  background-color:#b0e0e6;
  }
  ```

**注释：**绝对定位元素会被从正常流中删除，并且能够交叠元素。

***

- **使用 float 属性来进行左和右对齐**

  对齐元素的另一种方法是使用 float 属性：

  **实例**

  ```
  .right
  {
  float:right;
  width:300px;
  background-color:#b0e0e6;
  }
  ```

> 当像这样对齐元素时，对 <body> 元素的外边距和内边距进行预定义是一个好主意。这样可以避免在不同的浏览器中出现可见的差异。

```
body
{
margin:0;
padding:0;
}
```

***

### 1、14CSS尺寸

**CSS 尺寸属性**

CSS 尺寸属性允许你控制元素的高度和宽度。同样，还允许你增加行间距。

| 属性        | 描述                 |
| :---------- | :------------------- |
| height      | 设置元素的高度。     |
| line-height | 设置行高。           |
| max-height  | 设置元素的最大高度。 |
| max-width   | 设置元素的最大宽度。 |
| min-height  | 设置元素的最小高度。 |
| min-width   | 设置元素的最小宽度。 |
| width       | 设置元素的宽度。     |

***

### 1、15CSS分类

- **CSS 分类属性 (Classification)**

CSS 分类属性允许你控制如何显示元素，设置图像显示于另一元素中的何处，相对于其正常位置来定位元素，使用绝对值来定位元素，以及元素的可见度。

| 属性       | 描述                                                     |
| :--------- | :------------------------------------------------------- |
| clear      | 设置一个元素的侧面是否允许其他的浮动元素。               |
| cursor     | 规定当指向某元素之上时显示的指针类型。                   |
| display    | 设置是否及如何显示元素。                                 |
| float      | 定义元素在哪个方向浮动。                                 |
| position   | 把元素放置到一个静态的、相对的、绝对的、或固定的位置中。 |
| visibility | 设置元素是否可见或不可见。                               |

***

- **改变鼠标光标**（cursor)

<span style="cursor:auto">Auto</span><br />
<span style="cursor:crosshair">
Crosshair</span><br />
<span style="cursor:default">
Default</span><br />
<span style="cursor:pointer">
Pointer</span><br />
<span style="cursor:move">
Move</span><br />
<span style="cursor:e-resize">
e-resize</span><br />
<span style="cursor:ne-resize">
ne-resize</span><br />
<span style="cursor:nw-resize">
nw-resize</span><br />
<span style="cursor:n-resize">
n-resize</span><br />
<span style="cursor:se-resize">
se-resize</span><br />
<span style="cursor:sw-resize">
sw-resize</span><br />
<span style="cursor:s-resize">
s-resize</span><br />
<span style="cursor:w-resize">
w-resize</span><br />
<span style="cursor:text">
text</span><br />
<span style="cursor:wait">
wait</span><br />
<span style="cursor:help">
help</span>

***

### 1、16CSS导航条

- 导航栏基本上是一个链接列表，因此使用 <ul> 和 <li> 元素是非常合适的：

```
<ul>
<li><a href="default.asp">Home</a></li>
<li><a href="news.asp">News</a></li>
<li><a href="contact.asp">Contact</a></li>
<li><a href="about.asp">About</a></li>
</ul>
```

- 现在，让我们从列表中去掉圆点和外边距：

  ```
  ul
  {
  list-style-type:none;
  margin:0;
  padding:0;
  }
  ```

> 把外边距和内边距设置为 0 可以去除浏览器的默认设定

***

- **垂直导航栏**

如需构建垂直导航栏，我们只需要定义 <a> 元素的样式，除了上面的代码之外：

```
a
{
display:block;
width:60px;
}
```

- display:block - 把链接显示为块元素可使整个链接区域可点击（不仅仅是文本），同时也允许我们规定宽度。
- width:60px - 块元素默认占用全部可用宽度。我们需要规定 60 像素的宽度。



***

### 1、17CSS媒介

> 不同的媒介类型

**注释：**媒介类型名称对大小写不敏感。

| 媒介类型   | 描述                                                   |
| :--------- | :----------------------------------------------------- |
| all        | 用于所有的媒介设备。                                   |
| aural      | 用于语音和音频合成器。                                 |
| braille    | 用于盲人用点字法触觉回馈设备。                         |
| embossed   | 用于分页的盲人用点字法打印机。                         |
| handheld   | 用于小的手持的设备。                                   |
| print      | 用于打印机。                                           |
| projection | 用于方案展示，比如幻灯片。                             |
| screen     | 用于电脑显示器。                                       |
| tty        | 用于使用固定密度字母栅格的媒介，比如电传打字机和终端。 |
| tv         | 用于电视机类型的设备。                                 |