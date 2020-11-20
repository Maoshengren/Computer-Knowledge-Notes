# Python学习

## 1、字符串操作

### 1、1修改大小写

```python
name = "ada lovelace" 
print(name.title()) 
#输出为 Ada Lovelace
```

```python
name = "Ada Lovelace" 
print(name.upper()) 
print(name.lower()) 
#这些代码的输出如下： 
ADA LOVELACE 
ada lovelace 
```

### 1、2合并（拼接）字符串

- Python使用加号（+）来合并字符串。

```python
first_name = "ada" 
last_name = "lovelace" 
full_name = first_name + " " + last_name 
print(full_name) 
#输出如下：
ada lovelace 
```

- 使用制表符或换行符来添加空白

```python
print("Languages:\nPython\nC\nJavaScript") 
Languages: 
Python 
C 
JavaScript 
```

- Python能够找出字符串开头和末尾多余的空白。要确保字符串末尾没有空白，可使用方法 rstrip()。 

```python
 favorite_language = ' python ' 
 >>> favorite_language.rstrip() 
 ' python' 
 >>> favorite_language.lstrip() 
 'python ' 
 >>> favorite_language.strip() 
 'python' 
```

### 1、3使用函数 str()避免类型错误 

```python
age = 23, message = "Happy " + str(age) + "rd Birthday!" 
print(message) 
#输出如下
Happy 23rd Birthday! 
```

### 1、4注释（#）

- 在python中注释用#标识

```python
# 向大家问好 print("Hello Python people!") 
 
Python解释器将忽略第1行，只执行第2行。 
 
Hello Python people! 
```

***

## 2、列表

- 在Python中，用方括号（[ ]）来表示列表，并用逗号来分隔其中的元素

```python
bicycles = ['trek', 'cannondale', 'redline', 'specialized'] 
print(bicycles) 
如果你让Python将列表打印出来，Python将打印列表的内部表示，包括方括号： 
['trek', 'cannondale', 'redline', 'specialized'] 
```

### 2、1访问列表元素

- 列表是有序集合，因此要访问列表的任何元素，只需将该元素的位置或索引告诉Python即可

```python
bicycles = ['trek', 'cannondale', 'redline', 'specialized'] 
print(bicycles[0]) 
输出如下：
trek
```

- 当你想要索引倒数第一个元素时，可使用bicicle[-1],倒数第二个依次递推[-2],[-3]

### 2、2修改、添加和删除元素

- 修改列表元素

```python
motorcycles = ['honda', 'yamaha', 'suzuki'] 
print(motorcycles) 

motorcycles[0] = 'ducati' 
print(motorcycles) 
```

- 添加元素

  - 末尾添加元素.append()

  ```python
  motorcycles = ['honda', 'yamaha', 'suzuki'] 
  print(motorcycles) 
  motorcycles.append('ducati') 
  print(motorcycles) 
   
  方法append()将元素'ducati'添加到了列表末尾（见），而不影响列表中的其他所有元素：
  ['honda', 'yamaha', 'suzuki'] 
  ['honda', 'yamaha', 'suzuki', 'ducati'] 
  ```

  - 列表插入元素.insert(number，string)

  **使用方法insert()可在列表的任何位置添加新元素。为此，你需要指定新元素的索引和值。**

  ```python
  motorcycles = ['honda', 'yamaha', 'suzuki'] 
  motorcycles.insert(0, 'ducati')
  print(motorcycles) 
  【在这个示例中，值'ducati'被插入到了列表开头】
  insert()在索引0处添加空间， 并将值'ducati'存储到这个地方。
  这种操作将列表中既有的每个元素都右移一个位置： 
  ['ducati', 'honda', 'yamaha', 'suzuki'] 
  ```

  - 列表删除元素

    - 如果知道元素在列表中的位置，可以用del

    ```Python
    motorcycles = ['honda', 'yamaha', 'suzuki'] 
    print(motorcycles) 
     
    del motorcycles[0] 
    print(motorcycles) 
    ```

    - 使用pop（）方法删除元素

    ```Python
    motorcycles = ['honda', 'yamaha', 'suzuki'] 
    print(motorcycles) 
     
    popped_motorcycle = motorcycles.pop() 
    print(motorcycles)  
    print(popped_motorcycle) 
    输出如下：
    ['honda', 'yamaha', 'suzuki'] 
    ['honda', 'yamaha'] 
    suzuki 
    ```

  pop（number）可以弹出任何位置的元素

  ```Python
   motorcycles = ['honda', 'yamaha', 'suzuki'] 
   first_owned = motorcycles.pop(0) 
   print('The first motorcycle I owned was a ' + first_owned.title() + '.') 
   
   输出如下：
   The first motorcycle I owned was a Honda. 
  ```

  - 根据值删除元素

  如果你只知道要删除的元素的值，可使用方法remove()。 

```Python
motorcycles = ['honda', 'yamaha', 'suzuki', 'ducati'] 
print(motorcycles) 

motorcycles.remove('ducati') 
print(motorcycles) 
输出如下：
['honda', 'yamaha', 'suzuki', 'ducati'] 
['honda', 'yamaha', 'suzuki'] 
```

也可以使用他的值

```python
too_expensive = 'ducati'
motorcycles.remove(too_expensive) 
```

### 2、3组织列表

- **使用方法 sort()对列表进行永久性排序** 

```Python
cars = ['bmw', 'audi', 'toyota', 'subaru'] 
cars.sort() 
print(cars) 
输出如下：
['audi', 'bmw', 'subaru', 'toyota'] 
```

**cars.sort(reverse=True) **可将排序反向

输出如下：

````Python
['toyota', 'subaru', 'bmw', 'audi'] 
````

- **使用函数 sorted()对列表进行临时排序**  

  > 函数 sorted()让你能够按特定顺序显示列表元素，同时不影响它们在列表中的原始排列顺序

注意sorted（）使用方法

```
print(sorted(cars),reverse=True)
```

- **倒着打印列表**

可使用**reverse()**

```
cars = ['bmw', 'audi', 'toyota', 'subaru']
print(cars) 
cars.reverse() 
print(cars)

输出如下：
['bmw', 'audi', 'toyota', 'subaru'] 
['subaru', 'toyota', 'audi', 'bmw'] 
```

**注：reverse()永久性地修改列表元素的排列顺序**

- 确定列表长度

使用函数len()可快速获悉列表的长度

```
cars = ['bmw', 'audi', 'toyota', 'subaru'] 
len(cars) 
输出如下：
4
```

***

## 3、操作列表

### 3、1遍历列表

```
cars = ['bmw', 'audi', 'toyota', 'subaru'] 
for car in cars:
	print(car)
```

- 这行代码让Python从列表cars中取出一个名字，并将其存储在变量car

- for循环后缩进的代码都将执行一次

### 3、2创建数字列表

- range（）+list（）函数

```
numbers = list(range(1,6)) 
print(numbers) 
输出如下：
[1, 2, 3, 4, 5] 
```

- 注：range()函数只会打印到6的前一位数字

- **使用函数range()时，还可指定步长**

```
even_numbers = list(range(2,11,2)) 
print(even_numbers)  
输出如下：
[2, 4, 6, 8, 10] 
```

### 3、3对数字进行统计

- ````
   digits = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]  
   min(digits) 
   0 
   max(digits) 
   9 
   sum(digits) 
   45 
  ````

### 3、4列表解析

```
squares = [value**2 for value in range(1,11)] 
print(squares) 
```

- 首先指定一个描述性的列表名，如squares
- 指定一个左方括号， 并定义一个表达式，用于生成你要存储到列表中的值
- 编写一个for循环，用于给表达式提供值，再加上右方括号

### 3、5切片

- 要创建切片，可指定要使用的第一个元素和最后一个元素的索引
- 与函数range()一样，Python 在到达你指定的**第二个索引前面**的元素后停止
- 可以生成列表的任何子集

```
players = ['charles', 'martina', 'michael', 'florence', 'eli'] 
print(players[1:4]) 
输出如下：
['martina', 'michael', 'florence'] 
```

- 如果没有指定第一个索引，Python将自动从列表开头开始： 

  ```
  players = ['charles', 'martina', 'michael', 'florence', 'eli'] print(players[:4]) 
  ```

  由于没有指定起始索引，Python从列表开头开始提取： 

  ```
  ['charles', 'martina', 'michael', 'florence']
  ```

  要让切片终止于列表末尾，也可使用类似的语法

  如果你要输出名单上的最后三名队员，可使用切片players[-3:]： 

  ```
  players = ['charles', 'martina', 'michael', 'florence', 'eli'] 
  print(players[-3]) 
  ```

### 3、6遍历切片

```
players = ['charles', 'martina', 'michael', 'florence', 'eli'] 
print("Here are the first three players on my team:")
for player in players[:3]:
	print(player.title()) 
```

