# python学习续

## 项目二：数据可视化

- 我们创建了一个列表，在其中存储了前述平方数，再将这个列表传递给函数plot()，这个函数尝试根据这些数字绘制出有意义的图形。
- plt.show()打开matplotlib查看器，并显示绘制的图形

```python
import matplotlib.pyplot as plt
squares = [1, 4, 9, 16, 25]
plt.plot(squares)
plt.show()
```

#### 1、1修改标签文字和线条粗细

```python
import matplotlib.pyplot as plt
squares = [1, 4, 9, 16, 25]
plt.plot(squares, linewidth = 5)
# 设置图表标题，并给坐标轴加上标签
plt.title("Square Numbers", fontsize=24)
plt.xlabel("Value", fontsize=14)
plt.ylabel("Square of Value", fontsize=14)
#设置刻度标记的大小
plt.tick_params(axis='both', labelsize=14)
plt.show()
```

- 函数title()给图表指定标题。
- 在上述代码中，出现了多次的参数fontsize指定了图表中文字的大小
- 函数xlabel()和ylabel()让你能够为每条轴设置标题；
- 而函数**tick_params()**设置**刻度的样式**，其中指定的实参将影响x轴和y轴上的刻度（axes='both'）

***

#### 1、2矫正图形

- 当你向plot()提供一系列数字时，它假设第一个数据点对应的x坐标值为0，但我们的第一个点对应的x值为1。为改变这种默认行为，我们可以给plot()同时提供输入值和输出值

```python
import matplotlib.pyplot as plt

input_value = [1, 2, 3, 4, 5]
squares = [1, 4, 9, 16, 25]

plt.plot(input_values, squares, linewidth=5)

# 设置图表标题，并给坐标轴加上标签
plt.title("Square Numbers", fontsize=24)
plt.xlabel("Value", fontsize=14)
plt.ylabel("Square of Value", fontsize=14)

#设置刻度标记的大小
plt.tick_params(axis='both', labelsize=14)
plt.show()
```

***

### 1、3使用 scatter()绘制散点图并设置其样式

- 要绘制单个点，可使用函数scatter()，并向它传递一对x和y坐标，它将在指定位置绘制一
  个点

```python 
import matplotlib.pyplot as plt

plt.scatter(2, 4)
plt.show()
```

- 下面来设置输出的样式，使其更有趣：添加标题，给轴加上标签，并确保所有文本都大到能
  够看清：

```python 
import matplotlib.pyplot as plt

plt.scatter(2, 4, s = 200)

# 设置图表标题并给坐标轴加上标签
plt.title("Square Numbers", fontsize = 24)
plt.xlabel("Value", fontsize = 14)
plt.ylabel("Square of Value", fontsize = 14)

#设置刻度标记的大小
plt.tick_params(axis = 'both', which = 'major', labelsize = 14)
plt.show()
```

- 我们调用了scatter()，并使用**实参s**设置了绘制图形时使用的点的尺寸

***

#### 1、3、1使用 scatter()绘制一系列点

- 要绘制一系列的点，可向scatter()传递两个分别包含x值和y值的列表，如下所示：

```python
import matplotlib.pyplot as plt

x_values = [1, 2, 3, 4, 5]
y_values = [1, 4, 9, 16, 25]
plt.scatter(x_values, y_values, s = 100)

# 设置图表标题并给坐标轴加上标签
plt.title("Square Numbers", fontsize = 24)
plt.xlabel("Value", fontsize = 14)
plt.ylabel("Square of Value", fontsize = 14)

# 设置刻度标记的大小
plt.tick_params(axis = 'both', which = 'major', labelsize = 14)
plt.show()
```

#### 1、3、2自动计算数据

- 手工计算列表要包含的值可能效率低下，需要绘制的点很多时尤其如此

```python
import matplotlib.pyplot as plt

x_values = list(range(1, 1001))
y_values = [x**2 for x in x_values]
plt.scatter(x_values, y_values, s = 100)

# 设置图表标题并给坐标轴加上标签
plt.title("Square Numbers", fontsize = 24)
plt.xlabel("Value", fontsize = 14)
plt.ylabel("Square of Value", fontsize = 14)

# 设置每个坐标轴的取值范围
plt.axis([0, 1100, 0, 1100000])

# 设置刻度标记的大小
plt.tick_params(axis = 'both', which = 'major', labelsize = 14)
plt.show()
```

