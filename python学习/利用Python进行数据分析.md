# 利用Python进行数据分析

### python数据结构

- 创建元组

```python
yuanzu = 'a','b','c','d'
print(yuanzu)
```

复杂表达式放在括号内

```python
yuanzu = ('a','b'),('c','d')
print(yuanzu)
```

tuple可以将任意序列转换为元组

```python
seq1 = ['d','e','f']
tup = tuple(seq1)
print(tup)
```

用方括号访问元素

可以用+把元组串联起来

```python
seq2 = ['a','b','c']
seq1 = ['d','e','f']
tup = tuple(seq1)
tup1 = tuple(seq2)
tup += tup1
print(tup)
```

元组乘一整数：会把值串联起来

```python
tup = tuple(seq1)
tup1 = tuple(seq2)
tup += tup1
print(tup,tup*2)

('d', 'e', 'f', 'a', 'b', 'c') ('d', 'e', 'f', 'a', 'b', 'c', 'd', 'e', 'f', 'a', 'b', 'c')
```

直接把元组赋值给变量：

```python
tup = tuple(seq1)
tup1 = tuple(seq2)
tup += tup1
a,b,c,d,e,f= tup
print(tup,tup*2)
print(a,b,c,d,e,f)

d e f a b c
```

可以直接变换数值：

```
a,b = 1,3
b,a = a,b
print(a,b)

3 1
```

rest表示舍弃的部分，可用 *_ 代替

```
a,b,*rest= tup
print(tup)
print(a,b,rest)

d e ['f', 'a', 'b', 'c']
```

count（）用于统计某个值出现的频率

```
print(tup.count('c'))
```

enumerate函数：

```
for i,value in enumerate(seq):
    seq3[i] = value
print(seq3)

{0: 'c', 1: 'e', 2: 'f'}
```

zip函数：组成元组列表，长度取决于最短值

```python
seq2 = ['a','b','c']
seq1 = ['c','e','f']
seq = {}
for key,value in zip(seq1,seq2):
    seq[key] = value
    
{'c': 'a', 'e': 'b', 'f': 'c'}
```

切片：

```
words = ['1','2','3','4','1','8','2','2','4','2','2']
a = slice(0,10,2)
print(words[a])

['1', '3', '1', '2', '4']
```

```
s = 'maoshengren'
print(a.indices(len(s)))
for i in range(a.indices(len(s))):
    print(s[i])
    
(0, 11, 2)
m
o
n
r
n
```