### 3、7复制列表

- 要复制列表，可创建一个包含整个列表的切片，方法是同时省略起始索引和终止索引（[:]）

   这让Python创建一个始于第一个元素，终止于最后一个元素的切片，即复制整个列表。 

***

## 4、元组

### 4、1定义元组

- 元组看起来犹如列表，但使用圆括号而不是方括号来标识

```
 dimensions = (200, 50) 
 print(dimensions[0]) 
 print(dimensions[1]) 
```

### 4、2修改元组变量

- 虽然不能修改元组的元素，但可以重新定义元组变量值。

```python
 dimensions = (200, 50) 
 print("Original dimensions:") 
 for dimension in dimensions:     
 	print(dimension) 
 
dimensions = (400, 100) 
print("\nModified dimensions:") 
for dimension in dimensions:
	print(dimension)
```

## 5、if语句

- 用 and 和 or 连接不同的条件

### 5、1  if-elif-else 结构 

```
age = 12 
if age < 4:     
	print("Your admission cost is $0.") 
elif age < 18:     
	print("Your admission cost is $5.") 
else:     
	print("Your admission cost is $10.") 
```

## 6、字典

### 6、1使用字典

- 在Python中，字典是一系列键—值对
- 键—值对是两个相关联的值。指定键时，Python将返回与之相关联的值
- 键和值之间用冒号分隔，而键—值对之间用逗号分隔

```pyhton
alien_0 = {'color': 'green', 'points': 5} 
```

### 6、2访问字典中的值

要获取与键相关联的值，可依次指定字典名和放在方括号内的键，如下所示： 

```pyhton
alien_0 = {'color': 'green'} 
print(alien_0['color'])
```

```pyhton
alien_0 = {'color': 'green', 'points': 5} 
new_points = alien_0['points'] 
print("You just earned " + str(new_points) + " points!") 
```

### 6、3添加键-值对

```
alien_0 = {'color': 'green', 'points': 5} 
print(alien_0) 
alien_0['x_position'] = 0
alien_0['y_position'] = 25 
print(alien_0) 
 
```

### 6、4遍历所有键-值对

- 方法items（）

```for key, value in user_0.items(): 
user_0 = {     
	'username': 'efermi',     
	'first': 'enrico',     
	'last': 'fermi',    
    } 
for key, value in user_0.items(): 
    print("\nKey: " + key)    
    print("Value: " + value) 
```

### 6、5遍历字典中所有的键

- 方法keys（）

```
favorite_languages = {     
	'jen': 'python',     
	'sarah': 'c',     
	'edward': 'ruby',    
    'phil': 'python',     
    } 
for name in favorite_languages.keys():
	print(name.title()) 
```

**遍历字典时，会默认遍历所有的键**

**方法keys()并非只能用于遍历；实际上，它返回一个列表，其中包含字典中的所有键**

***

### 6、6遍历字典中所有的值

- 方法values（）

```
favorite_languages = {     
	'jen': 'python',     
	'sarah': 'c',     
	'edward': 'ruby',   
    'phil': 'python', 
    } 
 
print("The following languages have been mentioned:") 
for language in favorite_languages.values():     
	print(language.title()) 
```

- 为剔除值中的重复项，可使用集合（set）

```
favorite_languages = {     
	'jen': 'python',    
    'sarah': 'c',   
    'edward': 'ruby',  
    'phil': 'python',     } 
 
print("The following languages have been mentioned:") 
for language in set(favorite_languages.values()):     
	print(language.title())
```

***

## 7、嵌套

### 7、1字典列表

- 创建字典列表

```
alien_0 = {'color': 'green', 'points': 5} 
alien_1 = {'color': 'yellow', 'points': 10} 
alien_2 = {'color': 'red', 'points': 15} 
aliens = [alien_0, alien_1, alien_2] 
for alien in aliens:     
	print(alien) 
```

### 7、2在字典中存储列表 

```
# 存储所点比萨的信息 
pizza = {     
	'crust': 'thick',     
	'toppings': ['mushrooms', 'extra cheese'],     } 
 
# 概述所点的比萨 
print("You ordered a " + pizza['crust'] + "-crust pizza " +
	"with the following toppings:") 
 
for topping in pizza['toppings']:
	print("\t" + topping)
```

输出如下：

```
You ordered a thick-crust pizza with the following toppings:     
	mushrooms      
	extra cheese 
```

### 7、3在字典中存储字典

```
users = {     
	'aeinstein': {         
		'first': 'albert',         
		'last': 'einstein',       
        'location': 'princeton',     
        }, 
 
    'mcurie': {         
    	'first': 'marie',        
        'last': 'curie',
        'location': 'paris',        
        }, 
 
    } 
 
for username, user_info in users.items(): 
	print("\nUsername: " + username) 
    full_name = user_info['first'] + " " + user_info['last']    
    location = user_info['location'] 
 
	print("\tFull name: " + full_name.title())     
	print("\tLocation: " + location.title()) 
```

输出如下：

```
Username: aeinstein      
	Full name: Albert Einstein      
	Location: Princeton  
 
Username: mcurie      
	Full name: Marie Curie      
	Location: Paris 
```

***

## 8、用户输入和while循环

### 8、1函数input()的工作原理 

```python
message = input("Tell me something, and I will repeat it back to you: ")
print(message) 
```

- 函数input()接受一个参数：即要向用户显示的提示或说明，让用户知道该如何做
- 输入存储在变量message中

```
prompt = "If you tell us who you are, we can personalize the messages you see." 
prompt += "\nWhat is your first name? " 
 
name = input(prompt) 
print("\nHello, " + name + "!") 
```

### 8、2使用int()来获取数值输入 

```
 age = input("How old are you? ")
 How old are you? 21 
 >>> age = int(age)
 >>> age >= 18 
 True 
```

- int将字符串转换为数字表示

```
height = input("How tall are you, in inches? ") 
height = int(height) 
 
if height >= 36:     
	print("\nYou're tall enough to ride!")
else: 
    print("\nYou'll be able to ride when you're a little older.") 
```

### 8、3使用while循环

```
prompt = "\nTell me something, and I will repeat it back to you:" 
prompt += "\nEnter 'quit' to end the program. " 
message = ""
while message != 'quit':     
	message = input(prompt)     
	print(message) 
```

### 8、4在列表之间移动元素

```
# 首先，创建一个待验证用户列表 
# 和一个用于存储已验证用户的空列表 
unconfirmed_users = ['alice', 'brian', 'candace'] 
confirmed_users = [] 
 
# 验证每个用户，直到没有未验证用户为止 
# 将每个经过验证的列表都移到已验证用户列表中  while unconfirmed_users: 
current_user = unconfirmed_users.pop()          
print("Verifying user: " + current_user.title())
confirmed_users.append(current_user)     
# 显示所有已验证的用户 
print("\nThe following users have been confirmed:") 
for confirmed_user in confirmed_users:     
	print(confirmed_user.title()) 
```

输出如下：

```
Verifying user: Candace  
Verifying user: Brian  
Verifying user: Alice  
 
The following users have been confirmed:  
Candace  
Brian  
Alice 
```

## 9、函数

### 9、1使用函数

```Python
def greet_user(): 
	"""显示简单的问候语""" 
	print("Hello!")      
greet_user() 
```

- 使用关键字def来告诉Python你要定义一个 函数
- 定义以冒号结尾
- 第二行代码是被称为文档字符串 （docstring）的注释，描述了函数是做什么的。文档字符串用三引号括起

### 9、2向函数传递信息

```
def greet_user(username):     
	"""显示简单的问候语"""     
	print("Hello, " + username.title() + "!")     
    
greet_user('jesse') 
```

### 9、3传递实参

#### 9、3、1位置实参

```
def describe_pet(animal_type, pet_name):     
	"""显示宠物的信息"""     
	print("\nI have a " + animal_type + ".")     
	print("My " + animal_type + "'s name is " + pet_name.title() + ".")
describe_pet('hamster', 'harry') 
```

#### 9、3、2关键字实参

```
def describe_pet(animal_type, pet_name):     
	"""显示宠物的信息"""     
	print("\nI have a " + animal_type + ".")     
	print("My " + animal_type + "'s name is " + pet_name.title() + ".")      describe_pet(animal_type='hamster', pet_name='harry') 
```

#### 9、3、3默认值

```python
def describe_pet(pet_name, animal_type='dog'):     
	"""显示宠物的信息"""     
	print("\nI have a " + animal_type + ".")     
	print("My " + animal_type + "'s name is " + pet_name.title() + ".") 
describe_pet(pet_name='willie') 
```

**注意：使用默认值时，在形参列表中必须先列出没有默认值的形参，再列出有默认值的实参。 这让Python依然能够正确地解读位置实参**

### 9、4返回值

#### 9、4、1返回简单值