- 由于这个数据集较大，我们将点设置得较小，并使用函数axis()指定了每个坐标轴的取值范围
  - 函数axis()要求提供四个值：x和y坐标轴的最小值和最大值。在这里，我们将x坐标
    轴的取值范围设置为0\~1100，并将y坐标轴的取值范围设置为0\~1 100 000

#### 1、3、3删除数据点的轮廓

- matplotlib允许你给散点图中的各个点指定颜色。默认为蓝色点和黑色轮廓，在散点图包含的数据点不多时效果很好。但绘制很多点时，黑色轮廓可能会粘连在一起。
- 要删除数据点的轮廓，可在调用scatter()时传递实参`edgecolor='none'`

```python
plt.scatter(x_values, y_values, edgecolor='none', s=40)
```

#### 1、3、4自定义颜色

- 要修改数据点的颜色，可向scatter()传递参数c，并将其设置为要使用的颜色的名称，如下所示

```python
plt.scatter(x_values, y_values, c='red', edgecolor='none', s=40)
```

- 要指定自定义颜色，可传递参数c，并将其设置为一个元组，其中包含三个0~1之间的小数值，它们分别表示红色、绿色和蓝色分量。
- 例如，下面的代码行创建一个由淡蓝色点组成的散点图

````
plt.scatter(x_values, y_values, c=(0, 0, 0.8), edgecolor='none', s=40)
````

- 值越接近0，指定的颜色越深，值越接近1，指定的颜色越浅

***

#### 1、3、5使用颜色映射

- 颜色映射（colormap）是一系列颜色，它们从起始颜色渐变到结束颜色。
- 在可视化中，颜色映射用于突出数据的规律，例如，你可能用较浅的颜色来显示较小的值，并使用较深的颜色来显示较大的值。
- 模块pyplot内置了一组颜色映射。要使用这些颜色映射，你需要告诉pyplot该如何设置数据集中每个点的颜色。下面演示了如何根据每个点的y值来设置其颜色

```python 
plt.scatter(x_values, y_values, c = y_values, cmap = plt.cm.Blues,
				edgecolor='none', s = 20)
```

- 我们将参数c设置成了一个y值列表，并使用参数cmap告诉pyplot使用哪个颜色映射。这些代码将y值较小的点显示为浅蓝色，并将y值较大的点显示为深蓝色

>要了解pyplot中所有的颜色映射，请访问http://matplotlib.org/，单击Examples，向下滚动
>到Color Examples，再单击colormaps_reference

#### 1、3、6自动保存图表

- 要让程序自动将图表保存到文件中，可将对plt.show()的调用替换为对plt.savefig()的调用

````python
plt.savefig('squares_plot.png', bbox_inches='tight')
````

- 第一个实参指定要以什么样的文件名保存图表，这个文件将存储到scatter_squares.py所在的目录中；
- 第二个实参指定将图表多余的空白区域裁剪掉。如果要保留图表周围多余的空白区域，可省略这个实参

***

### 1、4随机漫步

- 随机漫步是这样行走得到的路径：每次行走都完全是随机的，没有明确的方向，结果是由一系列随机决策决定的

#### 1、4、1创建 RandomWalk()类

- 为模拟随机漫步，我们将创建一个名为RandomWalk的类，它随机地选择前进方向。
- 这个类需要三个属性，其中一个是存储随机漫步次数的变量，其他两个是列表，分别存储随机漫步经过的每个点的x和y坐标
- RandomWalk类只包含两个方法：\_\_init\_\_ ()和fill_walk()，其中后者计算随机漫步经过的所有点

```python
from random import choice

class RandomWalk():
    """一个生成随机漫步数据的类"""
    def __init__(self, num_points = 5000):
        """初始化随机漫步的属性"""
        self.num_points = num_points
        # 所有随机漫步都始于(0, 0)
        self.x_values = [0]
        self.y_values = [0]
```

- 为做出随机决策，我们将所有可能的选择都存储在一个列表中，并在每次做决策时都使用choice()来决定使用哪种选择
- 接下来，我们将随机漫步包含的默认点数设置为5000，这大到足以生成有趣的模式，同时又足够小，可确保能够快速地模拟随机漫步
- 然后，我们创建了两个用于存储x和y值的列表，并让每次漫步都从点(0, 0)出发

