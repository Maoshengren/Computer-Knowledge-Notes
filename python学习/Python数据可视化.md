# Python数据可视化

### 读取excel文件

- At the top level, we have aworkbook (the Python class xlrd.book.Book) that consists of one or more worksheets(xlrd.sheet.Sheet)
- and every **sheet has a cell** (xlrd.sheet.Cell) from which we can then read the value.
- Book instance that contains all the information about a workbook like sheets. We accesssheets using **sheet_by_name()**; if we need **all sheets**, we could use **sheets()**, which returns a list of the xlrd.sheet.Sheet instances
- The xlrd.sheet.Sheet class has a number of columns and rows as attributes that we can use to infer ranges for our loop to access every particular cell inside a worksheet using the method **cell()**

```python
import xlrd
from pprint import pprint
file1 = 'Englishword.xlsx'
wb = xlrd.open_workbook(filename = file1)
ws = wb.sheet_by_name(sheet_name = 'sheet1')
dataset = []
for r in xrange(ws.nrows):
    col = []
    for c in range(ws.ncols):
        col.append(ws.cell(r, c).value)
    dataset.append(col)

pprint(dataset)
```

- cell()方法返回特定位置的值

```
cell = ws.cell(1,0)
print(cell)

text:'activity'
```

- here is an on_demand parameter that can be passed as True value whilecalling open_workbook so that **the worksheet will only be loaded when requested**.See the following example of code snippet for this:
  `book = open_workbook('large.xls', on_demand=True)`

### 读取data文件

- Define the data file to read.
2. Define the mask for how to read the data.
3. Read line by line using the mask to unpack each line into separate data fields.
4. Print each line as separate fields.

```python
import struct
import string
datafile = 'test.data'
# this is where we define how to
# understand line of data from the file
mask='6s3s2s'
with open(datafile, 'r') as f:
    for line in f:
        fields = struct.Struct(mask).unpack_from(line)
        print ('fields: ', [field.strip() for field in fields])
```

- We define our format mask according to what we have previously seen in the datafile
- string字符串格式用于定义要提取的数据的预期布局
- 