```python
def get_formatted_name(first_name, last_name):    
 	"""返回整洁的姓名""" 
    full_name = first_name + ' ' + last_name 
    return full_name.title() 
 
musician = get_formatted_name('jimi', 'hendrix') 
print(musician) 
```

#### 9、4、2可选实参

```python
def get_formatted_name(first_name, last_name, middle_name=''):     
 	"""返回整洁的姓名""" 
    if middle_name:         
    	full_name = first_name + ' ' + middle_name + ' ' + last_name 
    else:         
    	full_name = first_name + ' ' + last_name     
    return full_name.title() 
 
musician = get_formatted_name('jimi', 'hendrix') 
print(musician) 

musician = get_formatted_name('john', 'hooker', 'lee') 
print(musician) 
```

#### 9、4、3返回字典

```python
def build_person(first_name, last_name):     
	"""返回一个字典，其中包含有关一个人的信息""" 
    person = {'first': first_name, 'last': last_name} 
    return person 
 
musician = build_person('jimi', 'hendrix') 
print(musician) 
```

#### 9、4、4 结合使用函数和 while 循环 

```python
def get_formatted_name(first_name, last_name):     
    	"""返回整洁的姓名"""     
        full_name = first_name + ' ' + last_name     
        return full_name.title() 
 
while True:    
    print("\nPlease tell me your name:") 
    print("(enter 'q' at any time to quit)") 
    f_name = input("First name: ") 
    if f_name == 'q':        
        break 
    l_name = input("Last name: ")  
    if l_name == 'q':         
        break   
    formatted_name = get_formatted_name(f_name, l_name)      
    print("\nHello, " + formatted_name + "!") 
```

### 9、5传递列表

```python
def print_models(unprinted_designs, completed_models):     
    """模拟打印每个设计，直到没有未打印的设计为止,打印每个设计后，都将其移到列表completed_models中"""     while unprinted_designs:         
        current_design = unprinted_designs.pop()              
        # 模拟根据设计制作3D打印模型的过程         
        print("Printing model: " + current_design)         
        completed_models.append(current_design) 
        
def show_completed_models(completed_models):     
    """显示打印好的所有模型"""     
    print("\nThe following models have been printed:")     
    for completed_model in completed_models:         
        print(completed_model)   
     
unprinted_designs = ['iphone case', 'robot pendant', 'dodecahedron'] 
completed_models = [] 
print_models(unprinted_designs, completed_models) 
show_completed_models(completed_models) 
```

### 9、6传递任意数量的实参

```python
def make_pizza(*toppings):     
    """打印顾客点的所有配料"""     
    print(toppings)    
    
make_pizza('pepperoni') 
make_pizza('mushrooms', 'green peppers', 'extra cheese') 
```

- 形参名*toppings中的星号让Python创建一个名为toppings的空元组，并将收到的所有值都封装到这个元组中
- 函数体内的print语句通过生成输出来证明Python能够处理使用一个值调用函数的情形，也能处理使用三个值来调用函数的情形

### 9、7结合使用位置实参和任意数量实参 

- 必须在函数定义中将接纳任意数量实参的形参放在后

```python
def make_pizza(size, *toppings):      
    """概述要制作的比萨"""     
    print("\nMaking a " + str(size) +            
          "-inch pizza with the following toppings:")      
    for topping in toppings:         
        print("- " + topping)  
        
make_pizza(16, 'pepperoni')  
make_pizza(12, 'mushrooms', 'green peppers', 'extra cheese') 
```

### 9、8使用任意数量的关键字实参 

- 将函数编写成能够接受任意数量的键—值对

```python
def build_profile(first, last, **user_info):     
    """创建一个字典，其中包含我们知道的有关用户的一切"""     
    profile = {} 
    profile['first_name'] = first     
    profile['last_name'] = last 
    for key, value in user_info.items(): 
        profile[key] = value
	return profile 
    
user_profile = build_profile('albert', 'einstein',                              
                             location='princeton',                              
                             field='physics') 
print(user_profile) 
```

- 形参**\*\*user_info**中的两个星号让Python创建一个名为user_info的空字典

### 9、9将函数存储在模块中 

- 将函数存储在被称为模块的独立文件中，再将模块导入到主程序中
- import语句允许在当前运行的程序文件中使用模块中的代码

#### 9、9、1导入整个模块 

- 下面来创建一个包含函数make_pizza()的模块

```python
def make_pizza(size, *toppings):     
    """概述要制作的比萨"""    
    print("\nMaking a " + str(size) +          
          "-inch pizza with the following toppings:")     
    for topping in toppings:        
        print("- " + topping) 
```

- 接下来，我们在pizza.py所在的目录中创建另一个名为making_pizzas.py的文件，这个文件导 入刚创建的模块，再调用make_pizza()两次

```python
import pizza 
 
pizza.make_pizza(16, 'pepperoni') 
pizza.make_pizza(12, 'mushrooms', 'green peppers', 'extra cheese')
```

- 代码行import pizza让Python打开文件pizza.py，并将其中的所有函 数都复制到这个程序中
- 指定导入的模块的名称pizza和函数名make_pizza()，并用句点分隔它们

#### 9、9、2导入特定的函数 

- 你还可以导入模块中的特定函数，这种导入方法的语法如下

```python
from module_name import function_name
```

- 通过用逗号分隔函数名，可根据需要从模块中导入任意数量的函数

```python
from module_name import function_0 , function_1 , function_2
```

#### 9、9、3使用as 给函数指定别名 

> 如果要导入的函数的名称可能与程序中现有的名称冲突，或者函数的名称太长，可指定简短 而独一无二的别名——函数的另一个名称，类似于外号

- 下面给函数make_pizza()指定了别名mp()

````python
from pizza import make_pizza as mp 
 
mp(16, 'pepperoni') 
mp(12, 'mushrooms', 'green peppers', 'extra cheese') 
````

#### 9、9、4使用as 给模块指定别名 

```python
import pizza as p 
 
p.make_pizza(16, 'pepperoni') 
p.make_pizza(12, 'mushrooms', 'green peppers', 'extra cheese') 
```

#### 9、9、5导入模块中的所有函数 

```python
from pizza import * 
 
make_pizza(16, 'pepperoni') 
make_pizza(12, 'mushrooms', 'green peppers', 'extra cheese') 
```

- import语句中的星号让Python将模块pizza中的每个函数都复制到这个程序文件中

没事最好别用这玩意，容易出错

****

## 10、类

- 在面向对象编程中， 你编写表示现实世界中的事物和情景的类，并基于这些类来创建对象。 编写类时，你定义一大类对象都有的通用行为
- 基于类创建对象时， 每个对象都自动具备这种通用行为，然后可根据需要赋予每个对象独特的个性

***

### 10、1创建和使用类

> 使用类几乎可以模拟任何东西

下面来编写一个表示小狗的简单类Dog——它表示的不是特定的小狗，而是任何小狗

- 对于大多数宠物狗，我们都知道些什么呢？它们都有名字和年龄；
- 我们还知道，大多数小狗还会蹲下和打滚。

#### 10、1、1创建dog类

- 根据Dog类创建的每个实例都将存储名字和年龄
- 我们赋予了每条小狗蹲下（sit()）和打滚 （roll_over()）的能力： 

```python
 class Dog(): 
        """一次模拟小狗的简单尝试"""      
        def __init__(self, name, age):         
            """初始化属性name和age""" 
            self.name = name         
            self.age = age          
        def sit(self):        
            """模拟小狗被命令时蹲下"""         
            print(self.name.title() + " is now sitting.") 
 
    	def roll_over(self):         
        	"""模拟小狗被命令时打滚"""        
            print(self.name.title() + " rolled over!") 
```

- 在Python中，首字母大写的名称指的是类

> 1. 方法**\_\_init\_\_() **
>
>    - 类中的函数称为方法；
>    - 你前面学到的有关函数的一切都适用于方法
>    - 就目前而言，唯一重要的差别是调用方法的方式
>
>    方法\_\_init\_\_()是一个特殊的方法，每当你根据Dog类创建新实 例时，Python都会自动运行它
>
>    > **在这个方法的名称中，开头和末尾各有两个下划线，这是一种约定，旨在避免Python默认方法与普通方法发生名称冲突**
>
>    2、方法**\_\_init\_\_()**定义成了包含三个形参：self、name和age
>
>    - 形参self必不可少，还必须位于其他形参的前面
>    - 每个与类相关联的方法调用都自动传递实参self，它是一个指向实例本身的引用，让实例能够访问类中的属性和方法。 
>    - 定义的两个变量都有前缀self , **以self为前缀的变量都可供类中的所有方法使用**
>    - **self.name = name**获取存储在形参name中的值，并将 其存储到变量name中，然后该变量被关联到当前创建的实例

#### 10、1、2根据类创建实例

- 可将类视为有关如何创建实例的说明
- Dog类是一系列说明，让Python知道如何创建表示特 定小狗的实例