***

#### 1、4、2选择方向

- 我们将使用fill_walk()来生成漫步包含的点，并决定每次漫步的方向

```python
def fill_walk(self):
    """计算随机漫步包含的所有点"""
    #不断漫步，直到列表达到指定的长度
    while len(self.x_values) < self.num_points:
        #决定前进方向以及沿这个方向前进的距离
        x_direction = choice([1, -1])
        x_distance = choice([0, 1, 2, 3, 4])
        x_step = x_direction * x_distance
        y_direction = choice([1, -1])
        y_distance = choice([0, 1, 2, 3, 4])
        y_step = y_direction * y_distance
        #拒绝原地踏步
        if x_step == 0 and y_step == 0:
        	continue
        #计算下一个点的x和y值
        next_x = self.x_values[-1] + x_step
        next_y = self.y_values[-1] + y_step
        self.x_values.append(next_x)
        self.y_values.append(next_y)
```

- 使用choice([1, -1])给x_direction选择一个值，结果要么是表示向右走的1，要么是表
  示向左走的1
- choice([0, 1, 2, 3, 4])随机地选择一个0~4之间的整数，告诉Python 沿指定的方向走多远（x_distance）
- 为获取漫步中下一个点的x值，我们将x_step与x_values中的最后一个值 `self.x_values[-1] `相加

***

#### 1、4、3绘制随机漫步图

```python
import matplotlib.pyplot as plt
from random_walk import RandomWalk
# 创建一个RandomWalk实例，并将其包含的点都绘制出来
rw = RandomWalk()
rw.fill_walk()
plt.scatter(rw.x_values, rw.y_values, s=15)
plt.show()
```

-  我们首先导入了模块pyplot和RandomWalk类，然后创建了一个RandomWalk实例，并将其存储到rw中
-  再调用fill_walk()
-  将随机漫步包含的x和y值传递给scatter()，并选择了合适的点尺寸

#### 1、4、4模拟多次随机漫步

- 每次随机漫步都不同，因此探索可能生成的各种模式很有趣。要在不多次运行程序的情况下使用前面的代码模拟多次随机漫步，一种办法是将这些代码放在一个while循环中，如下所示

```python
    # 只要程序处于活动状态，就不断地模拟随机漫步
    while True:

        keep_running = input("Make another walk? (y/n): ")
        if keep_running == 'n':
            break
```

- 这些代码模拟一次随机漫步，在matplotlib查看器中显示结果，再在不关闭查看器的情况下暂停。如果你关闭查看器，程序将询问你是否要再模拟一次随机漫步。如果你输入y，可模拟多次随机漫步

***

#### 1、4、5重新绘制起点和终点

```python
# 突出起点和终点
plt.scatter(0, 0, c='green', edgecolors='none', s=100)
plt.scatter(rw.x_values[-1], rw.y_values[-1], c='red', edgecolors='none',
s=100)
```

- 为突出起点，使用绿色绘制点(0, 0)，并使其比其他点大（s=100）。
- 为突出终点，在漫步包含的最后一个x和y值处绘制一个点，将其颜色设置为红色，并将尺寸设置为100

#### 1、4、6隐藏坐标轴

- 下面来隐藏这个图表中的坐标轴，以免我们注意的是坐标轴而不是随机漫步路径

```python
# 隐藏坐标轴
plt.axes().get_xaxis().set_visible(False)
plt.axes().get_yaxis().set_visible(False)
```

- 为修改坐标轴，使用了函数plt.axes()来将每条坐标轴的可见性都设置为False

***

- 请尝试修改上述代码，看看将漫步包含的点数增加到多少后，程序的运行速度变得极其缓慢或绘制出的图形变得很难看

***

#### 1、4、7调整尺寸以适合屏幕

```
#设置绘图窗口的尺寸
plt.figure(figsize=(10, 6))
```

- 函数figure()用于指定图表的宽度、高度、分辨率和背景色。你需要给形参figsize指定一个元组，向matplotlib指出绘图窗口的尺寸，单位为英寸

***

### 1、5使用 Pygal 模拟掷骰子

#### 1、5、1创建 Die 类

- 下面的类模拟掷一个骰子

```python
from die import Die

#创建一个D6
die = Die()

#掷几次骰子，并将结果存储在一个列表中
results = []
for roll_num in range(100):
    result = die.roll()
    results.append(result)
print(results)
```

