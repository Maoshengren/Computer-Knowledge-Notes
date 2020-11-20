# LaTeX学习

#### 基础知识

##### 1.LATEX控制序列的概念（类似于函数）

控制序列可以是作为命令：以“\”开头，参数：必须参数{}和可选参数[]。

##### 2.环境概念

以“bengin 环境名”开始，并以“end 环境名”结束。

##### 3.LATEX可以排版公式与文字

故分为：数学模式和文本模式。如果你想要在公式中排版普通的文本（直立字体和普通字距），那么你必须要把这些文本放在\textrm{...} 命令中。

##### 4.在数学模式中又分为两种

一种是公式排版在一个段落之中；另一种是公式独立形式排版。前一种，公式直接放在文字之间，公式高度一般受文本高度限制；后一种，公式另起一行，高度可调整。处于段内的数学文本要放在\( 与\) 之间， ![与](https://math.jianshu.com/math?formula=%E4%B8%8E) 之间，或者\begin{math} 与\end{math} 之间；处于段外的数学文本放在\\[与\\] 之间， 或者\begin{displaymath} 与\end{displaymath} 之间（为了网页显示，这里用双斜杠表示单斜杠）

***

**上下标**
$$
\ {x^{y^{z^{w}}}=(1+{e}^{x})^{-2xy^{w}}}\\
\ {y_1'+y_2''+y_3''}\\
\ ^{per}_{b}\\
$$

***

**求和与积分命令**
$$
\sum_{i=1}^{n} x_{i}=\int_{0}^{1}f(x)\, {\rm d}x \\
\sum_{{1\le i\le n}\atop {1\le j\le n}}a_{ij}\\
\sum_{i=1}^{n} x_{i}=\int_{0}^{1}f(x)\;{dx}\\
$$

***

**各种字体**
$$
\mathrm{ABCDEFGHIJKLMNOPQRSTUVWXYZ}\\%罗马字体
\mathtt{ABCDEFGHIJKLMNOPQRSTUVWXYZ}\\%打字机字体
\mathbf{ABCDEFGHIJKLMNOPQRSTUVWXYZ}\\%黑体
\mathsf{ABCDEFGHIJKLMNOPQRSTUVWXYZ}\\%等线体
\mathit{ABCDEFGHIJKLMNOPQRSTUVWXYZ}\\%意大利字体
$$

***

**省略号与空格**
$$
\cdots \hspace{1cm}
\ldots \hspace{1cm}%空格命令
\vdots \qquad %空格命令
\ddots \quad\\
大空格 a\ b \qquad1/3m宽度\\
中等空格 a\;b \qquad2/7m宽度\\
小空格 a\,b \hspace{2cm} 1/6m宽度\\
紧贴 a\!b \qquad缩进1/6m宽度
$$

***

**求极限的命令**
$$
\lim_{n \rightarrow \infty}\sin{x_n} = 0\\
\int_{1}^{3}f(x) = x^2 + y^2\\
\oint_{x^2}^{x^2+y^2}P(x)+Q(y) = R(z)
$$
这是求极限的命令$ \lim_{n \rightarrow \infty}sin{x_n} = 0$，很舒服吧

***

**分式排版命令**
$$
x = \frac{y + \frac{2}{z}}{y^2+\frac{x^2}{y^2+z^2}}
$$
试试在文本中用：$x = \frac{y + \frac{2}{z}}{y^2+\frac{x^2}{y^2+z^2}}$嘿嘿感觉有点小
$$
a_0+\frac 1{\displaystyle a_1 
     +\frac 1{\displaystyle a_2
     +\frac 1{\displaystyle a_3
     +\frac 1{\displaystyle a_4
     +\frac 1{\displaystyle {a_5}}}}}}
$$
还可以这样，显得舒服一点$x = \frac{\displaystyle y + \frac{2}{\displaystyle z}}{\displaystyle y^2} $ 这样

***

**根式排版命令**
$$
x= \sqrt[3]{x^2 + y^2 + z^2}\\
x=b^2 {\pm} \sqrt{4ac}\\
x\equiv a \bmod b\\
x\equiv a \pmod{a+b}
$$

***

**矩阵排版命令**

$$
\left[\begin{array}{c}
0 & 1 & 0\\
1 & 0 & 1\\
1 & 1 & 1\\
\end{array}
\right]
$$


***

**上下划线命令**
$$
\underline {1+x}\qquad
\overline {2-x}\\
\overbrace{x+y+z+x^2+y^2+z^2}\\
\underbrace{x+y+z+x^2+y^2+z^2}
$$

***

**堆砌命令**
$$
y\stackrel{\rm def}{=} f(x) \stackrel{x\rightarrow 0}{\rightarrow}
$$





***

$$
\begin{cases}
 \ u_{tt}(x,t)= b(t)\triangle u(x,t-4)&\\
\ - q(x,t)f[u(x,t-3)]+te^{-t}\sin^2 x,  &  t \neq t_k; \\
 \ u(x,t_k^+) - u(x,t_k^-) = c_k u(x,t_k), & k=1,2,3\ldots ;\\
 \ u_{t}(x,t_k^+) - u_{t}(x,t_k^-) =c_k u_{t}(x,t_k), &
 k=1,2,3\ldots\ .
\end{cases}
$$


$$
\begin{cases}
x+y+z = 0\\
x+z+2y=3\\
z+4x+5y=7
\end{cases}
$$

$$
\triangle \quad \square \quad \bigcirc \quad \bigtriangledown \quad \\
\triangleleft \quad \times \quad \uplus \quad \iiint \quad \\
\sum_{i=1}^{n} \quad \arrowvert \spadesuit \quad \diamondsuit \quad
\heartsuit\\ \quad \clubsuit
$$

一、全部不正确

（1）   精度需统一，T = （1.8 $\pm$ 0.6）s

（2）   L = 12000 $\pm$ 1 m 

（3）   U = （9.0 ± 0.3) V

（4）  Ur = 1.0%

二、A. 2.15

​		B. 2.24 

​		C. 2.24 

​		D. 2.25*10^5^   
$$
三、\qquad(1)\quad u_r(v)=\sqrt{\frac{\partial lnV}{\partial D}u_D^2}=\frac{3u_D}{\overline D}\\
u(v)=u_r(v)·V=\frac{3u_D}{\overline D}·\frac{1}{6}\pi\overline D^3=\frac{\pi\overline D^2u_d}{2}\\
(2)\quad u_r(n)=\sqrt{(\frac{cos\frac{\overline A+\overline \delta}{2}}{2sin\frac{\overline A+\overline \delta}{2}}-\frac{cos\frac{\overline A}{2}}{2sin\frac{\overline A}{2}})^2+(\frac{cos\frac{\overline A+\overline \delta}{2}}{2sin\frac{\overline A+\overline \delta}{2}})^2·u_\delta^2}\\
u(n)=u_r(n)·n=n·\sqrt{(\frac{cos\frac{\overline A+\overline \delta}{2}}{2sin\frac{\overline A+\overline \delta}{2}}-\frac{cos\frac{\overline A}{2}}{2sin\frac{\overline A}{2}})^2+(\frac{cos\frac{\overline A+\overline \delta}{2}}{2sin\frac{\overline A+\overline \delta}{2}})^2·u_\delta^2}
$$





- 完成实验、记录数据
  完成实验过程中请对实验装置拍照，需要提交。
  - 原始实验数据请记在一张A4纸上，自己设计表格，用钢笔或中性笔记录，需要拍照提交
    完成实验报告，注意格式、规范
  - “网络教学平台”网站可以下载报告模板。* 实验报告可以采用电子文档，也可以手写。
  - 除给出待测量外，还要做完整的误差分析（定量、定性）。
  - 需提交的文件包括3个文件
    - 实验报告+实验装置照片+原始数据照片
      *电子文档可以是doc或pdf格式。手写报告拍照上传，
      请把1~2页报告摆在一起拍成一张照片上传，页数不宜过多，限制在2页内

- 整理数据

  - 给出待测量（其值或关系)

    - 算术平均法
    - 列表法
    - 图示法
    - 逐差法（要求自变量是等间隔变化而函 数关系为线性 ）

  - 不确定度的计算

    - 与测量结果相关联的参数，表征合理地赋予 被测量值的分散性。反映了由于测量误差的 存在而对被测量值不能肯定的程度，是对被 测量真值所处的量值范围的评定。

    - 标准不确定度u

    - 用标准偏差表示的测量不确定度。

    - $$
      u^2(y)=\sum_{j=1}^n\frac{\partial}{}
      $$

    - 

  - 结果表达
    结果分析
    数据处理举例

  

$$
设在A处发生全反射，则\;\theta_A = arcsin(\frac{n_1}{n_2}),\\
设d为玻璃厚度，则暗环直径D:D = 4dtan\theta_A=\frac{4d}{\left(\displaystyle\frac{n_1}{n_2}\right)^2-1}\\
推到出玻璃的折射率n_2=n_1\sqrt{(\frac{4d}{D})^2+1}\approx \sqrt{(\frac{4d}{D})^2+1}
$$





