```python
class Dog():     
    -snip --          
my_dog = Dog('willie', 6) 
 
print("My dog's name is " + my_dog.name.title() + ".") 
print("My dog is " + str(my_dog.age) + " years old.") 
```

- 方法 \_\_init\_\_()并未显式地包含return语句，但Python自动返回一个表示这条小狗的实例
- 我们将这个实例存储在变量my_dog中

1、访问属性

- 要访问实例的属性，可使用句点表示法

```python
my_dog.name 
```

2、调用方法

```python
class Dog():     
    -snip -- 
 
my_dog = Dog('willie', 6)
my_dog.sit() 
my_dog.roll_over()
```

3、创建多个实例

```python
class Dog():     
    --snip -- 
 
my_dog = Dog('willie', 6) 
your_dog = Dog('lucy', 3) 
 
print("My dog's name is " + my_dog.name.title() + ".") 
print("My dog is " + str(my_dog.age) + " years old.") 
my_dog.sit() 
 
print("\nYour dog's name is " + your_dog.name.title() + ".") 
print("Your dog is " + str(your_dog.age) + " years old.") 
your_dog.sit()
```

***

### 10、2使用类和实例

- 类编写好后，你的大部分时间都将花在使用根据类创建的实例上

- 你需要执行的一个重要任务是修改实例的属性。你可以直接修改实例的属性， 也可以编写方法以特定的方式进行修改。 

#### 10、2、1Car类

- 下面来编写一个表示汽车的类，它存储了有关汽车的信息，还有一个汇总这些信息的方法

```python
class Car():     
    """一次模拟汽车的简单尝试""" 
	def __init__(self, make, model, year):         
        """初始化描述汽车的属性"""         
        self.make = make         
        self.model = model         
        self.year = year          
    def get_descriptive_name(self):         
        """返回整洁的描述性信息"""         
        long_name = str(self.year) + ' ' + self.make + ' ' + self.model        
        return long_name.title()  
    
my_new_car = Car('audi', 'a4', 2016) 
print(my_new_car.get_descriptive_name()) 
```

- 创建新的Car实例时，我们需要指定其制造商、型号和生产年份

#### 10、2、2给属性指定默认值

- 类中的每个属性都必须有初始值，哪怕这个值是0或空字符串
- 在有些情况下，如设置默认值时，在方法\_\_init\_\_()内指定这种初始值是可行的；如果你对某个属性这样做了，就无需包含为它提供初始值的形参

```python
class Car():          
    def __init__(self, make, model, year):         
        """初始化描述汽车的属性"""         
        self.make = make         
        self.model = model         
        self.year = year         
        self.odometer_reading = 0              
    def get_descriptive_name(self):         
        -snip --      
    def read_odometer(self):         
        """打印一条指出汽车里程的消息"""   
        print("This car has " + str(self.odometer_reading) + " miles on it.") 
        
my_new_car = Car('audi', 'a4', 2016) 
print(my_new_car.get_descriptive_name())
my_new_car.read_odometer() 
```

#### 10、2、3修改属性的值

- 可以以三种不同的方式修改属性的值：
  - 直接通过实例进行修改
  - 通过方法进行设置
  - 通过方法进行递增（增加特定的值）

1、直接修改属性的值

```python
class Car():     
    -snip --      
my_new_car = Car('audi', 'a4', 2016) 
print(my_new_car.get_descriptive_name()) 
my_new_car.odometer_reading = 23 
my_new_car.read_odometer() 
```

2. 通过方法修改属性的值 

- 无需直接访问属性，而可将值传递给 一个方法，由它在内部进行更新

```python
def update_odometer(self, mileage):         
    """将里程表读数设置为指定的值"""         
    self.odometer_reading = mileage 
    
my_new_car.update_odometer(23) 
```

- 可对方法update_odometer()进行扩展，使其在修改里程表读数时做些额外的工作。下面来添 加一些逻辑，禁止任何人将里程表读数往回调： 

```python
def update_odometer(self, mileage):         
    """         
    将里程表读数设置为指定的值         
    禁止将里程表读数往回调         
    """
    if mileage >= self.odometer_reading:             
    	self.odometer_reading = mileage         
    else:             
        print("You can't roll back an odometer!") 
```

3. 通过方法对属性的值进行递增 

```python
def increment_odometer(self, miles):         
    """将里程表读数增加指定的量"""         
    self.odometer_reading += miles 
    
my_used_car = Car('subaru', 'outback', 2013) 
print(my_used_car.get_descriptive_name()) 

my_used_car.update_odometer(23500)
my_used_car.read_odometer() 

my_used_car.increment_odometer(100)
my_used_car.read_odometer() 
```

***

### 10、3继承

- 一个类继承另一个类时，它将自动获得另一个类的所有属性和方法
- 原有的类称为父类， 而新类称为子类
- 子类继承了其父类的所有属性和方法，同时还可以定义自己的属性和方法。 

#### 10、3、1子类的方法\_\_init()\_\_

- 创建子类的实例时，Python首先需要完成的任务是给父类的所有属性赋值

电动汽车是一种特殊的汽车，因此我们可以在前面创建的Car 类的基础上创建新类ElectricCar，这样我们就只需为电动汽车特有的属性和行为编写代码。 

```python
class Car():     
    """一次模拟汽车的简单尝试""" 
 
    def __init__(self, make, model, year):         
        self.make = make         
        self.model = model
        self.year = year
        self.odometer_reading = 0              
    def get_descriptive_name(self):         
        long_name = str(self.year) + ' ' + self.make + ' ' + self.model        
        return long_name.title()          
    def read_odometer(self):        
        print("This car has " + str(self.odometer_reading) + " miles on it.")              
    def update_odometer(self, mileage):         
        if mileage >= self.odometer_reading:             
            self.odometer_reading = mileage         
        else:            
            print("You can't roll back an odometer!")          
    def increment_odometer(self, miles):         
                self.odometer_reading += miles
            
#定义子类时，必须在括号内指定父类的名称
class ElectricCar(Car):     
    """电动汽车的独特之处"""      
    def __init__(self, make, model, year):         
        """初始化父类的属性"""         
        super().__init__(make, model, year)          
#super()是一个特殊函数，帮助Python将父类和子类关联起来
#这行代码让Python调用ElectricCar的父类的方法__init__()，让ElectricCar实例包含父类的所有属性

my_tesla = ElectricCar('tesla', 'model s', 2016) 
print(my_tesla.get_descriptive_name())
```

- 创建子类时，父类必须包含在当前文件中，且位于子类前面
- 定义子类时，必须在括号内指定父类的名称

#### 10、3、2给子类定义属性和方法

- 下面来添加一个电动汽车特有的属性（电瓶），以及一个描述该属性的方法。我们将存储电 瓶容量，并编写一个打印电瓶描述的方法： 

```python
class Car():     
    -snip --         
 
class ElectricCar(Car):     
    """Represent aspects of a car, specific to electric vehicles.""" 
 
    def __init__(self, make, model, year):         
        """         
        电动汽车的独特之处         
        初始化父类的属性，再初始化电动汽车特有的属性        
        """         
        super().__init__(make, model, year) 
        self.battery_size = 70          
    def describe_battery(self):         
        """打印一条描述电瓶容量的消息"""         
        print("This car has a " + str(self.battery_size) + "-kWh battery.") 
 
my_tesla = ElectricCar('tesla', 'model s', 2016) 
print(my_tesla.get_descriptive_name()) 
my_tesla.describe_battery()
```

#### 10、3、3重写父类的方法

- 可在子 类中定义一个这样的方法，即它与要重写的父类方法同名。这样，Python将不会考虑这个父类方法，而只关注你在子类中定义的相应方法

> 假设Car类有一个名为fill_gas_tank()的方法，它对全电动汽车来说毫无意义，因此你可能 想重写它。下面演示了一种重写方式： 

```python
def ElectricCar(Car):     
	-snip -- 
 
    def fill_gas_tank():         
        """电动汽车没有油箱"""        
        print("This car doesn't need a gas tank!") 
```

#### 10、3、4将实例用作属性

- 不断给ElectricCar类添加细节时，我们可能会发现其中包含很多专门针对汽车电瓶 的属性和方法
- 在这种情况下，我们可将这些属性和方法提取出来，放到另一个名为Battery的类中，并将一个Battery实例用作ElectricCar类的一个属性