#### 1、5、2分析结果

- 为分析掷一个D6骰子的结果，我们计算每个点数出现的次数

```python
#分析结果
frequencies = []
for value in range(1, die.num_side + 1):
    frequency = results.count(value)
    frequencies.append(frequency)

print(frequencies)
```

#### 1.5.3绘制直方图

- 创建条形图，我们创建了一个pygal.Bar()实例，并将其存储在hist中
- 设置hist的属性title（用于标示直方图的字符串），将掷D6骰子的可能结果用作x轴的标签
- 我们使用add()将一系列值添加到图表中（向它传递要给添加的值指定的标签，还有一个列表，其中包含将出现在图表中的值）

***

#### 1.5.4同时掷两个骰子

```python
import pygal
from die import Die

#创建一个D6
die1 = Die()
die2 = Die()

#掷几次骰子，并将结果存储在一个列表中
results = []
for roll_num in range(1000):
    result = die1.roll() + die2.roll()
    results.append(result)

#分析结果
frequencies = []
for value in range(2, 2*die1.num_side + 1):
    frequency = results.count(value)
    frequencies.append(frequency)

print(frequencies)

# 对结果进行可视化
hist = pygal.Bar()
#修改创建x_labels的方法
for number in range(2,maxsize + 1):
    hist1.append(number)
hist.x_labels = hist1
#hist.x_labels = ['2','3','4','5','6','7','8','9','10','11','12']	旧方法
hist._title = "Result of rolling D6 1000 times"
hist.y_title = "Frequency of result"

hist.add('D6',frequencies)
hist.render_to_file('die_visual.svg')
```

***

## 2.下载数据

### 2.1CSV格式

- 要在文本文件中存储数据，最简单的方式是将数据作为一系列以逗号分隔的值（CSV）写入文件
- 下面是一行CSV格式的天气数据：
  `2014-1-5,61,44,26,18,7,-1,56,30,9,30.34,30.27,30.15,,,,10,4,,0.00,0,,195`
- CSV文件对人来说阅读起来比较麻烦，但程序可轻松地提取并处理其中的值，这有助于加快数据分析过程

#### 2.1.1分析 CSV 文件头

- csv模块包含在Python标准库中，可用于分析CSV文件中的数据行，让我们能够快速提取感兴趣的值

```python
import csv
filename = 'sitka_weather_07-2014.csv'
with open(filename) as f:
	reader = csv.reader(f)
	header_row = next(reader)
print(header_row)
```

- 导入模块csv后，我们将要使用的文件的名称存储在filename中。接下来，我们打开这个文件，并将结果文件对象存储在f中
- 调用csv.reader()，并将前面存储的文件对象作为实参传递给它，从而创建一个与该文件相关联的阅读器（reader）对象
- 模块csv包含函数next()，调用它并将阅读器对象传递给它时，它将返回文件中的下一行
- 在前面的代码中，我们只调用了next()一次，因此得到的是文件的第一行，其中包含文件头
- 将返回的数据存储在header_row中

```
['AKDT', 'Max TemperatureF', 'Mean TemperatureF', 'Min TemperatureF',
'Max Dew PointF', 'MeanDew PointF', 'Min DewpointF', 'Max Humidity',
' Mean Humidity', ' Min Humidity', ' Max Sea Level PressureIn',
' Mean Sea Level PressureIn', ' Min Sea Level PressureIn',
' Max VisibilityMiles', ' Mean VisibilityMiles', ' Min VisibilityMiles',
' Max Wind SpeedMPH', ' Mean Wind SpeedMPH', ' Max Gust SpeedMPH',
'PrecipitationIn', ' CloudCover', ' Events', ' WindDirDegrees']
```

- reader处理文件中以逗号分隔的第一行数据，并将每项数据都作为一个元素存储在列表中。
- 文件头AKDT表示阿拉斯加时间
- 其位置表明每行的第一个值都是日期时间
- 文件头Max TemperatureF指出每行的第二个值都是当天的最高华氏温度。可通过阅读其他的文件头来确定文件包含的信息类型

>文件头的格式并非总是一致的，空格和单位可能出现在奇怪的地方。这在原始数据文件中很常见，但不会带来任何问题

#### 2.1.2打印文件头及其位置

