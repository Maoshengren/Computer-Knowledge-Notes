我展示的是一级标题
===============
我展示的是二级标题
---------------

#一级标题
##二级标题
###三级标题
####四级标题
#####五级标题
######六级标题

*斜体文本*
_斜体文本_
**粗体文本**
***粗斜体文本***
__粗斜体文本__

一行中用三个以上的星号、减号、底线来建立一个**分隔线**，行内不能有其他东西.
***
这样
* * *
这样
___
这样

如果段落上的文字要添加删除线，只需要在文字的两端加上两个波浪线 ~~ 即可

例如这样~~你真是个聪明的孩子~~
***
下划线可以这样玩

<u>啊~五环，你比四环多一环</u>
***
jio（脚）注
创建脚注就像这样[^footnote]。
[^footnote]:我是一只菜鸟。

Markdown列表
 * 第一项

 * 第二项

 * 第三项
（可以用+，*，-来支持无序列表，注意符号两旁都有空格）

有序列表就这样
1.第一项
2.第二项
3.第三项

列表嵌套（在子列表中添加四个空格）
1.第一项：
    - 嵌套一
    - 嵌套二
2.第二项
    - 嵌套一
    - 嵌套二

Markdown区块
> 区块引用
> 使用列表
> 1.第一项
> 2.第二项
> 3.第三项
> + 第一
> + 第二
> + 第三
>> 第一层嵌套  
>> Markdown基础我正在学习
>>> 第二层嵌套
>>> 我准备学习Markdown高级技巧

列表中使用区块
 * 第一项
> 区块一
> 区块二
 * 第二项

***
Markdown代码
 ‘ printf() ’ 函数

    #include<stdio.h>
    int main(){
    printf("hello world");
    return 0;
    }
***
也可以用```包裹一段代码
```
 include<stdio.h>
 int main(){
 printf("hello world");
 return 0;
 }
```

***
Markdown链接
[链接名称]（链接地址）
或
<链接地址>
这是一个链接[我的github](http://Maoshengren.github.io/)
或者直接酱紫<http://Maoshengren.github.io/>


链接也可以用变量来代替，文档末尾附带变量地址：
这个链接用 1 作为网址变量 [Google][1]
这个链接用 runoob 作为网址变量 [Runoob][runoob]
然后在文档的结尾为变量赋值（网址）

[1]: http://www.google.com/
[runoob]: http://www.runoob.com/

***
Markdown图片
[图片的代替文字](http://b264.photo.store.qq.com/psb?/V11rDezC0riZt9/7ZnNcXMYhiSvQJrX7zfdWkQA7aVl6sBx.HSUa9H5Abg!/m/dAgBAAAAAAAA&bo=oAU4BAAAAAARB6k!&rf=photolist "杨一")

***
Markdown制表格
**|** 来分隔不同的单元格
**-** 来分隔表头和其他行

| 表头 | 表头 | 
| :--: | :--: |
| 单元格 | 单元格 |
|  |  |
（这软件咋制不了）

***
Markdown转义字符用\
**文本加粗**
\*\*正常显示星号\*\*

****