```python
class Car():     
    -snip --  
    
class Battery():     
    """一次模拟电动汽车电瓶的简单尝试"""      
    def __init__(self, battery_size=70): 
    	#除 self外，还有另一个形参battery_size
        """初始化电瓶的属性"""        
        self.battery_size = battery_size 
    
    def describe_battery(self):         
        """打印一条描述电瓶容量的消息"""         
        print("This car has a " + str(self.battery_size) + "-kWh battery.")     
        
class ElectricCar(Car):     
            """电动汽车的独特之处""" 
 	def __init__(self, make, model, year):         
        """ 初始化父类的属性，再初始化电动汽车特有的属性 """       
        super().__init__(make, model, year)         
        self.battery = Battery()          
        #这行代码让Python创建一个新的Battery实例（由于没有指定尺寸，因此为默认值70）
        #并将该实例存储在属性 self.battery中
my_tesla = ElectricCar('tesla', 'model s', 2016) 

print(my_tesla.get_descriptive_name()) 
my_tesla.battery.describe_battery()
```

- 我们定义了一个名为Battery的新类，它没有继承任何类

***

### 10、4导入类

- 随着你不断地给类添加功能，文件可能变得很长，即便你妥善地使用了继承亦如此。
- 为遵循 Python的总体理念，应让文件尽可能整洁。为在这方面提供帮助，Python允许你将类存储在模块中，然后在主程序中导入所需的模块。 

***

#### 10、4、1导入单个类 

- 创建文件car.py，写入Car类
- 创建另一个文件——my_car.py

```python
from car import Car 
 
my_new_car = Car('audi', 'a4', 2016) 
print(my_new_car.get_descriptive_name()) 
 
my_new_car.odometer_reading = 23 
my_new_car.read_odometer()
```

- import语句让Python打开模块car，并导入其中的Car类

#### 10、4、2 在一个模块中存储多个类 

- 类Battery和ElectricCar都可帮助模拟汽车，因此下面将它们都加入模块car.py中： 

```python
"""一组用于表示燃油汽车和电动汽车的类""" 
 
class Car():     
    -snip --  
    
class Battery():     
    """一次模拟电动汽车电瓶的简单尝试""" 
 
    def __init__(self, battery_size=60):         
        """初始化电瓶的属性"""         
        self.battery_size = battery_size 
 
    def describe_battery(self):         
        """打印一条描述电瓶容量的消息"""         
        print("This car has a " + str(self.battery_size) + "-kWh battery.")                
    def get_range(self):         
        """打印一条描述电瓶续航里程的消息"""         
        if self.battery_size == 70:             
            range = 240        
        elif self.battery_size == 85:            
            range = 270                      
            message = "This car can go approximately " + str(range)         
            message += " miles on a full charge."         
            print(message)      
class ElectricCar(Car):     
     """模拟电动汽车的独特之处""" 
     def __init__(self, make, model, year):         
     """         初始化父类的属性，再初始化电动汽车特有的属性         """
     super().__init__(make, model, year)         
     self.battery = Battery() 
```

- 现在，可以新建一个名为my_electric_car.py的文件，导入ElectricCar类，并创建一辆电动汽 车了： 

```python
from car import ElectricCar 
 
my_tesla = ElectricCar('tesla', 'model s', 2016) 
 
print(my_tesla.get_descriptive_name()) 
my_tesla.battery.describe_battery() 
my_tesla.battery.get_range() 
 
```

#### 10、4、3从一个模块中导入多个类 

- 如果我们要在同一个程序中创建普通汽车和电动汽车，就需要将Car和ElectricCar类都导入

```python
from car import Car, ElectricCar 

my_beetle = Car('volkswagen', 'beetle', 2016) 
print(my_beetle.get_descriptive_name()) 
my_tesla = ElectricCar('tesla', 'roadster', 2016) 
print(my_tesla.get_descriptive_name()) 
```

- 从一个模块中导入多个类时，用逗号分隔了各个类

#### 10、4、4导入整个模块 

- 导入整个模块，再使用句点表示法访问需要的类
- 这种导入方法很简单，代码也易于阅读
- 由于创建类实例的代码都包含模块名，因此不会与当前文件使用的任何名称发生冲突

```python
import car 

my_beetle = car.Car('volkswagen', 'beetle', 2016) 
print(my_beetle.get_descriptive_name()) 
 
my_tesla = car.ElectricCar('tesla', 'roadster', 2016) 
print(my_tesla.get_descriptive_name()) 
```

#### 10、4、5导入模块中的所有类 

- 要导入模块中的每个类，可使用下面的语法： 

  **from module_name import \* **

**不推荐使用这种导入方式**

***

#### 10、4、6在一个模块中导入另一个模块 

```python
"""一组可用于表示电动汽车的类""" 
from car import Car 
 
class Battery():     
    -snip --              
    
class ElectricCar(Car):     
    -snip -- 
```

### 10、5 Python标准库 

Python标准库是一组模块，安装的Python都包含它。你现在对类的工作原理已有大致的了解， 可以开始使用其他程序员编写好的模块了。可使用标准库中的任何函数和类，为此只需在程序开 头包含一条简单的import语句

- 模块 random 包含以各种方式生成随机数的函数，其中的 randint()返回 一个位于指定范围内的整数，例如，下面的代码返回一个 1~6内的整数： 

```python
from random import randint 
x = randint(1, 6) 
```

***

Python Module of the Week：

要了解 Python标准库，一个很不错的资源是网 站 Python Module of the Week。

请访问 http://pymotw.com/并查看其中的目录，在其中找 一个你感兴趣的模块进行探索，或阅读模块 collections 和 random 的文档。 

***

### 10、6 类编码风格 

- 类名应采用驼峰命名法，即将类名中的**每个单词的首字母都大写**，而不使用下划线。实例名和模块名都采用小写格式，并在单词之间加上下划线

- 对于每个类，都应紧跟在类定义后面包含一个文档字符串。这种文档字符串简要地描述类的功能，并遵循编写函数的文档字符串时采用的格式约定。每个模块也都应包含一个文档字符串， 对其中的类可用于做什么进行描述。 

- 在类中，可使用**一个空行来分隔方法**；而在模块中， 可使用**两个空行来分隔类**

- 需要同时导入标准库中的模块和你编写的模块时，先编写导入标准库模块的import语句，再 添加一个空行，然后编写导入你自己编写的模块的import语句。在包含多条import语句的程序中， 这种做法让人更容易明白程序使用的各个模块都来自何方

***

## 11、文件和异常

**学习处理文件和保存数据可让你的程序使用起来更容易：**

**用户将能够选择输入什么样的数据，以及在什么时候输入；**

**用户使用你的程序做一些工作后，可将程序关闭，以后再接着往下做**

***

### 11、1从文件中读取数据

#### 11、1、1读取整个文件 

- 首先来创建一个文件，它包含精确到小数 点后30位的圆周率值，且在小数点后每10位处都换行：

```python
pi_digits.txt 
3.1415926535    
  8979323846    
  2643383279 
```

- 下面的程序打开并读取这个文件，再将其内容显示到屏幕上： 

```python
with open('pi_digits.txt') as file_object:     
	contents = file_object.read()    
	print(contents) 
 
```

- 函数open()接受一个参数： 要打开的文件的名称。Python在当前执行的文件所在的目录中查找指定的文件

- 函数open() 返回一个表示文件的对象。在这里，open('pi_digits.txt')返回一个表示文件pi_digits.txt的对象；Python将这个对象存储在我们将在后面使用的变量中 file_object

- 关键字with在不再需要访问文件后将其关闭

- 使用方法**read()**读取这个文 件的全部内容，并将其作为一个长长的字符串存储在变量contents中。这样，通过打印contents 的值，就可将这个文本文件的全部内容显示出来

- 相比于原始文件，该输出唯一不同的地方是末尾多了一个空行。为何会多出这个空行呢？因 为read()到达文件末尾时返回一个空字符串，而将这个空字符串显示出来时就是一个空行

***

#### 11、1、2文件路径

- 要让Python打开不与程序文件位于同一个目录中的文 件，需要提供文件路径，它让Python到系统的特定位置去查找。 

```python
with open('text_files\ filename.txt') as file_object: 
```

- 你还可以将文件在计算机中的准确位置告诉Python，这样就不用关心当前运行的程序存储在什么地方了。这称为绝对文件路径
- 绝对路径通常比相对路径更长，因此将其存储在一个变量中，再将该变量传递给open()会有 所帮助

```python
file_path = 'C:\Users\ehmatthes\other_files\text_files\ filename .txt' 
with open(file_path) as file_object:
```

#### 11、1、3逐行读取

- 要以每次一行的方式检查文件，可对文件对象使用for循环

```python
filename = 'pi_digits.txt' 
with open(filename) as file_object: 
    for line in file_object:        
        print(line) 
```

#### 11、1、4创建一个包含文件各行内容的列表 

- 下面的示例在with代码块中将文件pi_digits.txt的各行存储在一个列表中，再在with代码块外打印它们： 

```python
filename = 'pi_digits.txt' 
 
with open(filename) as file_object: 
    lines = file_object.readlines() 
 
for line in lines:    
    print(line.rstrip()) 
```