- 为让文件头数据更容易理解，将列表中的每个文件头及其位置打印出来

```python
with open(filename) as f:
	reader = csv.reader(f)
	header_row = next(reader)
for index, column_header in enumerate(header_row):
	print(index, column_header)
```

- 对列表调用了enumerate()来获取每个元素的索引及其值

得到如下：

```
0 
1 Job Title
2 Salary Estimate
3 Job Description
4 Rating
5 Company Name
6 Location
7 Headquarters
8 Size
9 Founded
10 Type of ownership
11 Industry
12 Sector
13 Revenue
14 Competitors
15 Easy Apply
```

#### 2.1.3提取并读取数据

- 建了一个名为 JobTitile 的空列表，再遍历文件中余下的各行
- 阅读器对象从其停留的地方继续往下读取CSV文件，每次都自动返回当前所处位置的下一行
- 由于读取了文件头行，这个循环将从第二行开始——从这行开始包含的是实际数据
- 每次执行该循环时，我们都将索引1处（第2列）的数据附加到 JobTitle 末尾

```python
import csv

filename = 'DataAnalyst.csv'
#加上encoding = 'UTF-8'，防止出现解码错误
with open(filename, encoding = 'UTF-8') as f:
    reader = csv.reader(f)
    header_row = next(reader)
    JobTitle = []
    #必须把这一段代码加到with open 后面，因为python会自动关闭文件
    for row in reader:
        JobTitle.append(row[1])
    print(JobTitle)

for index, column_header in enumerate(header_row):
	print(index, column_header)
```

#### 2.1.4绘制图表

```python
#根据数据绘制图形
fig = plt.figure(figsize = (10, 6))
plt.plot(JobTitle, c = 'red')

#设置图形的格式
plt.title("Daily high temperatures, July 2014", fontsize = 24)
plt.xlabel('', fontsize = 16)
plt.ylabel("Salary", fontsize = 16)
#设置刻度标记的大小
plt.tick_params(axis = 'both', which = 'major', labelsize = 16)
plt.show()
```

#### 2.1.5模块 datetime

- 读取该数据时，获得的是一个字符串，因为我们需要想办法将字符串'2014-7-1'转换为一个表示相应日期的对象
- 为创建一个表示2014年7月1日的对象，可使用模块datetime中的方法strptime()

```python
from datetime import datetime
first_date = datetime.strptime('2014-7-1', '%Y-%m-%d')
print(first_date)
2014-07-01 00:00:00
```

- 调用方法strptime()，并将包含所需日期的字符串作为第一个实参。
- 第二个实参告诉Python如何设置日期的格式
  - '%Y-' 让Python将字符串中第一个连字符前面的部分视为四位的年份
  - '%m-'让Python将第二个连字符前面的部分视为表示月份的数字
  - '%d'让Python将字符串的最后一部分视为月份中的一天

| %A   | 星期的名称, 如Monday            |
| ---- | ------------------------------- |
| %B   | 月份名，如January               |
| %m   | 用数字表示的月份（01~12）       |
| %d   | 用数字表示月份中的一天（01~31） |
| %Y   | 四位的年份，如2015              |
| %y   | 两位的年份，如15                |
| %H   | 24小时制的小时数（00~23）       |
| %I   | 12小时制的小时数（01~12）       |
| %p   | am或pm                          |
| %M   | 分钟数（00~59）                 |
| %S   | 秒数（00~61）                   |

```python
dates, highs = [], []
for row in reader:
	current_date = datetime.strptime(row[0], "%Y-%m-%d")
	dates.append(current_date)
```

 - 调用了fig.autofmt_xdate()来绘制斜的日期标签，以免它们彼此重叠

![image-20200723213018703](C:\Users\13793\Desktop\学习笔记\image-20200723213018703.png)

```python
import csv
from datetime import datetime
from matplotlib import pyplot as plt

# 从文件中获取日期和最高气温
filename = 'sitka_weather_07-2014.csv'
with open(filename) as f:
	reader = csv.reader(f)
	header_row = next(reader)
    
dates, highs = [], []
for row in reader:
	current_date = datetime.strptime(row[0], "%Y-%m-%d")
	dates.append(current_date)
high = int(row[1])
highs.append(high)

# 根据数据绘制图形
fig = plt.figure(dpi=128, figsize=(10, 6))
plt.plot(dates, highs, c='red')

# 设置图形的格式
plt.title("Daily high temperatures, July 2014", fontsize=24)
plt.xlabel('', fontsize=16)
fig.autofmt_xdate()
plt.ylabel("Temperature (F)", fontsize=16)
plt.tick_params(axis='both', which='major', labelsize=16)
plt.show()
```