- 方法readlines()从文件中读取每一行，并将其存储在一个列表中
- 接下来，该列表被 存储到变量lines中
- 在with代码块外，我们依然可以使用这个变量。

**由于列表lines的每个元素都对应于文件中的一行，因此输出与文件内容完全一致 **

***

#### 11、1、5使用文件的内容 

- 首先，我们将创建一个字符串，它包含文件中存储的所有数字，且没有任何空格

```python
filename = 'pi_digits.txt' 
 
with open(filename) as file_object:     
    lines = file_object.readlines() 
 
pi_string = '' 
for line in lines:     
    pi_string += line.rstrip()  
    
print(pi_string) 
print(len(pi_string)) 
```

**注：读取文本文件时，Python将其中的所有文本都解读为字符串。如果你读取的是数字，并要将其作为数值使用，就必须使用函数int()将其转换为整数，或使用函数float()将其转换为浮点数**

***

#### 11、1、6圆周率值中包含你的生日吗 

```python
filename = 'pi_million_digits.txt' 
 
with open(filename) as file_object:     
    lines = file_object.readlines() 

pi_string = '' 
for line in lines:     
    pi_string += line.rstrip() 
 
birthday = input("Enter your birthday, in the form mmddyy: ") 
if birthday in pi_string:     
    print("Your birthday appears in the first million digits of pi!") 
else:     
    print("Your birthday does not appear in the first million digits of pi.")
```

***

### 11、2写入文件

#### 11、2、1写入空文件

- 要将文本写入文件，你在调用open()时需要提供另一个实参，告诉Python你要写入打开的文件。

```python
filename = 'programming.txt' 
 
with open(filename, 'w') as file_object: 
    file_object.write("I love programming.") 
```

- 第一个实参也是要打开的文件的名称
-  第二个实参（'w'）告诉Python，我们要以写入模式打开这个文件。

**以写入（'w'）模式打开文件时千万要小心，因为如果指定的文件已经存在，Python将在返回文件对象前清空该文件**

***注：Python只能将字符串写入文本文件。要将数值数据存储到文本文件中，必须先使用函数 str()将其转换为字符串格式***

***

#### 11、2、2写入多行 

- 函数write()不会在你写入的文本末尾添加换行符

```python
filename = 'programming.txt' 
 
with open(filename, 'w') as file_object:     
    file_object.write("I love programming.")     
    file_object.write("I love creating new games.") 
```

则输出如下：

```python
I love programming.I love creating new games. 
```

要让每个字符串都单独占一行，需要在write()语句中包含换行符： 

```python
filename = 'programming.txt' 

with open(filename, 'w') as file_object:     
    file_object.write("I love programming.\n")     
    file_object.write("I love creating new games.\n") 
```

#### 11、2、3附加到文件 

- 以附加模式打开文件

```python
filename = 'programming.txt' 
 
with open(filename, 'a') as file_object: 
    file_object.write("I also love finding meaning in large datasets.\n")    
    file_object.write("I love creating apps that can run in a browser.\n") 
 
```

***

### 11、3异常

#### 11、3、1使用try-except 代码块 

处理ZeroDivisionError异常的try-except代码块类似于下面这样： 

```python
try:     
    print(5/0) 
except ZeroDivisionError:    
    print("You can't divide by zero!") 
```

#### 11、3、2 else 代码块 

````python
try:         
    answer = int(first_number) / int(second_number) 
except ZeroDivisionError:         
    print("You can't divide by 0!") 
else:         
    print(answer) 
````

- 让Python尝试执行try代码块中的除法运算，这个代码块只包含可能导致错误的代码。
- 依赖于try代码块成功执行的代码都放在else代码块中
- 在这个示例中，如果除法运算成功，我们就使用else代码块来打印结果

#### 11、3、3分析文本 

- 下面来提取童话Alice in Wonderland的文本，并尝试计算它包含多少个单词。
- 我们将使用方法split()，它根据一个字符串创建一个单词列表。
- 下面是对只包含童话名"Alice in Wonderland" 的字符串调用方法split()的结果： 

```python
title = "Alice in Wonderland"  
title.split()  
['Alice', 'in', 'Wonderland']  
```

**方法split()以空格为分隔符将字符串分拆成多个部分，并将这些部分都存储到一个列表中**

- 为计算Alice in Wonderland包含多少个单词，我们将对整篇小说调用split()，再计算得到的列表包含多少个元 素，从而确定整篇童话大致包含多少个单词：

```python
filename = 'alice.txt' 
 
try:    
    with open(filename) as f_obj:        
        contents = f_obj.read() 
except FileNotFoundError: 
        msg = "Sorry, the file " + filename + " does not exist."     
        print(msg) 
else:     # 计算文件大致包含多少个单词 
    words = contents.split() 
    num_words = len(words) 
    print("The file " + filename + " has about " + str(num_words) + " words.") 
```

#### 11、3、4pass语句

- 有时候你希望程序在发生异常时一声不吭，就像什么都没有发生一样继续运行。

```python
try:         
    --snip--     
except FileNotFoundError:          
    pass     
else:         
    --snip-- 
```

- Python有一个pass语句，可在代码块中使用它来让Python什么都不要做

***

### 11、4存储数据

JSON（JavaScript Object Notation）格式初是为JavaScript开发的，但随后成了一种常见格式，被包括Python在内的众多语言采用。 

#### 11、4、1 使用json.dump()和 json.load() 

- 函数json.dump()接受两个实参：要存储的数据以及可用于存储数据的文件对象。

```python
import json 
 
numbers = [2, 3, 5, 7, 11, 13] 
 
filename = 'numbers.json' 
with open(filename, 'w') as f_obj: 
    json.dump(numbers, f_obj) 
```

- 下面再编写一个程序，使用json.load()将这个列表读取到内存中： 

```python
import json 
 
filename = 'numbers.json' 
with open(filename) as f_obj: 
    numbers = json.load(f_obj)      
    print(numbers) 
```

#### 11、4、2保存和读取用户生成的数据 

- 我们将尝试从文件username.json中获取用户名，因此我们首先编写一个尝试恢复用户名的try代码块
- 如果这个文件不存在，我们就在except代码块中提示用户输入用户名，并将其存储在username.json 中，以便程序再次运行时能够获取它

```python
import json 
 
# 如果以前存储了用户名，就加载它 
# 否则，就提示用户输入用户名并存储它
filename = 'username.json' 
try: 
    with open(filename) as f_obj: 
        username = json.load(f_obj) 
except FileNotFoundError:
    username = input("What is your name? ") 
	with open(filename, 'w') as f_obj:         
    	json.dump(username, f_obj)         
    	print("We'll remember you when you come back, " + username + "!") 
else:     
        print("Welcome back, " + username + "!") 
```

#### 11、4、3重构

- 代码能够正确地运行，但可做进一步的改进——将代码划分为 一系列完成具体工作的函数。这样的过程被称为重构。重构让代码更清晰、更易于理解、更容 易扩展。

```python
import json 
 
def get_stored_username():     
    """如果存储了用户名，就获取它"""     
    filename = 'username.json'     
    try:         
        with open(filename) as f_obj:            
            username = json.load(f_obj)    
    except FileNotFoundError: 
        return None     
    else:         
        return username
 
def get_new_username():     
    """提示用户输入用户名"""     
    username = input("What is your name? ")     
    filename = 'username.json'     
    with open(filename, 'w') as f_obj:         
        json.dump(username, f_obj)     
    return username 
 
def greet_user():     
    """问候用户，并指出其名字"""     
    username = get_stored_username()     
    if username:        
        print("Welcome back, " + username + "!")    
    else:        
        username = get_new_username()         
        print("We'll remember you when you come back, " + username + "!") 
 
greet_user()
```

***

## 12、测试代码

### 12、1测试函数

- 要学习测试，得有要测试的代码。下面是一个简单的函数，它接受名和姓并返回整洁的姓名

```python
def get_formatted_name(first, last):     
    """Generate a neatly formatted full name."""     
    full_name = first + ' ' + last    
    return full_name.title() 
```

- 为核实get_formatted_name() 像期望的那样工作，我们来编写一个 使用这个函数的程序
- 程序names.py让用户输入名和姓 , 并显示整洁的全名： 

```python
from name_function import get_formatted_name 
print("Enter 'q' at any time to quit.") 
while True:     
    first = input("\nPlease give me a first name: ")     
    if first == 'q':         
        break     
        last = input("Please give me a last name: ")     
    if last == 'q':        
        break     
        
	formatted_name = get_formatted_name(first, last)     
	print("\tNeatly formatted name: " + formatted_name + '.') 
```

#### 12、1、2单元测试和测试用例 

```python
import unittest 
from name_function import get_formatted_name 
 
class NamesTestCase(unittest.TestCase):     
    """测试name_function.py"""          
    def test_first_last_name(self):         
        """能够正确地处理像Janis Joplin这样的姓名吗？""" 
        formatted_name = get_formatted_name('janis', 'joplin') 
        self.assertEqual(formatted_name, 'Janis Joplin') 
        
unittest.main()
```