#### 2.1.6给图表区域着色

```python
plt.plot(dates, highs, c='red', alpha=0.5)
plt.plot(dates, lows, c='blue', alpha=0.5)
plt.fill_between(dates, highs, lows, facecolor='blue', alpha=0.1)
```

- 实参alpha指定颜色的透明度。Alpha值为0表示完全透明，1（默认设置）表示完全不透明。通过将alpha设置为0.5，可让红色和蓝色折线的颜色看起来更浅
- fill_between()传递了一个x值系列：列表dates，还传递了两个y值系列：highs和lows

***

#### 2.1.7错误检查

```python
for row in reader:
	try:
    	current_date = datetime.strptime(row[0], "%Y-%m-%d")
    	high = int(row[1])
    	low = int(row[3])
    except ValueError:
    	print(current_date, 'missing data')
    else:
    	dates.append(current_date)
    	highs.append(high)
    	lows.append(low)
```

- 如果获取特定日期的所有数据时没有发生错误，将运行else代码块，并将数据附加到相应列表的末尾

***

### 2.2制作世界人口地图：JSON 格式

```python
import json

#将数据加载到一个列表中
filename = 'population_data.json'
with open(filename) as f:
    pop_data = json.load(f)
    
#打印每个国家2010年的人口数量
for pop_dict in pop_data:
	if pop_dict['Year'] == '2010':
		country_name = pop_dict['Country Name']
		population = pop_dict['Value']
    	print(country_name + ": " + population)
```

- 首先导入了模块json，以便能够正确地加载文件中的数据
- 然后，我们将数据存储在pop_data中
- 函数json.load()将数据转换为Python能够处理的格式，这里是一个列表

***

#### 2.2.1获取两个字母的国别码

- Pygal使用的国别码存储在模块i18n（internationalization的缩写）中。字典COUNTRIES包含的键和值分别为两个字母的国别码和国家名。要查看这些国别码，可从模块i18n中导入这个字典，并打印其键和值

```python
from pygal.i18n import COUNTRIES
for country_code in sorted(COUNTRIES.keys()):
	print(country_code, COUNTRIES[country_code])
```

- 查找并返回国别码

```python
from pygal.i18n import COUNTRIES
def get_country_code(country_name):
    """根据指定的国家，返回Pygal使用的两个字母的国别码"""
    for code, name in COUNTRIES.items():
        if name == country_name:
            return code
    #如果没有找到指定的国家，就返回None
    return None
```

#### 2.2.2制作世界地图

```python
import pygal
wm = pygal.Worldmap()
wm.title = 'North, Central, and South America'
wm.add('North America', ['ca', 'mx', 'us'])
wm.add('Central America', ['bz', 'cr', 'gt', 'hn', 'ni', 'pa', 'sv'])
wm.add('South America', ['ar', 'bo', 'br', 'cl', 'co', 'ec', 'gf',
'gy', 'pe', 'py', 'sr', 'uy', 've'])
wm.render_to_file('americas.svg')
```

***

## 3.使用API

- 调用get()并将URL传递给它，再将响应对象存储在变量r中。
- 响应对象包含一个名为status_code的属性，它让我们知道请求是否成功了（状态码200表示请求成功）

- API返回JSON格式的信息，因此我们使用方法json()将这些信息转换为一个Python字典

```python
import requests
# 执行API调用并存储响应
url = 'https://api.github.com/search/repositories?q=language:python&sort=stars'
r = requests.get(url)
print("Status code:", r.status_code)
# 将API响应存储在一个变量中
response_dict = r.json()
# 处理结果
print(response_dict.keys())
```

#### 3.1.1处理响应字典