- 首先，我们导入了**模块unittest**和要测试的函数**get_formatted_ name()** 
- 我们创建了一个名为NamesTestCase的类，用于包含一系列针对get_formatted_name()的单元测试。你可随便给这个类命名，但最好让它看起来与要测试的函数相关，并包含字样Test。这个类必须继承**unittest.TestCase**类，这样Python才知道如何运行你编写的测试。 

***

- NamesTestCase只包含一个方法，用于测试get_formatted_name()的一个方面。我们将这个方 法命名为test_first_last_name()，因为我们要核实的是只有名和姓的姓名能否被正确地格式化
- 我们使用了unittest类最有用的功能之一：一个断言方法。断言方法用来核实得到的结果是否与期望的结果一致。

***

- 我们调用unittest的方法assertEqual()，并向它传递formatted_ name和'Janis Joplin'。
- 代码行**self.assertEqual(formatted_name, 'Janis Joplin')**的意思是说： “将formatted_name的值同字符串'Janis Joplin'进行比较，如果它们相等，就万事大吉，如果它们不相等，跟我说一声！

***

- 代码行unittest.main()让Python运行这个文件中的测试。运行test_name_function.py时，得到的输出如下： 

```
. 
---------------------------------------------------------------------- 
Ran 1 test in 0.000s 
OK 
```

***

#### 12、1、3不能通过的测试 

- 

```python
 E  
======================================================================   
ERROR: test_first_last_name (__main__.NamesTestCase)  
----------------------------------------------------------------------  
Traceback (most recent call last):    
    File "test_name_function.py", line 8, in test_first_last_name     
    formatted_name = get_formatted_name('janis', 'joplin')  
    TypeError: get_formatted_name() missing 1 required positional argument: 'last'  
 
----------------------------------------------------------------------  
Ran 1 test in 0.000s 
FAILED (errors=1) 
```

- 第1行输出只 有一个字母E，它指出测试用例中有一个单元测试导致了错误
- 接下来，我们看到 NamesTestCase中的test_first_last_name()导致了错误
- traceback，它指出函数调用 get_formatted_name('janis', 'joplin')有问题，因为它缺少一个必不可少的位置实参

#### 12、1、4添加新测试

```python
import unittest from name_function 
import get_formatted_name 
 
class NamesTestCase(unittest.TestCase):     
    """测试name_function.py """          
    def test_first_last_name(self):         
        """能够正确地处理像Janis Joplin这样的姓名吗？"""        
        formatted_name = get_formatted_name('janis', 'joplin')         
        self.assertEqual(formatted_name, 'Janis Joplin') 
        
    #添加一个新测试
    def test_first_last_middle_name(self):         
        """能够正确地处理像Wolfgang Amadeus Mozart这样的姓名吗？""" 
        formatted_name = get_formatted_name(             
            'wolfgang', 'mozart', 'amadeus')        
        self.assertEqual(formatted_name, 'Wolfgang Amadeus Mozart') 
 
unittest.main()
```

- 我们将这个方法命名为test_first_last_middle_name()。方法名必须以test_打头，这样它才会在我们运行test_name_function.py时自动运行。

- 这个方法名清楚地指出了它测试的是get_ formatted_name()的哪个行为，这样，如果该测试未通过，我们就会马上知道受影响的是哪种类型的姓名

- 在TestCase类中使用很长的方法名是可以的；这些方法的名称必须是描述性的，这才 能让你明白测试未通过时的输出

### 12、2测试类

unittest 中的断言方法

| assertEqual(a, b)          | 核实a == b             |
| -------------------------- | ---------------------- |
| assertNotIn( item , list ) | 核实 item 不在 list 中 |
| assertNotEqual(a, b)       | 核实a != b             |
| assertIn( item , list )    | 核实 item 在 list 中   |
| assertFalse(x)             | 核实x为False           |
| assertTrue(x)              | 核实x为True            |

***

#### 12、2、2一个要测试的类 

```python
class AnonymousSurvey():     
    """收集匿名调查问卷的答案"""      
    def __init__(self, question):         
        """存储一个问题，并为存储答案做准备"""         
        self.question = question         
        self.responses = []          
    def show_question(self):        
        """显示调查问卷"""       
        print(question)          
    def store_response(self, new_response):    
        """存储单份调查答卷"""      
        self.responses.append(new_response)          
    def show_results(self):         
        """显示收集到的所有答卷"""       
        print("Survey results:")        
        for response in responses:      
            print('- ' + response) 
```

- 为证明AnonymousSurvey类能够正确地工作，我们来编写一个使用它的程序： 

```python
from survey import AnonymousSurvey 
 
#定义一个问题，并创建一个表示调查的AnonymousSurvey对象 
question = "What language did you first learn to speak?" 
my_survey = AnonymousSurvey(question) 
 
#显示问题并存储答案 
my_survey.show_question() 
print("Enter 'q' at any time to quit.\n") 
while True:     
    response = input("Language: ")     
    if response == 'q':       
        break     
    my_survey.store_response(response) 
 
# 显示调查结果 
print("\nThank you to everyone who participated in the survey!") 
my_survey.show_results()
```

#### 12、2、3测试AnonymousSurvey 类 

````python
import unittest from survey import AnonymousSurvey 
 
class TestAnonmyousSurvey(unittest.TestCase): 
    """针对AnonymousSurvey类的测试"""      
    def test_store_single_response(self):        
        """测试单个答案会被妥善地存储"""        
        question = "What language did you first learn to speak?" 
        my_survey = AnonymousSurvey(question)       
        my_survey.store_response('English')          
        self.assertIn('English', my_survey.responses) 

unittest.main()
````

- 只能收集一个答案的调查用途不大。下面来核实用户提供三个答案时，它们也将被妥善地存储。为此，我们在TestAnonymousSurvey中再添加一个方法

```python
	def test_store_three_responses(self):        
        """测试三个答案会被妥善地存储"""        
        question = "What language did you first learn to speak?"     
        my_survey = AnonymousSurvey(question) 
        responses = ['English', 'Spanish', 'Mandarin']    
        for response in responses:  
            my_survey.store_response(response)              
        for response in responses:            
            self.assertIn(response, my_survey.responses) 

```

#### 12、2、4方法setUp() 

```python
import unittest from survey import AnonymousSurvey 
 
class TestAnonymousSurvey(unittest.TestCase):     
    """针对AnonymousSurvey类的测试"""          
    def setUp(self):        
        """         创建一个调查对象和一组答案，供使用的测试方法使用         """      
        question = "What language did you first learn to speak?" 
        self.my_survey = AnonymousSurvey(question) 
        self.responses = ['English', 'Spanish', 'Mandarin'] 
 
    def test_store_single_response(self):      
        """测试单个答案会被妥善地存储"""        
        self.my_survey.store_response(self.responses[0])   
        self.assertIn(self.responses[0], self.my_survey.responses)         
    def test_store_three_responses(self): 
        """测试三个答案会被妥善地存储"""    
        for response in self.responses:    
            self.my_survey.store_response(response)     
        for response in self.responses:           
            self.assertIn(response, self.my_survey.responses) 
 
unittest.main()
```

- 方法setUp()做了两件事情：创建一个调查对象  ；创建一个答案列表

**注:运行测试用例时，每完成一个单元测试，Python都打印一个字符：测试通过时打印一个 句点；测试引发错误时打印一个E；测试导致断言失败时打印一个F。**

***

## 项目一：外星人入侵

### 1、1开始游戏项目

#### 1、1、1创建Pygame窗口以及响应用户输入

- 首先，我们导入了模块sys和pygame。模块pygame包含开发游戏所需的功能。玩家退出时，我们将使用模块sys来退出游戏
- 游戏《外星人入侵》的开头是函数run_game()
- 代码行pygame.init()初始化背景设置， 让Pygame能够正确地工作
- 调用pygame.display.set_mode()来创建一个名为screen 的显示窗口，这个游戏的所有图形元素都将在其中绘制
- 实参(1200, 800) 是一个元组，指定了游戏窗口的尺寸。通过将这些尺寸值传递给pygame.display.set_mode()，我们创建了一个宽1200 像素、高800像素的游戏窗口

````python
import sys 
 
import pygame 
 
def run_game():     
    # 初始化游戏并创建一个屏幕对象
    pygame.init()
    screen = pygame.display.set_mode((1200, 800))    
    pygame.display.set_caption("Alien Invasion") 
 
    # 开始游戏的主循环
    while True: 
        # 监视键盘和鼠标事件
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                sys.exit() 
        # 让最近绘制的屏幕可见
        pygame.display.flip() 
 
run_game()
````

***