```python
import requests
# 执行API调用并存储响应
url = 'https://api.github.com/search/repositories?q=language:python&sort=stars'
r = requests.get(url)
print("Status code:", r.status_code)
# 将API响应存储在一个变量中
response_dict = r.json()
# 处理结果
print(response_dict.keys())
print("Total repositories:", response_dict['total_count'])
# 探索有关仓库的信息
repo_dicts = response_dict['items']
print("Repositories returned:", len(repo_dicts))
# 研究第一个仓库
repo_dict = repo_dicts[0]
print("\nKeys:", len(repo_dict))
for key in sorted(repo_dict.keys()):
    print(key)
```

- 与'items'相关联的值是一个列表，其中包含很多字典，而每个字典都包含有关一个Python仓库的信息
- 将这个字典列表存储在repo_dicts中。接下来，我们打印repo_dicts的长度，以获悉我们获得了多少个仓库的信息

#### 3.1.2概述最受欢迎的仓库

```python
for repo_dict in repo_dicts:
	print('\nName:', repo_dict['name'])
	print('Owner:', repo_dict['owner']['login'])
	print('Stars:', repo_dict['stargazers_count'])
	print('Repository:', repo_dict['html_url'])
	print('Description:', repo_dict['description'])
```

#### 3.1.3监视 API 的速率限制

- 大多数API都存在速率限制，即你在特定时间内可执行的请求数存在限制

- 要获悉你是否接近了GitHub的限制，请在浏览器中输入https://api.github.com/rate_limit

```python
{
    "resources": {
        "core": {
            "limit": 60,
            "remaining": 58,
            "reset": 1426082320
        },
        "search": {
            "limit": 10,
            "remaining": 8,
            "reset": 1426078803
        }
        },
        "rate": {
            "limit": 60,
            "remaining": 58,
            "reset": 1426082320
    }
}
```

- “limit” 极限为每分钟10个请求，而在当前这一分钟内，我们还可执行8个请求
- reset值指的是配额将重置的Unix时间或新纪元时间（1970年1月1日午夜后多少秒）
- 用完配额后，你将收到一条简单的响应，由此知道已到达API极限。到达极限后，你必须等待配额重置
- 很多API都要求你注册获得API密钥后才能执行API调用。编写本书时，GitHub没有这样的要求，但获得API密钥后，配额将高得多

***

### 3.2使用 Pygal 可视化仓库

- 我们将创建一个交互式条形图：条形的高度表示项目获得了多少颗星。单击条形将带你进入项目在GitHub上的主页

```python
import pygal
import requests
from pygal.style import LightColorizedStyle as LCS, LightenStyle as LS

# 执行API调用并存储响应
url = 'https://api.github.com/search/repositories?q=language:java&sort=stars'
r = requests.get(url)
print("Status code:", r.status_code)
# 将API响应存储在一个变量中
response_dict = r.json()
# 处理结果
print(response_dict.keys())
print("Total repositories:", response_dict['total_count'])
# 探索有关仓库的信息
repo_dicts = response_dict['items']
print("Repositories returned:", len(repo_dicts))
# 研究第一个仓库
repo_dict = repo_dicts[0]
print("\nKeys:", len(repo_dict))

name,stars = [],[]
#打印所有仓库的必要信息
for number in range(0, len(repo_dicts)): 
    name.append(repo_dict['name'])
    stars.append(repo_dict['watchers']) 
    print("names:",repo_dicts[number]['name'])
    print('Owner:', repo_dicts[number]['owner']['login'])
    print("stars:",repo_dicts[number]['watchers'])
    print("Repository:",repo_dicts[number]['html_url'])
    print("Discription: " + repo_dicts[number]['description'])

#可视化
my_style = LS('#333366', base_style = LCS)
chart = pygal.Bar(style = my_style, x_label_rotation = 45, show_legend = False)
chart.title = 'Most-Starred Python Projects on GitHub'
chart.x_labels = name

chart.add('', stars)
chart.render_to_file('python_repos.svg')
```

- 首先导入了pygal以及要应用于图表的Pygal样式。接下来，打印API调用响应的状态以及找到的仓库总数
- 创建了两个空列表，用于存储将包含在图表中的信息。我们需要每个项目的名称，用于给条形加上标签
- 使用LightenStyle类（别名LS）定义了一种样式，并将其基色设置为深蓝色
- 传递了实参base_style，以使用LightColorizedStyle类（别名LCS）
- 我们使用Bar()创建一个简单的条形图，并向它传递了my_style
- 我们还传递了另外两个样式实参：让标签绕x轴旋转45度（x_label_rotation=45），并隐藏了图例（show_legend=False）
- 由于我们不需要给这个数据系列添加标签，因此在添加数据时，将标签设置成了空字符串

***

#### 3.2.1改进 Pygal 图表

- 下面来改进这个图表的样式。我们将进行多个方面的定制，因此先来稍微调整代码的结构，创建一个配置对象，在其中包含要传递给Bar()的所有定制：

```python
#可视化
my_style = LS('#333366', base_style = LCS)

my_config = pygal.Config()			#1
my_config.x_label_rotation = 45		#2
my_config.show_legend = False
my_config.title_font_size = 24		#3
my_config.label_font_size = 14
my_config.major_label_font_size = 18
my_config.truncate_label = 15		#4
my_config.show_y_guides = False		#5
my_config.width = 1000				#6

chart = pygal.Bar(my_config, style=my_style)
chart.title = 'Most-Starred Python Projects on GitHub'
chart.x_labels = names

chart.add('', stars)
chart.render_to_file('python_repos.svg')
```

- 我们创建了一个Pygal类Config的实例，并将其命名为my_config。通过修改my_config的属性，可定制图表的外观
- 我们设置了两个属性——x_label_rotation和show_legend，它们原来是在创建Bar实例时以关键字实参的方式传递的
- 在3处，我们设置了图表标题、副标签和主标签的字体大小，副标签是x轴上的项目名以及y轴上的大部分数字。主标签是y轴上为5000整数倍的刻度；这些标签应更大，以与副标签区分开来
- 在4处，我们使用truncate_label将较长的项目名缩短为15个字符（如果你将鼠标指向屏幕上被截短的项目名，将显示完整的项目名）
- 将show_y_guides设置为False，以隐藏图表中的水平线
- 在6处，设置了自定义宽度，让图表更充分地利用浏览器中的可用空间

***

#### 3.2.2添加自定义工具提示

- 在Pygal中，将鼠标指向条形将显示它表示的信息，这通常称为工具提示。在这个示例中，当前显示的是项目获得了多少个星。下面来创建一个自定义工具提示，以同时显示项目的描述
- 可视化前三个项目，并给每个项目对应的条形都指定自定义标签。为此，我们向add()传递一个字典列表，而不是值列表：

```python
import pygal
from pygal.style import LightColorizedStyle as LCS, LightenStyle as LS

my_style = LS('#333366', base_style = LCS)
chart = pygal.Bar(style = my_style, x_label_rotation = 45, show_legend = False)
chart.title = 'Python Projects'
chart.x_labels = ['httpie', 'django', 'flask']
plot_dicts = [
    {'value': 16101, 'label': 'Description of httpie.'},
    {'value': 15028, 'label': 'Description of django.'},
    {'value': 14798, 'label': 'Description of flask.'},
]
chart.add('', plot_dicts)
chart.render_to_file('bar_descriptions.svg')
```

- 每个字典都包含两个键：'value'和'label'。Pygal根据与键'value'相关联的数字来确定条形的高度，并使用与'label'相关联的字符串给条形创建工具提示

#### 3.2.3根据数据绘图

- 为根据数据绘图，我们将自动生成plot_dicts，其中包含API调用返回的30个项目的信息

```python
#研究有关仓库的信息
repo_dicts = response_dict['items']
print("Number of items:", len(repo_dicts))
names, plot_dicts = [], []
for repo_dict in repo_dicts:
	names.append(repo_dict['name'])
	plot_dict = {
		'value': repo_dict['stargazers_count'],
		'label': repo_dict['description'],
	}
plot_dicts.append(plot_dict)

#可视化
my_style = LS('#333366', base_style = LCS)
--snip--
chart.add('', plot_dicts)
chart.render_to_file('python_repos.svg')
```

#### 3.2.4在图表中添加可单击的链接

- Pygal还允许你将图表中的每个条形用作网站的链接。为此，只需添加一行代码，在为每个
  项目创建的字典中，添加一个键为'xlink'的键—值对：

```
plot_dict = {
	'value': repo_dict['stargazers_count'],
	'label': repo_dict['description'],
	'xlink': repo_dict['html_url'],
}
```

- Pygal根据与键'xlink'相关联的URL将每个条形都转换为活跃的链接。单击图表中的任何条形时，都将在浏览器中打开一个新的标签页，并在其中显示相应项目的GitHub页面