- 对象screen是一个surface。在Pygame中，surface是屏幕的一部分，用于显示游戏元素。在这 个游戏中，每个元素（如外星人或飞船）都是一个surface。display.set_mode()返回的surface表示整个游戏窗口。我们激活游戏的动画循环后，每经过一次循环都将自动重绘这个surface

***

- 这个游戏由一个while循环控制，其中包含一个事件循环以及管理屏幕更新的代码。
-  事件是用户玩游戏时执行的操作，如按键或移动鼠标。
- 为让程序响应事件，我们编写一个事件循环，以侦听事件，并根据发生的事件执行相应的任务。for循环就是一个事件循环。 

***

- 为访问Pygame检测到的事件，我们使用方法pygame.event.get()。所有键盘和鼠标事件都将 促使for循环运行。在这个循环中，我们将编写一系列的if语句来检测并响应特定的事件。例如， 玩家单击游戏窗口的关闭按钮时，将检测到pygame.QUIT事件，而我们调用sys.exit()来退出游戏

- pygame.display.flip()，命令Pygame让近绘制的屏幕可见。在这里，它在每次 执行while循环时都绘制一个空屏幕，并擦去旧屏幕，使得只有新屏幕可见。在我们移动游戏元 素时，pygame.display.flip()将不断更新屏幕，以显示元素的新位置，并在原来的位置隐藏元素， 从而营造平滑移动的效果。 

- 最后一行调用run_game()，这将初始化游戏并开始主循环。 

***

#### 1、1、2设置背景色 

- Pygame默认创建一个黑色屏幕，这太乏味了。下面来将背景设置为另一种颜色： 

```python
-snip -- 
def run_game():     
    -snip --     
    pygame.display.set_caption("Alien Invasion") 
 
    # 设置背景色 
    bg_color = (230, 230, 230) 
 
    # 开始游戏主循环.
    while True:
        # 监听键盘和鼠标事件
        -snip -- 
        # 每次循环时都重绘屏幕 
    	screen.fill(bg_color) 
        # 让最近绘制的屏幕可见        
    	pygame.display.flip() 
run_game()
```

- 首先，我们创建了一种背景色，并将其存储在bg_color中

***

#### 1、1、3创建设置类 

- 每次给游戏添加新功能时，通常也将引入一些新设置。下面来编写一个名为settings的模块， 其中包含一个名为Settings的类，用于将所有设置存储在一个地方，以免在代码中到处添加设置。 

```python
class Settings():     
    """存储《外星人入侵》的所有设置的类""" 
 
    def __init__(self):         
        """初始化游戏的设置"""        
        # 屏幕设置         
        self.screen_width = 1200         
        self.screen_height = 800         
        self.bg_color = (230, 230, 230) 
```

创建实例并使用类

```python
-snip -- 
import pygame 
 
from settings import Settings 
 
def run_game():     
    # 初始化pygame、设置和屏幕对象    
    pygame.init() 
    ai_settings = Settings()
    screen = pygame.display.set_mode(         
        (ai_settings.screen_width, ai_settings.screen_height))     
    pygame.display.set_caption("Alien Invasion") 
 
    # 开始游戏主循环     
    while True:         
        -snip --         
        # 每次循环时都重绘屏幕          
        screen.fill(ai_settings.bg_color)                         
        # 让最近绘制的屏幕可见      
        pygame.display.flip() 
 
run_game() 
```

***

### 1、2添加飞船图像 

#### 1、2、1创建ship类

```python
import pygame 
 
class Ship(): 
    def __init__(self, screen):         
        """初始化飞船并设置其初始位置"""        
        self.screen = screen 
        # 加载飞船图像并获取其外接矩形
        self.image = pygame.image.load('images/ship.bmp')
        self.rect = self.image.get_rect()
        self.screen_rect = screen.get_rect() 
        # 将每艘新飞船放在屏幕底部中央
        self.rect.centerx = self.screen_rect.centerx         
        self.rect.bottom = self.screen_rect.bottom 
 
	def blitme(self):         
        """在指定位置绘制飞船"""        
        self.screen.blit(self.image, self.rect) 
```

- Ship的方法**_\_init\_\_()**接受两个参数：引用self和screen， 其中后者指定了要将飞船绘制到什么地方
- 为加载图像，我们调用了pygame.image.load()。 这个函数返回一个表示飞船的surface，而我们将这个surface存储到了self.image中
- 我们使用方法**get_rect()**获取相应surface的属性rect

***

- 要将游戏元素居中，可设置相应rect对象的属性center、centerx或centery。
- 要让游戏元素与屏幕边缘对齐，可使用属性top、bottom、left或right；
- 要调整游戏元素的水平或垂直位置， 可使用属性x和y，它们分别是相应矩形左上角的x和y坐标

***

- **在Pygame中，原点(0, 0)位于屏幕左上角，向右下方移动时，坐标值将增大。在1200×800 的屏幕上，原点位于左上角，而右下角的坐标为(1200, 800)**

***

- 我们将把飞船放在屏幕底部中央。为此，首先将表示屏幕的矩形存储在self.screen_rect中 
- 再将self.rect.centerx（飞船中心的x坐标）设置为表示屏幕的矩形的属性centerx
- 并将self.rect.bottom（飞船下边缘的y坐标）设置为表示屏幕的矩形的属性bottom
- Pygame 将使用这些rect属性来放置飞船图像，使其与屏幕下边缘对齐并水平居中
- 我们定义了方法blitme()，它根据self.rect指定的位置将图像绘制到屏幕上

#### 1、2、2在屏幕上创建飞船

```python
import sys
import pygame

from settings import Settings 
from ship import Ship 
 
def run_game():     
    pygame.init() 
    ai_settings = Settings()
    screen = pygame.display.set_mode(         
        (ai_settings.screen_width, ai_settings.screen_height))     
    pygame.display.set_caption("Alien Invasion")
 
    # 创建一艘飞船 
    ship = Ship(screen) 
 
    # 开始游戏主循环
    while True:        
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                sys.exit()    
        # 每次循环时都重绘屏幕
        screen.fill(ai_settings.bg_color) 
        ship.blitme()                      
        # 让最近绘制的屏幕可见     
        pygame.display.flip() 
 
run_game()
```

***

### 1、3重构：模块 game_functions 

#### 1、3、1函数check_events() 

- 我们将首先把管理事件的代码移到一个名为check_events()的函数中，以简化run_game()并隔离事件管理循环。通过隔离事件循环，可将事件管理与游戏的其他方面（如更新屏幕）分离。

```python
import sys 
 
import pygame 
 
def check_events():     
    """响应按键和鼠标事件"""     
    for event in pygame.event.get():         
        if event.type == pygame.QUIT:           
            sys.exit() 
 
```

- 调用check_events

```python
import pygame 
 
from settings import Settings 
from ship import Ship 
import game_functions as gf 
 
def run_game():     
    -snip --     
    # 开始游戏主循环     
    while True:         
        gf.check_events()                         
    # 让最近绘制的屏幕可见         
    -snip --
```

***

#### 1、3、2函数update_screen() 

- 为进一步简化run_game()，下面将更新屏幕的代码移到一个名为update_screen()的函数中， 并将这个函数放在模块game_functions.py中

```python
-snip -- 
 
def check_events():     
    -snip -- 
 
def update_screen(ai_settings, screen, ship):     
    """更新屏幕上的图像，并切换到新屏幕"""     
    # 每次循环时都重绘屏幕     
    screen.fill(ai_settings.bg_color)     
    ship.blitme() 
 
    # 让最近绘制的屏幕可见     
    pygame.display.flip() 
```

***

### 1、4驾驶飞船

#### 1、4、1响应按键 

- 每当用户按键时，都将在Pygame中注册一个事件。事件都是通过方法pygame.event.get()获取的，因此在函数check_events()中，我们需要指定要检查哪些类型的事件。每次按键都被注册为一个KEYDOWN事件。 

- 如果按下的是右箭头键，我们就增大飞船的rect.centerx值，将飞船向右移动：

````python
def check_events(ship):     
    """响应按键和鼠标事件""" 

    for event in pygame.event.get():         
        if event.type == pygame.QUIT:             
            sys.exit() 
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_RIGHT:                 
                #向右移动飞船                
                ship.rect.centerx += 1 
````

#### 1、4、2允许不断移动

- 将让游戏检测pygame.KEYUP事件，以便玩家松开右箭头键时我们能够知道这一点；
- 然后，我们将结合使用KEYDOWN和KEYUP事件，以及一个名为moving_right的标志来实现持续移动
- 飞船不动时，标志moving_right将为False。
  - 玩家按下右箭头键时，我们将这个标志设置为True；
  - 而玩家松开时，我们将这个标志重新设置为False
  - 



***

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
- 再调用fill_walk()
- 将随机漫步包含的x和y值传递给scatter()，并选择了合适的点尺寸

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

