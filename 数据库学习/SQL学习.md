**MySQL 数据类型**

在 MySQL 中，有三种主要的类型：Text（文本）、Number（数字）和 Date/Time（日期/时间）类型。

- **Text 类型：**

| 数据类型         | 描述                                                         |
| :--------------- | :----------------------------------------------------------- |
| CHAR(size)       | 保存固定长度的字符串（可包含字母、数字以及特殊字符）。在括号中指定字符串的长度。最多 255 个字符。 |
| VARCHAR(size)    | 保存可变长度的字符串（可包含字母、数字以及特殊字符）。在括号中指定字符串的最大长度。最多 255 个字符。**注释：**如果值的长度大于 255，则被转换为 TEXT 类型。 |
| TINYTEXT         | 存放最大长度为 255 个字符的字符串。                          |
| TEXT             | 存放最大长度为 65,535 个字符的字符串。                       |
| BLOB             | 用于 BLOBs（Binary Large OBjects）。存放最多 65,535 字节的数据。 |
| MEDIUMTEXT       | 存放最大长度为 16,777,215 个字符的字符串。                   |
| MEDIUMBLOB       | 用于 BLOBs（Binary Large OBjects）。存放最多 16,777,215 字节的数据。 |
| LONGTEXT         | 存放最大长度为 4,294,967,295 个字符的字符串。                |
| LONGBLOB         | 用于 BLOBs (Binary Large OBjects)。存放最多 4,294,967,295 字节的数据。 |
| ENUM(x,y,z,etc.) | 允许您输入可能值的列表。可以在 ENUM 列表中列出最大 65535 个值。如果列表中不存在插入的值，则插入空值。 **注释：**这些值是按照您输入的顺序排序的。 可以按照此格式输入可能的值： ENUM('X','Y','Z') |
| SET              | 与 ENUM 类似，不同的是，SET 最多只能包含 64 个列表项且 SET 可存储一个以上的选择。 |

- **Number 类型：**

| 数据类型        | 描述                                                         |
| :-------------- | :----------------------------------------------------------- |
| TINYINT(size)   | -128 到 127 常规。0 到 255 无符号*。在括号中规定最大位数。   |
| SMALLINT(size)  | -32768 到 32767 常规。0 到 65535 无符号*。在括号中规定最大位数。 |
| MEDIUMINT(size) | -8388608 到 8388607 普通。0 to 16777215 无符号*。在括号中规定最大位数。 |
| INT(size)       | -2147483648 到 2147483647 常规。0 到 4294967295 无符号*。在括号中规定最大位数。 |
| BIGINT(size)    | -9223372036854775808 到 9223372036854775807 常规。0 到 18446744073709551615 无符号*。在括号中规定最大位数。 |
| FLOAT(size,d)   | 带有浮动小数点的小数字。在 size 参数中规定最大位数。在 d 参数中规定小数点右侧的最大位数。 |
| DOUBLE(size,d)  | 带有浮动小数点的大数字。在 size 参数中规定最大位数。在 d 参数中规定小数点右侧的最大位数。 |
| DECIMAL(size,d) | 作为字符串存储的 DOUBLE 类型，允许固定的小数点。在 size 参数中规定最大位数。在 d 参数中规定小数点右侧的最大位数。 |

这些整数类型拥有额外的选项 UNSIGNED。通常，整数可以是负数或正数。如果添加 UNSIGNED 属性，那么范围将从 0 开始，而不是某个负数。

- **Date 类型：**

| 数据类型    | 描述                                                         |
| :---------- | :----------------------------------------------------------- |
| DATE()      | 日期。格式：YYYY-MM-DD**注释：**支持的范围是从 '1000-01-01' 到 '9999-12-31' |
| DATETIME()  | *日期和时间的组合。格式：YYYY-MM-DD HH:MM:SS**注释：**支持的范围是从 '1000-01-01 00:00:00' 到 '9999-12-31 23:59:59' |
| TIMESTAMP() | *时间戳。TIMESTAMP 值使用 Unix 纪元('1970-01-01 00:00:00' UTC) 至今的秒数来存储。格式：YYYY-MM-DD HH:MM:SS**注释：**支持的范围是从 '1970-01-01 00:00:01' UTC 到 '2038-01-09 03:14:07' UTC |
| TIME()      | 时间。格式：HH:MM:SS**注释：**支持的范围是从 '-838:59:59' 到 '838:59:59' |
| YEAR()      | 2 位或 4 位格式的年。 **注释：**4 位格式所允许的值：1901 到 2155。2 位格式所允许的值：70 到 69，表示从 1970 到 2069。 |

- 即便 DATETIME 和 TIMESTAMP 返回相同的格式，它们的工作方式很不同。在 INSERT 或 UPDATE 查询中，TIMESTAMP 自动把自身设置为当前的日期和时间。TIMESTAMP 也接受不同的格式，比如 YYYYMMDDHHMMSS、YYMMDDHHMMSS、YYYYMMDD 或 YYMMDD

***

### 1.1 **SQL RDBMS 概念**

- RDBMS是关系数据库管理系统(**Relational Database Management System**)的缩写。

- RDBMS是SQL的基础，也是所有现代数据库系统(如MS SQL Server、IBMDB2、Oracle、MySQL和MicrosoftAccess)的基础。

- 关系数据库管理系统(Relational Database Management System，RDBMS)是一种基于E.F.Codd提出的关系模型的数据库管理系统。

  ***

- ##### **什么是表？**

  - RDBMS中的数据存储在称为表的数据库对象中。
  - 这个表基本上是一个相关数据条目的集合，它由许多列和行组成。
  - 请记住，表是关系数据库中最常见和最简单的数据存储形式。
  - 下面的程序是Customers表的一个示例

  ```
  +----+----------+-----+-----------+----------+
  | ID | NAME     | AGE | ADDRESS   | SALARY   |
  +----+----------+-----+-----------+----------+
  |  1 | Ramesh   |  32 | Ahmedabad |  2000.00 |
  |  2 | Khilan   |  25 | Delhi     |  1500.00 |
  |  3 | kaushik  |  23 | Kota      |  2000.00 |
  |  4 | Chaitali |  25 | Mumbai    |  6500.00 |
  |  5 | Hardik   |  27 | Bhopal    |  8500.00 |
  |  6 | Komal    |  22 | MP        |  4500.00 |
  |  7 | Muffy    |  24 | Indore    | 10000.00 |
  +----+----------+-----+-----------+----------+
  ```

- **字段**
  - 每个表都被分解成更小的实体，称为字段。Customers表中的字段由ID、姓名、年龄、地址和薪资组成
  - 字段是表中的列，用于维护有关表中每条记录的特定信息。

- **记录、行数据**
  
  - 记录也称为数据行，即表中存在的每个单独的条目。例如，上面的Customers表中有7条记录。
  - 下面是Customers表中的单行数据或记录。

```sql
+----+----------+-----+-----------+----------+
|  1 | Ramesh   |  32 | Ahmedabad |  2000.00 |
+----+----------+-----+-----------+----------+
```

**记录是表中的水平实体。**

- **列数据**

  - 列是表中的垂直实体，其中包含与表中特定字段关联的所有信息

    　例如，Customers表中的一列是Address，它表示位置描述，如下所示：

```
+-----------+
| ADDRESS   |
+-----------+
| Ahmedabad |
| Delhi     |
| Kota      |
| Mumbai    |
| Bhopal    |
| MP        |
| Indore    |
+----+------+
```

- **空值**
  - 表中的空值是显示为空的字段中的值，这意味着具有空值的字段是没有值的字段。
  - 非常重要的一点是空值不同于零值或包含空格的字段。具有空值的字段是在创建记录时留空的字段。

- **sql约束**
  - 约束是在表上的数据列上强制执行的规则。它们用于限制可以进入表中的数据类型。
  - 这确保了数据库中数据的准确性和可靠性。
  - 约束可以是列级别，也可以是表级别。列级约束仅应用于一列，而表级约束则应用于整个表。
  - 以下是sql−中可用的一些最常用的约束

- NOT NULL 约束：保证列中数据不能有 NULL 值
- DEFAULT 约束：提供该列数据未指定时所采用的默认值
- UNIQUE 约束：保证列中的所有数据各不相同
- 主键约束：唯一标识数据表中的行/记录
- 外键约束：唯一标识其他表中的一条行/记录
- CHECK 约束：此约束保证列中的所有值满足某一条件
- 索引：用于在数据库中快速创建或检索数据

> 约束可以在创建表时规定（通过 CREATE TABLE 语句），或者在表创建之后规定（通过 ALTER TABLE 语句）。

- **数据完整性**

  - 每个关系数据库管理系统都存在以下类型的数据完整性：

    > 实体完整性−表中没有重复行。
    > 域完整性−通过限制值的类型、格式或范围来强制执行给定列的有效条目。
    > 引用完整性−不能删除其他记录使用的行。
    > 用户定义的完整性−强制执行一些不属于实体、域或引用完整性的特定业务规则。

***

### 1.2 SQL语法

- **SQL 语法规则**
  - SQL语句总是以关键字开始，如SELECT、INSERT、UPDATE、DELETE、DROP、CREATE。
  - SQL语句以分号结尾。
  - SQL不区分大小写，意味着update与UPDATE相同。

- 数据库表
  - 数据库通常包含一个或多个表。每个表都用一个名称标识（例如，"Customers"或"Orders"）。该表包含带有数据（行）的记录。    
  - 下面是选自 "Customers" 表的数据：

| CustomerID | CustomerName                       | ContactName        | Address                       | City        | PostalCode | Country |
| :--------- | :--------------------------------- | :----------------- | :---------------------------- | :---------- | :--------- | :------ |
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                 | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitución 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312                | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.               | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8                | Luleå       | S-958 22   | Sweden  |

> 上面的表包含五条记录（每一条对应一个客户）和七个列（CustomerID、CustomerName、ContactName、Address、City、PostalCode 和 Country）

- **请记住**
  - SQL 对大小写不敏感：SELECT 与 select 是相同的。
  - 在本教程中，我们将以大写形式编写所有SQL关键字。

- 一些数据库系统需要在每个SQL语句的末尾使用分号。        
- 分号是分离数据库系统中每个SQL语句的标准方法，这样您就可以在对服务器的同一请求中执行多个SQL语句。        
- 在本教程中，我们将在每个SQL语句的末尾使用分号。

***

- **SQL命令**
  - **SELECT** - 从数据库中提取数据
  - **UPDATE** - 更新数据库中的数据
  - **DELETE** - 从数据库中删除数据
  - **INSERT INTO** - 向数据库中插入新数据
  - **CREATE DATABASE** - 创建新数据库
  - **ALTER DATABASE** - 修改数据库
  - **CREATE TABLE** - 创建新表
  - **ALTER TABLE** - 变更（改变）数据库表
  - **DROP TABLE** - 删除表
  - **CREATE INDEX** - 创建索引（搜索键）
  - **DROP INDEX** - 删除索引

***

**SELECT语句**

　句法：

```
SELECT column_name(s) FROM table_name
```

**SELECT语句和WHERE子句**

　句法：

```sql
SELECT [*] FROM [TableName] WHERE [condition1]
```

**SELECT语句与WHERE和/或子句**

　句法：

```
SELECT [*] FROM [TableName] WHERE [condition1] [AND [OR]] [condition2]...
```

**SELECT语句与ORDER BY**

　句法：

```
SELECT column_name()
FROM table_name
ORDER BY column_name() ASC or DESC
```

**SELECT DISTINCT(区分)子句**

　句法：

```
SELECT DISTINCT column1, column2....columnN
FROM   table_name;
```

**SELECT IN子句**

　句法：

```
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name IN (val-1, val-2,...val-N);
```

**SELECT LIKE (类)子句**

　句法：

```
SELECT column1, column2....columnN
FROM   table_name
WHERE  column_name LIKE { PATTERN };
```

**SELECT COUNT(计数)子句**

　句法：

```
SELECT COUNT(column_name)
FROM   table_name
WHERE  CONDITION;
```

**SELECT与HAVING子句**

　句法：

```
SELECT SUM(column_name)
FROM   table_name
WHERE  CONDITION
GROUP BY column_name
HAVING (arithematic function condition);
```

**INSERT INTO语句**

　句法：

```
INSERT INTO table_name (column, column1, column2, column3, ...)
VALUES (value, value1, value2, value3 ...)
```

**UPDATE语句**

　句法：

```
UPDATE table_name
SET column=value, column1=value1,...
WHERE someColumn=someValue
```

DELETE语句

　句法：

```
DELETE FROM tableName
WHERE someColumn = someValue
```

CREATE 语句

　句法：

```
CREATE TABLE table_name(
column1 datatype,
column2 datatype,
column3 datatype,
.....
columnN datatype,
PRIMARY KEY( one or more columns )
);
```

**DROP 语句**

　句法：

```
DROP TABLE table_name;
```

**CREATE INDEX语句**

　句法：

```
CREATE UNIQUE INDEX index_name
ON table_name ( column1, column2,...columnN);
```

**DROP INDEX语句**

　句法：

```
ALTER TABLE table_name
DROP INDEX index_name;
```

**DESC语句**

　句法：

```
DESC table_name;
```

**TRUNCATE 截断表语句**

　句法：

```
TRUNCATE TABLE table_name;
```

**ALTER TABLE语句**

　句法：

```
ALTER TABLE table_name {ADD|DROP|MODIFY} column_name {data_ype};
```

**ALTER TABLE语句(对表名重命名)**

　句法：

```
ALTER TABLE table_name RENAME TO new_table_name;
```

**Use语句** 

　句法：

```
USE database_name;
```

**COMMIT语句**

　句法：

```
COMMIT;
```

**ROLLBACK语句**

　句法：

```
ROLLBACK;
```

***

#### 1.2.1 SQL选择

- SELECT 语法用于从数据库中选择数据。     
- 返回的数据存储在结果表中，称为结果集。

**基本语法：SELECT和FROM**

- 在任何SQL查询语句中都：SELECT和FROM他们必须按顺序排列。SELECT指示要查看哪些列，FROM标识它们所在的表。
- SQL SELECT 语法如下所示：

```
SELECT column1, column2, ...
FROM table_name;
```

- 这里，column1，column2，...是要从中选择数据的表的字段名称。如果要选择表中可用的所有字段，请使用以下语法：    

```
SELECT * FROM table_name;
```

| CustomerID | CustomerName                       | ContactName        | Address                       | City        | PostalCode | Country |
| :--------- | :--------------------------------- | :----------------- | :---------------------------- | :---------- | :--------- | :------ |
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                 | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitución 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312                | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.               | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8                |             |            |         |

- **SELECT  检索一列**

  　下面的 SQL 语句从 "Customers" 表中选取 "City" 列：

  `SELECT City FROM Customers; `

- **SELECT  检索多列**

  　下面的 SQL 语句从 "Customers" 表中选取 "CustomerName" 和 "City" 列：

  `SELECT CustomerName, City FROM Customers;`

- **SELECT * 实例 - 检索所有列**

  　下面的 SQL 语句从 "Customers" 表中选取所有列：

  `SELECT * FROM Customers;`

***

#### 1.2.2 SQL选择不同

- SELECT DISTINCT语法用于仅返回不同的（different）值。

- 在一张表内，一列通常包含许多重复的值; 有时你只想列出不同的（different）值。

- SELECT DISTINCT语句用于仅返回不同的（different）值。

  　SQL SELECT DISTINCT语法如下所示：

  ```
  SELECT DISTINCT column1, column2, ...
  FROM table_name;
  ```

***

#### 1.2.3 **SQL WHERE Clause**

- WHERE 子句用于过滤记录。

- WHERE 子句用于提取满足指定标准的记录。 

  **SQL WHERE 语法**

  ```
  SELECT column1, column2, ...
  FROM table_name
  WHERE condition;
  ```

> **注意：** WHERE子句不仅用于SELECT语法，还用于UPDATE，DELETE语法等！

- WHERE子句可以与以下类型的SQL语句一起使用：

  - UPDATE
  - DELETE

  　**UPDATE语句**：

  ```
  UPDATE "table_name"
  SET "column_1" = [new value]
  WHERE "condition";
  ```

  　**DELETE语句**：

  ```
  DELETE FROM "table_name"
  WHERE "condition";
  ```

- 你也可以使用OR运算符的查询子句：

  ```
  SELECT * FROM Customers        
  WHERE Country='Mexico' OR PostalCode='05021';
  ```

- SQL在文本值周围使用单引号（大多数数据库系统也接受双引号）。

  　如果是数值字段，则不要使用引号。

  ```
  SELECT * FROM Customers      
  WHERE CustomerID=1;
  ```

　**WHERE子句中可以使用以下运算符：**        

| 运算符  | 描述                                                        |
| :------ | :---------------------------------------------------------- |
| =       | 等于                                                        |
| <>      | 不等于。 **注意**：在某些版本的SQL中，这个操作符可能写成！= |
| >       | 大于                                                        |
| <       | 小于                                                        |
| >=      | 大于等于                                                    |
| <=      | 小于等于                                                    |
| BETWEEN | 在某个范围内                                                |
| LIKE    | 搜索某种模式                                                |
| IN      | 为列指定多个可能的值                                        |

***

#### 1.2.4 **SQL AND, OR and NOT**

- AND&OR运算符用于根据一个以上的条件过滤记录，即用于组合多个条件以缩小SQL语句中的数据。

  　WHERE子句可以与AND，OR和NOT运算符结合使用。

    　AND和OR运算符用于根据多个条件筛选记录：

  - 如果由AND分隔的所有条件为TRUE，则AND运算符显示记录。
  - 如果使用AND运算符组合N个条件。对于SQL语句执行的操作(无论是事务还是查询)，所有由AND分隔的条件都必须为TRUE。        
  - 如果由OR分隔的任何条件为真，则OR运算符显示记录。
  - 如果使用OR运算符组合N个条件。对于SQL语句执行的操作(无论是事务还是查询)，OR分隔的任何一个条件都必须为TRUE。        

  　如果条件不为TRUE，则NOT运算符显示记录。

**AND语法**

```
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;
```

**OR语法**

```
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;
```

**NOT语法**

```
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;
```

- **结合AND，OR和NOT**

  　你也可以结合AND，OR和NOT运算符。

    　以下SQL语句选择国家是“德国”的“客户”的所有字段，城市必须是“柏林”或“慕尼黑”（用括号形成复杂表达式）：

    　**代码示例：**

  ```
  SELECT * FROM Customers
  WHERE Country='Germany' AND (City='Berlin' OR City='München');
  ```

  　以下SQL语句选择来自"Customers" 的国家不是 "Germany" 且不是 "USA"的所有字段：    

  　**代码示例：**

  ```
  SELECT * FROM Customers
  WHERE NOT Country='Germany' AND NOT Country='USA';
  ```

***

#### 1.2.5 **SQL ORDER BY Keyword**

- ORDER BY 关键字用于按升序或降序对结果集进行排序
- ORDER BY 关键字默认情况下按升序排序记录
- 如果需要按降序对记录进行排序，可以使用DESC关键字

**SQL ORDER BY 语法**

```
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
```

***

#### 1.2.6**SQL INSERT INTO**

- **SQL INSERT INTO 语法**

　INSERT INTO 语句可以用两种形式编写。            
　第一个表单没有指定要插入数据的列的名称，只提供要插入的值，即可添加一行新的数据：

```
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

​    第二种，如果要为表中的所有列添加值，则不需要在SQL查询中指定列名称。但是，请确保值的顺序与表中的列     	顺序相同。INSERT INTO语法如下所示：

```
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
```

> 注意到了吗？**我们没有将任何号码插入 CustomerID 字段。**                         
> CustomerID列是一个**自动递增**字段，在将新记录插入到表中时自动生成

- **仅在指定的列中插入数据**

  　我们还可以只在指定的列中插入数据。

    　以下SQL语句插入一个新行，但只在“CustomerName”、“City”和“Countryn”列中插入数据（CustomerID字段将自动更新）：

```
INSERT INTO Customers (CustomerName, City, Country)                
VALUES ('Cardinal', 'Stavanger', 'Norway');
```

| CustomerID | CustomerName | ContactName | Address | City      | PostalCode | Country |
| :--------- | :----------- | :---------- | :------ | :-------- | :--------- | :------ |
| 92         | Cardinal     | null        | null    | Stavanger | null       | Norway  |

- **使用另一个表填充一个表**

  　您可以通过另一个表上的SELECT语句查询出来的字段值，然后将数据填充到本表中，条件是另一个表所查询的字段与本表要插入数据的字段是一一对应的。

  ```
  INSERT INTO first_table_name [(column1, column2, ... columnN)] 
  SELECT column1, column2, ...columnN 
  FROM second_table_name
  [WHERE condition];
  ```

***

#### 1.2.7 **SQL NULL Values**

- SQL 中，**NULL** 用于表示缺失的值。数据表中的 NULL 值表示该值所处的字段为空。
- 具有NULL值的字段是没有值的字段。
- 如果表中的字段是可选的，则可以插入新记录或更新记录而不向该字段添加值。然后，该字段将被保存为NULL值。
- 值为 NULL 的字段没有值。尤其要明白的是，NULL 值与 0 或者包含空白（spaces）的字段是不同的。

> **注意**：理解NULL值与零值或包含空格的字段不同是非常重要的。具有NULL值的字段是在记录创建期间留空的字段！

- **测试NULL值**
- 使用比较运算符（例如=，<或<>）来测试NULL值是不可行的。
- 我们将不得不使用IS NULL和IS NOT NULL运算符。

**IS NULL语法**

```
SELECT column_names
FROM table_name
WHERE column_name IS NULL;
```

**IS NOT NULL语法**

```
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;
```

-  假设我们有以下的“人员”表：     

| ID   | LastName | FirstName | Address            | City     |
| ---- | -------- | --------- | ------------------ | -------- |
| 1    | Doe      | John      | 542 W. 27th Street | New York |
| 2    | Bloggs   | Joe       |                    | London   |
| 3    | Roe      | Jane      |                    | New York |
| 4    | Smith    | John      | 110 Bishopsgate    | London   |

- 以下SQL语句使用IS NULL运算符来列出所有没有地址的人员：        

```sql
SELECT LastName, FirstName, Address FROM Persons
WHERE Address IS NULL;
```

　结果集将如下所示：

| LastName | FirstName | Address |
| -------- | --------- | ------- |
| Bloggs   | Joe       |         |
| Roe      | Jane      |         |

> **提示**：始终使用IS NULL来查找空值。

- **IS NOT NULL运算符**

  　 以下SQL语句使用IS NOT NULL运算符来列出所有具有地址的人员：        

  ```
  SELECT LastName, FirstName, Address FROM Persons
  WHERE Address IS NOT NULL;
  ```

  　结果集将如下所示：

  | LastName | FirstName | Address            |
  | -------- | --------- | ------------------ |
  | Doe      | John      | 542 W. 27th Street |
  | Smith    | John      | 110 Bishopsgate    |

- 创建表的时候，NULL 的基本语法如下：

```sql
SQL> CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);
```

> 这里，**NOT NULL**表示对于给定列，必须按照其数据类型明确赋值。有两列并没有使用 NOT NULL 来限定，也就是说这些列可以为 NULL

***

#### 1.2.8 SQL更新

- UPDATE 语句用于更新表中已存在的记录。
- 还可以使用AND或OR运算符组合多个条件。

- **SQL UPDATE 语法**

  　具有WHERE子句的UPDATE查询的基本语法如下所示：                 

  ```
  UPDATE table_name
  SET column1 = value1, column2 = value2, ...
  WHERE condition;
  ```

>**请注意 **
>
>**更新表中的记录时要小心！
>要注意SQL UPDATE 语句中的 WHERE 子句！**                         
>WHERE子句指定哪些记录需要更新。如果省略WHERE子句，所有记录都将更新！

- **更新多个记录**

  　WHERE子句决定了将要更新的记录数量。  

    　以下SQL语句将把国家/地区为"Mexico"的所有记录的联系人姓名更新为“Juan”：

  ```
  UPDATE Customers
  SET ContactName='Juan'
  WHERE Country='Mexico';
  ```

***

#### 1.2.9 **SQL Delete **

-  DELETE语句用于删除表中现有记录。

  **SQL DELETE 语法**

  ```
  DELETE FROM table_name
  WHERE condition;
  ```

- **删除所有数据**

  　您可以删除表中的所有行，而不需要删除该表。这意味着表的结构、属性和索引将保持不变：

  ```
  DELETE FROM table_name;
  ```

  　**或者**

  ```
  DELETE * FROM table_name;
  ```

  > **注意：**在没有备份的情况下，删除记录要格外小心！因为你删除了不能重复！

| CustomerID | CustomerName                       | ContactName        | Address                       | City        | PostalCode | Country |
| :--------- | :--------------------------------- | :----------------- | :---------------------------- | :---------- | :--------- | :------ |
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                 | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitución 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312                | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.               | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8                | Luleå       | S-958 22   | Sweden  |

- 假设我们想从"Customers" 表中删除客户“Alfreds Futterkiste”。

　我们使用以下SQL语句：

```
DELETE FROM Customers        
WHERE CustomerName='Alfreds Futterkiste';
```

> 现在，"Customers" 表如下所示：

| CustomerID | CustomerName                       | ContactName        | Address                       | City        | PostalCode | Country |
| :--------- | :--------------------------------- | :----------------- | :---------------------------- | :---------- | :--------- | :------ |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitución 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312                | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.               | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8                | Luleå       | S-958 22   | Sweden  |

***

#### 1.2.10 SQL运算符

- 运算符是保留字或主要用于SQL语句的WHERE子句中的字符，用于执行操作，例如：比较和算术运算。 这些运算符用于指定SQL语句中的条件，并用作语句中多个条件的连词

- **SQL算术运算符**

  假设变量 a 的值是：10，变量 b 的值是：20，以下为各运算符执行结果：

| 运算符 | 描述                             | 例子           |
| :----- | :------------------------------- | :------------- |
| +      | 加法，执行加法运算。             | a + b 得到 30  |
| -      | 减法，执行减法运算。             | a - b 得到 -10 |
| *      | 乘法，执行乘法运算。             | a * b 得到 200 |
| /      | 用左操作数除右操作数。           | b / a 得到 2   |
| %      | 用左操作数除右操作数并返回余数。 | b % a 得到 0   |

- **SQL比较运算符**

  假设变量 a 的值是：10，变量 b 的值是：20，以下为各运算符执行结果：

  | 运算符 | 描述                                                         | 例子               |
  | :----- | :----------------------------------------------------------- | :----------------- |
  | =      | 检查两个操作数的值是否相等，如果是，则条件为真(true)。       | (a = b) is false.  |
  | !=     | 检查两个操作数的值是否相等，如果值不相等则条件为真(true)。   | (a != b) is true.  |
  | <>     | 检查两个操作数的值是否相等，如果值不相等则条件为真(true)。   | (a <> b) is true.  |
  | >      | 检查左操作数的值是否大于右操作数的值，如果是，则条件为真(true)。 | (a > b) is false.  |
  | <      | 检查左操作数的值是否小于右操作数的值，如果是，则条件为真(true)。 | (a < b) is true.   |
  | >=     | 检查左操作数的值是否大于或等于右操作数的值，如果是，则条件为真(true)。 | (a >= b) is false  |
  | <=     | 检查左操作数的值是否小于或等于右操作数的值，如果是，则条件为真(true)。 | (a <= b) is true.  |
  | !<     | 检查左操作数的值是否不小于右操作数的值，如果是，则条件变为真(true)。 | (a !< b) is false. |
  | !>     | 检查左操作数的值是否不大于右操作数的值，如果是，则条件变为真(true)。 | (a !> b) is true.  |

- **SQL逻辑运算符：**

  这是在SQL所有的逻辑运算符的列表。

  | 运算符  | 描述                                                         |
  | :------ | :----------------------------------------------------------- |
  | ALL     | ALL运算符用于将值与另一个值集中的所有值进行比较。            |
  | AND     | AND运算符允许在SQL语句的WHERE子句中指定多个条件。            |
  | ANY     | ANY运算符用于根据条件将值与列表中的任何适用值进行比较。      |
  | BETWEEN | BETWEEN运算符用于搜索在给定最小值和最大值内的值。            |
  | EXISTS  | EXISTS运算符用于搜索指定表中是否存在满足特定条件的行。       |
  | IN      | IN运算符用于将值与已指定的文字值列表进行比较。               |
  | LIKE    | LIKE运算符用于使用通配符运算符将值与类似值进行比较。         |
  | NOT     | NOT运算符反转使用它的逻辑运算符的含义。 例如：NOT EXISTS, NOT BETWEEN, NOT IN等等，这是一个否定运算符。 |
  | OR      | OR运算符用于组合SQL语句的WHERE子句中的多个条件。             |
  | IS NULL | IS NULL运算符用于将值与NULL值进行比较。                      |
  | UNIQUE  | UNIQUE运算符搜索指定表的每一行的唯一性(无重复项)。           |

***

#### 1.2.11 SQL表达式

- 表达式是计算值的一个或多个值、运算符和SQL函数的组合。这些SQL表达式类似于公式，它们是用查询语言编写的

- 您还可以使用它们查询数据库中的特定数据集

  **句法**

  　考虑SELECT语句的基本语法，如下所示：

  ```
  SELECT column1, column2, columnN 
  FROM table_name 
  WHERE [CONDITION|EXPRESSION];
  ```

- 有不同类型的sql表达式，如下所示：
  - 布尔型
  - 数值型
  - 日期

- **布尔表达式**

　SQL布尔表达式基于匹配单个值获取数据。

　句法：

```
SELECT column1, column2, columnN 
FROM table_name 
WHERE SINGLE VALUE MATCHING EXPRESSION;
```

　使用具有以下记录的Customers表：

```
SQL> SELECT * FROM CUSTOMERS;
+----+----------+-----+-----------+----------+
| ID | NAME     | AGE | ADDRESS   | SALARY   |
+----+----------+-----+-----------+----------+
|  1 | Ramesh   |  32 | Ahmedabad |  2000.00 |
|  2 | Khilan   |  25 | Delhi     |  1500.00 |
|  3 | kaushik  |  23 | Kota      |  2000.00 |
|  4 | Chaitali |  25 | Mumbai    |  6500.00 |
|  5 | Hardik   |  27 | Bhopal    |  8500.00 |
|  6 | Komal    |  22 | MP        |  4500.00 |
|  7 | Muffy    |  24 | Indore    | 10000.00 |
+----+----------+-----+-----------+----------+
7 rows in set (0.00 sec)
```

　下表是一个简单的示例，展示了各种sql布尔表达式的用法。

```
SQL> SELECT * FROM CUSTOMERS WHERE SALARY = 10000;
+----+-------+-----+---------+----------+
| ID | NAME  | AGE | ADDRESS | SALARY   |
+----+-------+-----+---------+----------+
|  7 | Muffy |  24 | Indore  | 10000.00 |
+----+-------+-----+---------+----------+
1 row in set (0.00 sec)
```

- **数值表达式**

　数值表达式用于在任何查询中执行任何数学运算。

　句法：

```
SELECT numerical_expression as  OPERATION_NAME
[FROM table_name
WHERE CONDITION] ;
```

　这里，数值表达式用于数学表达式或任何公式。下面是一个简单的示例，展示了SQLNDigitic表达式的用法：

```
SQL> SELECT (15 + 6) AS ADDITION
+----------+
| ADDITION |
+----------+
|       21 |
+----------+
1 row in set (0.00 sec)
```

　有几个内置函数，如avg()、sum()、count()等，用于对表或特定表列执行所谓的聚合数据计算。

```
SQL> SELECT COUNT(*) AS "RECORDS" FROM CUSTOMERS; 
+---------+
| RECORDS |
+---------+
|       7 |
+---------+
1 row in set (0.00 sec)
```

- **日期表达式**

　日期表达式返回当前系统日期和时间值：

```
SQL>  SELECT CURRENT_TIMESTAMP;
+---------------------+
| Current_Timestamp   |
+---------------------+
| 2009-11-12 06:40:23 |
+---------------------+
1 row in set (0.00 sec)
```

　另一个日期表达式如下所示：

```
SQL>  SELECT  GETDATE();;
+-------------------------+
| GETDATE                 |
+-------------------------+
| 2009-10-22 12:07:18.140 |
+-------------------------+
1 row in set (0.00 sec)
```

#### 1.2.12 **SQL 选择数据库 USE**

- 当SQL Schema中有多个数据库时，在开始操作之前，需要选择一个执行所有操作的数据库。
- SQL USE语句用于选择SQL架构中的任何现有数据库。

USE语句的基本语法如下所示 :

```
USE DatabaseName;
```

> 数据库名称在RDBMS中必须是唯一的。

- 您可以查看可用的数据库，如下所示：

```
SQL> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| AMROOD             |
| TUTORIALSPOINT     |
| mysql              |
| orig               |
| test               |
+--------------------+
6 rows in set (0.00 sec)
```

- 现在，如果您想使用AMROOD数据库，那么您可以执行以下SQL命令并开始使用AMROOD数据库。

  ```
  SQL> USE AMROOD;
  ```

***

### 1.3 SQL高级教程

#### 1.3.1 **SQL SELECT TOP, LIMIT, ROWNUM**

- SELECT TOP 子句用于指定要返回的**记录数量**
- SELECT TOP子句在包含数千条记录的大型表上很有用。返回大量记录会影响性能。

> **注：**并不是所有的数据库系统都支持SELECT TOP子句。MySQL支持LIMIT子句来选择有限数量的记录，而Oracle使用ROWNUM。

*MySQL语法：*

```
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;
```

- **SQL TOP，LIMIT和ROWNUM示例**

  　以下SQL语句从"Customers"表中选择前三个记录：    

  ```
  SELECT TOP 3 * FROM Customers;
  ```

  　以下SQL语句显示了使用LIMIT子句的等效示例：    

  ```
  SELECT * FROM Customers
  LIMIT 3;
  ```

  　以下SQL语句显示了使用ROWNUM的等效示例：    

  ```
  SELECT * FROM Customers
  WHERE ROWNUM <= 3;
  ```

- **SQL TOP PERCENT示例**

  　以下SQL语句从"Customers"表中选择记录的前50％：    

  ```
  SELECT TOP 50 PERCENT * FROM Customers;
  ```

- **添加一个条件**

  　以下SQL语句从"Customers"表中选择国家为"Germany"的前三条记录：    

  ```
  SELECT TOP 3 * FROM Customers
  WHERE Country='Germany';
  ```

  　以下SQL语句显示了使用LIMIT子句的等效示例：    

  ```
  SELECT * FROM Customers
  WHERE Country='Germany'
  LIMIT 3;
  ```

  　以下SQL语句显示了使用ROWNUM的等效示例：    

  ```
  SELECT * FROM Customers
  WHERE Country='Germany' AND ROWNUM <= 3;
  ```

> **为什么要LIMIT你的查询结果**
>
> LIMIT作为一种简单的分页方法，主要是为了**减少数据返回的时间**，如果您查询一个非常大的表(例如一个有数十万或数百万行的表)而不使用限制，那么您可能会等待很长时间才能显示所有的结果，所以使用LIMIT可以减少查询数据返回的时间，提高效率。

***

#### 1.3.2 **SQL LIKE 运算符**

- 在WHERE子句中使用LIKE运算符来搜索列中的指定模式

  　有两个通配符与LIKE运算符一起使用：

  - `％` - 百分号表示零个，一个或多个字符
  - `_` - 下划线表示单个字符

  > **注意：** MS Access使用问号（`?`）而不是下划线（`_`）
  >
  > 百分号和下划线也可以组合使用！ 

- **SQL LIKE 语法**

  ```sql
  SELECT column1, column2, ...
  FROM table_name
  WHERE columnN LIKE pattern;
  ```

> **提示**：您还可以使用AND或OR运算符组合任意数量的条件。    
>
> 下面是一些使用'％'和'_'通配符显示不同LIKE运算符的例子：

| LIKE 运算符                     | 描述                                 |
| ------------------------------- | ------------------------------------ |
| WHERE CustomerName LIKE 'a%'    | 查找以“a”开头的任何值                |
| WHERE CustomerName LIKE '%a'    | 查找以“a”结尾的任何值                |
| WHERE CustomerName LIKE '%or%'  | 在任何位置查找任何具有“or”的值       |
| WHERE CustomerName LIKE '_r%'   | 在第二个位置查找任何具有“r”的值      |
| WHERE CustomerName LIKE 'a_%_%' | 查找以“a”开头且长度至少为3个字符的值 |
| WHERE ContactName LIKE 'a%o'    | 找到以"a"开头，以"o"结尾的值         |

- **SQL LIKE 运算符实例**

  ​    以下SQL语句选择以“a”开头的CustomerName的所有客户：        

  　**代码示例：**     

  ```
  SELECT * FROM Customers
  WHERE CustomerName LIKE 'a%';
  ```

  ***

  ​	以下SQL语句选择客户名称以“a”结尾的所有客户：

  　**代码示例：**    

  ```
  SELECT * FROM Customers
  WHERE CustomerName LIKE '%a';
  ```

  ***

  ​	以下SQL语句选择客户名称在任何位置都具有“或”的所有客户：

  　**代码示例：**    

  ```
  SELECT * FROM Customers
  WHERE CustomerName LIKE '%or%';
  ```

  ***

  ​	以下SQL语句选择客户名称在第二位具有“r”的所有客户：

  　**代码示例：**    

  ```
  SELECT * FROM Customers
  WHERE CustomerName LIKE '_r%';
  ```

  　以下SQL语句选择客户名称以“a”开头且长度至少为3个字符的所有客户：

  　**代码示例：**    

  ```
  SELECT * FROM Customers
  WHERE CustomerName LIKE 'a_%_%';
  ```

  　以下SQL语句选择联系人名称以“a”开头并以“o”结尾的所有客户：

  　**代码示例：**    

  ```
  SELECT * FROM Customers
  WHERE ContactName LIKE 'a%o';
  ```

  　以下SQL语句选择客户名称不以“a”开头的所有客户：

  　**代码示例：**    

  ```
  SELECT * FROM Customers
  WHERE CustomerName NOT LIKE 'a%';
  ```

  　以下SQL语句选择客户名称以“a”开头，以“s”结尾的5位字符的所有客户：

  　**代码示例：**

  ```
  SELECT * FROM Customers
  WHERE CustomerName NOT LIKE 'a___s';
  ```

***

#### 1.3.3 **SQL Wildcards 通配符**

- 通配符用于替换字符串中的任何其他字符。            

  > 通配符与**SQL LIKE**运算符一起使用。在WHERE子句中使用LIKE运算符来搜索列中的指定模式。 
  >
  > 有两个通配符与LIKE运算符一起使用： 

  - `％` - 百分号表示零个，一个或多个字符
  - `_` - 下划线表示单个字符

- 下面是一些使用'`％`'和'`_`'通配符显示不同LIKE运算符的例子：

  | LIKE运算符                        | 描述                                   |
  | --------------------------------- | -------------------------------------- |
  | WHERE CustomerName LIKE 'a%'      | 查找以“a”开头的任何值                  |
  | WHERE CustomerName LIKE '%a'      | 查找以"a"结尾的任何值                  |
  | WHERE CustomerName LIKE '%or%'    | 在任何位置查找任何具有“or”的值         |
  | WHERE CustomerName LIKE '_r%'     | 在第二个位置查找任何具有“r”的值        |
  | WHERE CustomerName LIKE 'a\_%\_%' | 查找以“a”开头并且长度至少为3个字符的值 |
  | WHERE ContactName LIKE 'a%o'      | 查找以“a”开始并以“o”结尾的任何值       |

- **使用 SQL _ 通配符**

  以下SQL语句选择City以任意字符开头，然后是“erlin”的所有客户：

```
SELECT * FROM Customers                
WHERE City LIKE '_erlin';
```

​		以下SQL语句选择City开头为“L”，后面是任意字符，后面是“n”，后面是任意字符，后面是“on”的所有客户：

```
SELECT * FROM Customers                
WHERE City LIKE 'L_n_on';
```

- **使用 SQL [charlist] 通配符**

------

　以下SQL语句选择所有客户City以"b"、"s"或"p"开头：

```
SELECT * FROM Customers                
WHERE City LIKE '[bsp]%';
```

　以下SQL语句选择“City”以“a”、“b”或“c”开头的所有客户：

```
SELECT * FROM Customers                
WHERE City LIKE '[a-c]%';
```

　以下SQL语句选择所有客户City不以"b"、"s"或"p"开头：

```
SELECT * FROM Customers                
WHERE City LIKE '[!bsp]%';
```

- **使用[！charlist]通配符**

　以下两个SQL语句选择所有客户的城市不以“b”，“s”或“p”开头：

　**代码示例：**

```
SELECT * FROM Customers
WHERE City LIKE '[!bsp]%';
```

　要么：

　**代码示例：**

```
SELECT * FROM Customers
WHERE City NOT LIKE '[bsp]%';
```

***

#### 1.3.4 **SQL IN 运算符**

- IN运算符允许您在WHERE子句中指定多个值。 

  IN运算符是多个OR条件的简写。   

  **SQL IN 语法**

  ```
  SELECT column_name(s)
  FROM table_name
  WHERE column_name IN (value1, value2, ...);      
  ```

  **或者**

  ```
  SELECT column_name(s)
  FROM table_name
  WHERE column_name IN (SELECT STATEMENT);
  ```

- **IN 操作符实例**

  　以下SQL语句选取位于“Germany”，“France”和“UK”的所有客户：

  ```
  SELECT * FROM Customers
  WHERE Country IN ('Germany', 'France', 'UK');
  ```

  　以下SQL语句选取不在“Germany”，“France”或“UK”中的所有客户：

  ```
  SELECT * FROM Customers
  WHERE Country NOT IN ('Germany', 'France', 'UK'); 
  ```

  　以下SQL语句选取来自同一国家的所有客户作为供应商：

  ```
  SELECT * FROM Customers
  WHERE Country IN (SELECT Country FROM Suppliers);
  ```

| CustomerID | CustomerName                       | ContactName        | Address                       | City        | PostalCode | Country |
| ---------- | :--------------------------------- | :----------------- | :---------------------------- | :---------- | :--------- | :------ |
| 1          | Alfreds Futterkiste                | Maria Anders       | Obere Str. 57                 | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo       | Avda. de la Constitución 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno     | Mataderos 2312                | México D.F. | 05023      | Mexico  |
| 4          | Around the Horn                    | Thomas Hardy       | 120 Hanover Sq.               | London      | WA1 1DP    | UK      |
| 5          | Berglunds snabbköp                 | Christina Berglund | Berguvsvägen 8                | Luleå       | S-958 22   | Sweden  |

***

#### 1.3.5 **SQL BETWEEN**

- BETWEEN运算符用于选取介于两个值之间的数据范围内的值。
- BETWEEN运算符选择给定范围内的值。值可以是数字，文本或日期。
- BETWEEN运算符是包含性的：包括开始和结束值，且开始值需小于结束值。 

**SQL BETWEEN 语法**

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

要否定BETWEEN运算符的结果，可以添加NOT运算符：

```
SELECT column_name(s)
FROM table_name
WHERE column_name NOT BETWEEN value1 AND value2;
```

**BETWEEN 运算符实例**

　以下SQL语句选择价格在10到20之间的所有产品

```
SELECT * FROM Products        
WHERE Price BETWEEN 10 AND 20;        
```

**NOT BETWEEN 操作符实例**

　要显示前面示例范围之外的产品，请使用NOT BETWEEN：    

```
SELECT * FROM Products        
WHERE Price NOT BETWEEN 10 AND 20;       
```

**带有 IN 的 BETWEEN 操作符实例**

　以下SQL语句选择价格在10到20之间但CategoryID不是1、2或3的所有产品：

```
SELECT * FROM Products        
WHERE (Price BETWEEN 10 AND 20)        
AND NOT CategoryID IN (1,2,3);        
```

**带有文本值的 BETWEEN 操作符实例**

　以下SQL语句选择所有带有ProductName BETWEEN'Carnarvon Tigers'和'Mozzarella di Giovanni'的产品：    

```
SELECT * FROM Products        
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'        
ORDER BY ProductName;       
```

**带有文本值的 NOT BETWEEN 操作符实例**

　以下SQL语句选择ProductName不是BETWEEN'Carnarvon Tigers'和'Mozzarella di Giovanni'的所有产品：    

````
SELECT * FROM Products        
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'        
ORDER BY ProductName;
````

以下是"Products"表中的数据：

| ProductID | ProductName                  | SupplierID | CategoryID | Unit                | Price |
| :-------- | :--------------------------- | :--------- | :--------- | :------------------ | :---- |
| 1         | Chais                        | 1          | 1          | 10 boxes x 20 bags  | 18    |
| 2         | Chang                        | 1          | 1          | 24 - 12 oz bottles  | 19    |
| 3         | Aniseed Syrup                | 1          | 2          | 12 - 550 ml bottles | 10    |
| 4         | Chef Anton's Cajun Seasoning | 1          | 2          | 48 - 6 oz jars      | 22    |
| 5         | Chef Anton's Gumbo Mix       | 1          | 2          | 36 boxes            | 21.35 |

***

**带有日期值的 BETWEEN 操作符实例**

　以下 SQL 语句选取 OrderDate 介于 '04-July-1996' 和 '09-July-1996' 之间的所有订单：

```
SELECT * FROM Orders 
WHERE OrderDate BETWEEN #07/04/1996# AND #07/09/1996#; 
```

***

#### 1.3.6 **SQL 通用数据类型**

- 数据库表中的每一列都需要有一个名称和数据类型。
  - SQL 开发人员必须在创建 SQL 表时决定表中的每个列将要存储的数据的类型。数据类型是一个标签，是便于 SQL 了解每个列期望存储什么类型的数据的指南，它也标识了 SQL 如何与存储的数据进行交互。
  - 下面的表格列出了 SQL 中通用的数据类型：

| 数据类型                                                   | 描述                                                         |
| :--------------------------------------------------------- | :----------------------------------------------------------- |
| CHARACTER(n)                                               | 字符/字符串。固定长度 n。                                    |
| VARCHAR(n) 或                         CHARACTER VARYING(n) | 字符/字符串。可变长度。最大长度 n。                          |
| BINARY(n)                                                  | 二进制串。固定长度 n。                                       |
| BOOLEAN                                                    | 存储 TRUE 或 FALSE 值                                        |
| VARBINARY(n) 或                         BINARY VARYING(n)  | 二进制串。可变长度。最大长度 n。                             |
| INTEGER(p)                                                 | 整数值（没有小数点）。精度 p。                               |
| SMALLINT                                                   | 整数值（没有小数点）。精度 5。                               |
| INTEGER                                                    | 整数值（没有小数点）。精度 10。                              |
| BIGINT                                                     | 整数值（没有小数点）。精度 19。                              |
| DECIMAL(p,s)                                               | 精确数值，精度 p，小数点后位数 s。例如：decimal(5,2) 是一个小数点前有 3 位数小数点后有 2 位数的数字。 |
| NUMERIC(p,s)                                               | 精确数值，精度 p，小数点后位数 s。（与 DECIMAL 相同）        |
| FLOAT(p)                                                   | 近似数值，尾数精度 p。一个采用以 10 为基数的指数计数法的浮点数。该类型的 size 参数由一个指定最小精度的单一数字组成。 |
| REAL                                                       | 近似数值，尾数精度 7。                                       |
| FLOAT                                                      | 近似数值，尾数精度 16。                                      |
| DOUBLE PRECISION                                           | 近似数值，尾数精度 16。                                      |
| DATE                                                       | 存储年、月、日的值。                                         |
| TIME                                                       | 存储小时、分、秒的值。                                       |
| TIMESTAMP                                                  | 存储年、月、日、小时、分、秒的值。                           |
| INTERVAL                                                   | 由一些整数字段组成，代表一段时间，取决于区间的类型。         |
| ARRAY                                                      | 元素的固定长度的有序集合                                     |
| MULTISET                                                   | 元素的可变长度的无序集合                                     |
| XML                                                        | 存储 XML 数据                                                |

- **SQL 数据类型快速参考手册**

  　然而，不同的数据库为数据类型定义提供了不同的选择。            
    　下表显示了不同数据库平台上某些数据类型的通用名称：             

  | 数据类型            | Access                                          | SQLServer                                                    | Oracle                                   | MySQL                               | PostgreSQL                               |
  | :------------------ | :---------------------------------------------- | :----------------------------------------------------------- | :--------------------------------------- | :---------------------------------- | :--------------------------------------- |
  | *boolean*           | Yes/No                                          | Bit                                                          | Byte                                     | N/A                                 | Boolean                                  |
  | *integer*           | Number (integer)                                | Int                                                          | Number                                   | Int                         Integer | Int                         Integer      |
  | *float*             | Number (single)                                 | Float                         Real                           | Number                                   | Float                               | Numeric                                  |
  | *currency*          | Currency                                        | Money                                                        | N/A                                      | N/A                                 | Money                                    |
  | *string (fixed)*    | N/A                                             | Char                                                         | Char                                     | Char                                | Char                                     |
  | *string (variable)* | Text (<256)                         Memo (65k+) | Varchar                                                      | Varchar                         Varchar2 | Varchar                             | Varchar                                  |
  | *binary object*     | OLE Object Memo                                 | Binary (fixed up to 8K)                         Varbinary (<8K)                         Image (<2GB) | Long                         Raw         | Blob                         Text   | Binary                         Varbinary |

***

#### 1.3.7 **SQL Join**

- SQL join 用于把来自两个或多个表的行结合起来

  - 简单地说，就是先确定一个主表作为结果集，然后，把其他表的行有选择性地“连接”在主表结果集上。    

  - 最常见的 JOIN 类型：**SQL INNER JOIN（简单的 JOIN）**。 SQL INNER JOIN 从多个表中返回满足 JOIN 条件的所有行。

  　让我们看看选自 "Orders" 表的数据：

  | OrderID | CustomerID | OrderDate  |
  | :------ | :--------- | :--------- |
  | 10308   | 2          | 1996-09-18 |
  | 10309   | 37         | 1996-09-19 |
  | 10310   | 77         | 1996-09-20 |

  　然后，看看选自 "Customers" 表的数据：

  | CustomerID | CustomerName                       | ContactName    | Country |
  | :--------- | :--------------------------------- | :------------- | :------ |
  | 1          | Alfreds Futterkiste                | Maria Anders   | Germany |
  | 2          | Ana Trujillo Emparedados y helados | Ana Trujillo   | Mexico  |
  | 3          | Antonio Moreno Taquería            | Antonio Moreno | Mexico  |

  > 请注意，"Orders" 表中的 "CustomerID" 列指向 "Customers" 表中的客户。上面这两个表是通过 "CustomerID" 列联系起来的。

- **运行下列语句**

```
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate 
FROM Orders 
INNER JOIN Customers 
ON Orders.CustomerID=Customers.CustomerID;
```

　运行结果如下所示：

| OrderID | CustomerName                       | OrderDate  |
| :------ | :--------------------------------- | :--------- |
| 10308   | Ana Trujillo Emparedados y helados | 1996-09-18 |

- **不同的 SQL JOIN**

  > 在我们继续讲解实例之前，我们先列出您可以使用的不同的 SQL JOIN 类型：

  - **INNER JOIN**：如果表中有至少一个匹配，则返回行
  - **LEFT JOIN**：即使右表中没有匹配，也从左表返回所有的行
  - **RIGHT JOIN**：即使左表中没有匹配，也从右表返回所有的行
  - **FULL JOIN**：只要其中一个表中存在匹配，则返回行
  - **SELF JOIN**：用于将表连接到自己，就好像该表是两个表一样，临时重命名了SQL语句中的至少一个表       
  - **CARTESIAN JOIN**：从两个或多个连接表返回记录集的笛卡儿积 

***

#### 1.3.8 SQL INNER JOIN 

- 内部链接**INNER JOIN**关键字选择两个表中具有匹配值的记录。

- **SQL INNER JOIN 语法**

  ```
  SELECT column_name(s)
  FROM table1
  INNER JOIN table2 ON table1.column_name = table2.column_name;
  ```

以下是 "Customers" 表中的数据：

| CustomerID | CustomerName                       | ContactName    | Address                       | City        | PostalCode | Country |
| :--------- | :--------------------------------- | :------------- | :---------------------------- | :---------- | :--------- | :------ |
| 1          | Alfreds Futterkiste                | Maria Anders   | Obere Str. 57                 | Berlin      | 12209      | Germany |
| 2          | Ana Trujillo Emparedados y helados | Ana Trujillo   | Avda. de la Constitución 2222 | México D.F. | 05021      | Mexico  |
| 3          | Antonio Moreno Taquería            | Antonio Moreno | Mataderos 2312                | México D.F. | 05023      | Mexico  |

选自 "Orders" 表的数据：

| OrderID | CustomerID | EmployeeID | OrderDate  | ShipperID |
| :------ | :--------- | :--------- | :--------- | :-------- |
| 10308   | 2          | 7          | 1996-09-18 | 3         |
| 10309   | 37         | 3          | 1996-09-19 | 1         |
| 10310   | 77         | 8          | 1996-09-20 | 2         |

```sql
SELECT Customers.CustomerName,Orders.OrderID
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;
```

> 注释：如果表中至少有一个匹配项，INNER JOIN 关键字将返回一行。如果 "Customers" 表中的行与"Orders" 不匹配，则不会列出行。

***

#### 1.3.9 **SQL UNION **

- UNION运算符用于组合两个或更多SELECT语句的结果集，而不返回任何重复的行  
  - UNION中的每个SELECT语句必须具有相同的列数
  - 这些列也必须具有相似的数据类型
  - 每个SELECT语句中的列也必须以相同的顺序排列
  - 每个SELECT语句必须有相同数目的列表达式
  - 但是每个SELECT语句的长度不必相同

- **SQL UNION 语法1**

  ```
  SELECT column_name(s) FROM table1
  UNION
  SELECT column_name(s) FROM table2;
  ```

> **注释：**默认情况下，UNION 运算符选择一个不同的值。如果允许重复值，请使用 UNION ALL。

- **SQL UNION 语法2**

```
SELECT column_name(s) FROM table1
[WHERE condition]

UNION
SELECT column_name(s) FROM table2
[WHERE condition];
```

- **SQL UNION ALL 语法1**

  　UNION All运算符用于组合两个SELECT语句(**包括重复行**)的结果。

    　适用于UNION子句的相同规则将适用于UNION All操作符。

  ```
  SELECT column_name(s) FROM table1
  UNION ALL
  SELECT column_name(s) FROM table2;
  ```

  > **注释：**UNION结果集中的列名总是等于UNION中第一个SELECT语句中的列名。

  - **SQL UNION ALL 语法2**

  ```
  SELECT column_name(s) FROM table1
  [WHERE condition]
  UNION ALL
  SELECT column_name(s) FROM table2
  [WHERE condition];
  ```

***

#### 1.3.10 **SQL SELECT INTO**

- **SQL SELECT INTO 语法** 

  　我们可以把所有的列都复制到新表中：

  ```
  SELECT *
  INTO newtable [IN externaldb]
  FROM table1;
  ```

  　或者只复制希望的列插入到新表中：

  ```
  SELECT column_name(s)
  INTO newtable [IN externaldb]
  FROM table1;
  ```

- **SQL SELECT INTO 实例**

  　创建 Customers 的备份复件：

  ```
  SELECT *
  INTO CustomersBackup2013
  FROM Customers;
  ```

  　请使用 IN 子句来复制表到另一个数据库中：

  ```
  SELECT *
  INTO CustomersBackup2013 IN 'Backup.mdb'
  FROM Customers;
  ```

  　只复制一些列插入到新表中：

  ```
  SELECT CustomerName,
  ContactName
  INTO CustomersBackup2013
  FROM Customers;
  ```

  　只复制德国的客户插入到新表中：

  ```
  SELECT *
  INTO CustomersBackup2013
  FROM Customers
  WHERE Country='Germany';
  ```

  　复制多个表中的数据插入到新表中：

  ```
  SELECT Customers.CustomerName, Orders.OrderID
  INTO CustomersOrderBackup2013
  FROM Customers
  LEFT JOIN Orders
  ON Customers.CustomerID=Orders.CustomerID;
  ```

  　**提示：**SELECT INTO 语句可以用于在另一种模式下创建一个新的空表。只需添加WHERE子句，使查询返回时没有数据：

  ```
  SELECT *
  INTO newtable
  FROM table1
  WHERE 1=0;
  ```

***

#### 1、3、11**SQL INSERT INTO SELECT 语句**

- **SQL INSERT INTO SELECT 语法**

　我们可以将所有列从一个表中复制到另一个已经存在的表中：

```
INSERT INTO table2              
SELECT * FROM table1;    
```

　或者我们可以把想要的列复制到另一个现有的表中：

```
INSERT INTO table2               
(column_name(s))              
SELECT column_name(s)             
FROM table1;   
```

***

#### 1、3、12**SQL 撤销索引、表以及数据库**

- **DROP INDEX 语句**

  　DROP INDEX 语句用于**删除表中的索引**

  - **用于 MySQL 的 DROP INDEX 语法：**

  ```
  ALTER TABLE table_name DROP INDEX index_name        
  ```

  - **DROP TABLE 语句**

     DROP TABLE 语句用于删除表。

  ```
  DROP TABLE table_name              
  ```

  - **DROP DATABASE 语句**

  　DROP DATABASE 语句用于删除数据库。

  ```
  DROP DATABASE database_name    
  ```

  - **TRUNCATE TABLE 语句**

  　如果我们只需要删除表中的数据，而不删除表本身，那么我们该怎么做？

  　使用TRUNCATE TABLE语句：

  ```
  TRUNCATE TABLE table_name   
  ```

***

#### 1、3、13**SQL CREATE DATABASE 语句**

- **SQL CREATE DATABASE 语法**

  ```
  CREATE DATABASE dbname;
  ```

  　在创建任何数据库之前，请确保您拥有管理权限

- **SQL CREATE DATABASE 实例**

  　下面的 SQL 语句创建一个名为 "my_db" 的数据库：

  ```
  CREATE DATABASE my_db;
  ```

  　数据库表可以通过 CREATE TABLE 语句来添加。

  　创建数据库后，您可以在数据库列表中检查它。

  　语句：

  ```
  SHOW DATABASES;
  ```

***

#### 1、3、14**SQL CREATE TABLE 语句**

- **SQL CREATE TABLE 语句**

  　CREATE TABLE 语句用于创建数据库中的表。

    　表由行和列组成，每个表都必须有个表名。

  - **SQL CREATE TABLE 语法**

  ```
  CREATE TABLE table_name                
  (                
  column_name1 data_type(size),                
  column_name2 data_type(size),                
  column_name3 data_type(size),                
  ....                
  );       
  ```

- **column_name** 参数规定表中列的名称。

  **data_type** 参数规定列的数据类型（例如 varchar、integer、decimal、date 等等）。

  **size** 参数规定表中列的最大长度。

- 现在我们想要创建一个名为 "Persons" 的表，包含五列：PersonID、LastName、FirstName、Address 和 City。

  ```
  CREATE TABLE Persons                
  (                
  PersonID int,                
  LastName varchar(255),                
  FirstName varchar(255),                
  Address varchar(255),                
  City varchar(255)                
  );
  ```

  | PersonID | LastName | FirstName | Address | City |
  | :------- | :------- | :-------- | :------ | :--- |
  |          |          |           |         |      |

***

#### 1、3、15**SQL ALTER TABLE 语句**

- ALTER TABLE 语句用于在现有表中添加、删除或修改列。

  - **SQL ALTER TABLE 语法** 

  　若要向表中**添加列**，请使用以下语法：

  ```
  ALTER TABLE table_name                
  ADD column_name datatype              
  ```

  　若要**删除表中的列**，请使用以下语法（请注意，一些数据库系统不允许这样删除数据库表中的列）：

  ```
  ALTER TABLE table_name                
  DROP COLUMN column_name      
  ```

  　若要更改表中列的数据类型，请使用以下语法：

  **My SQL / Oracle：**         

  ```
  ALTER TABLE table_name                
  MODIFY COLUMN column_name datatype 
  ```

***

#### 1、3、16**SQL AUTO INCREMENT 字段**

- Auto-increment 会在新记录插入表中时生成一个唯一的数字

- 我们通常希望在每次插入新记录时自动创建主键字段的值。            

- 我们可以在表中创建一个自动增量（auto-increment）字段。        

  - **用于 MySQL 的语法**

  　以下SQL语句将 "Persons" 表中的“ID”列定义为自动递增（auto-increment）主键字段：

  ```
  CREATE TABLE Persons                
  (                
  ID int NOT NULL AUTO_INCREMENT,                
  LastName varchar(255) NOT NULL,                
  FirstName varchar(255),                
  Address varchar(255),                
  City varchar(255),                
  PRIMARY KEY (ID)                
  )
  ```

  　MySQL使用AUTO_INREMENT关键字来执行自动增量（ auto-increment ）任务。 

  　默认情况下，AUTO_INREMENT的起始值为1，每个新记录增加1。

  ***

  　若要以其他值开始AUTO_INREMENT序列，请使用以下SQL语法：

  ```
  ALTER TABLE Persons AUTO_INCREMENT=100       
  ```

  　要在 "Persons" 表中插入新记录，我们不需要为"ID"栏指定值（自动添加唯一值）：

  ```
  INSERT INTO Persons (FirstName,LastName)                
  VALUES ('Lars','Monsen')        
  ```

  　上面的SQL语句在 "Persons" 表中插入一个新记录。“ID”栏将得到唯一值。"FirstName"栏设置为"Lars"，"LastName"栏设置为"Monsen"。

***

#### 1、3、17**SQL CREATE VIEW、REPLACE VIEW、 DROP VIEW 语句**

- **SQL 视图（Views）**

  　视图是可视化的表。

    　本章讲解如何创建、更新和删除视图。

- **SQL CREATE VIEW 语句**

  - 在 SQL 中，视图是基于 SQL 语句的结果集的可视化表。
  - 视图包含行和列，就像真正的表一样。视图中的字段是一个或多个数据库中真实表中的字段。
  - 您可以添加 SQL 函数，在哪里添加，并将语句连接到视图，或者您可以呈现数据，就像数据来自单个表一样。

- **SQL CREATE VIEW 语法**

  ```
  CREATE VIEW view_name AS                
  SELECT column_name(s)                
  FROM table_name                
  WHERE condition    
  ```

- 示例数据库 Northwind 默认安装了一些视图。

  　"Current Product List"(当前产品列表)视图从"Products"表中列出了所有正在使用的产品（未停产的产品）。这个视图使用下面的 SQL 创建：

  ```
  CREATE VIEW [Current Product List] AS                
  SELECT ProductID,ProductName                
  FROM Products                
  WHERE Discontinued=No      
  ```

  　我们可以像这样查询上面这个视图：

  ```
  SELECT * FROM [Current Product List]        
  ```

  　Northwind 样本数据库的另一个视图会选取 "Products" 表中所有单位价格高于平均单位价格的产品：

  ```
  CREATE VIEW [Products Above Average Price] AS                
  SELECT ProductName,UnitPrice                
  FROM Products                
  WHERE UnitPrice>(SELECT AVG(UnitPrice) FROM Products)     
  ```

  　我们可以像这样查询上面这个视图：

  ```
  SELECT * FROM [Products Above Average Price]        
  ```

  　Northwind 样本数据库的另一个视图会计算在 1997 年每个种类的销售总数。请注意，这个视图会从另一个名为 "Product Sales for 1997" 的视图那里选取数据：

  ```
  CREATE VIEW [Category Sales For 1997] AS                
  SELECT DISTINCT CategoryName,Sum(ProductSales) AS CategorySales                
  FROM [Product Sales for 1997]                
  GROUP BY CategoryName       
  ```

  　我们可以像这样查询上面这个视图：

  ```
  SELECT * FROM [Category Sales For 1997]       
  ```

  　我们也可以向查询添加条件。现在，我们仅仅需要查看 "Beverages" 类的销售总数：

  ```
  SELECT * FROM [Category Sales For 1997]                
  WHERE CategoryName='Beverages'
  ```

- **SQL 更新视图**

  　您可以使用下面的语法来更新视图：

  **SQL CREATE OR REPLACE VIEW 语法**

  ```
  CREATE OR REPLACE VIEW view_name AS                
  SELECT column_name(s)                
  FROM table_name                
  WHERE condition        
  ```

  　现在，我们希望向 "Current Product List" 视图添加 "Category" 列。我们将通过下列 SQL 更新视图：

  ```
  CREATE OR REPLACE VIEW [Current Product List] AS                
  SELECT ProductID,ProductName,Category                
  FROM Products                
  WHERE Discontinued=No                        
  ```

  - **SQL 撤销视图**

  　您可以通过 DROP VIEW 命令来删除视图。  

  **SQL DROP VIEW 语法**

  ```
  DROP VIEW view_name     
  ```

***

#### 1、3、18**SQL NULL 值 – IS NULL 和 IS NOT NULL**

- **SQL NULL 值**

  - NULL 空值代表丢失的未知数据。
  - 默认情况下，表列可以保存 NULL 值。
  - 本章解释 IS NULL 和 IS NOT NULL 操作符。

  **SQL NULL 值**

  - 如果表中的列是可选的，那么我们可以插入一个新记录或更新一个现有记录，而无需向列添加一个值。这意味着该字段将存储为 NULL 。            

  　NULL 值的处理与其他值不同。

  　NULL 为未知或不适当值的占位符。

  ![Note](https://atts.w3cschool.cn/attachments/image/lamp.gif)**注释：**无法比较 NULL 和 0；它们是不等价的。

  **SQL 的 NULL 值处理**

  　请看下面的 "Persons" 表：

  | P_Id | LastName  | FirstName | Address   | City      |
  | :--- | :-------- | :-------- | :-------- | :-------- |
  | 1    | Hansen    | Ola       |           | Sandnes   |
  | 2    | Svendson  | Tove      | Borgvn 23 | Sandnes   |
  | 3    | Pettersen | Kari      |           | Stavanger |

  　如果 "Persons" 表 "Address" 一栏是可选的。这意味着，如果在 "Address" 列中插入一个没有值的记录，则 "Address" 列将用 NULL 值保存。

  - 那么如何测试null的值呢？
    - 您不能使用比较操作符测试 NULL 值，例如=、<或<>。
    - 我们必须使用 IS NULL 和 IS NOT NULL 操作符。

  **SQL IS NULL**   

  　我们如何才能选择 "Address" 列中有 NULL 值的记录？

  　我们必须使用 IS NULL 操作符：

  ```
  SELECT LastName,FirstName,Address FROM Persons
  WHERE Address IS NULL
  ```

  　结果集如下所示：

  | LastName  | FirstName | Address |
  | :-------- | :-------- | :------ |
  | Hansen    | Ola       |         |
  | Pettersen | Kari      |         |

  ![Note](https://atts.w3cschool.cn/attachments/image/lamp.gif)**提示：总是使用 IS NULL 来查找 NULL **

  ***

  **SQL IS NOT NULL**

  　我们如何才能选择 "Address" 列中没有 NULL 值的记录？

  　我们必须使用 IS NOT NULL 操作符：

  ```
  SELECT LastName,FirstName,Address FROM Persons
  WHERE Address IS NOT NULL
  ```

  　结果集如下所示：

  | LastName | FirstName | Address   |
  | :------- | :-------- | :-------- |
  | Svendson | Tove      | Borgvn 23 |

***

### 1、4SQL进阶

#### 1、4、1**SQL Aliases 别名**

- 通过使用 SQL，可以为表名称或列名称指定别名（Alias）

  - SQL 别名用于为表或表中的列提供**临时名称**，数据库中的实际表名不会更改      
  - SQL 别名通常用于使**列名更具可读性**  
  - SQL 一个别名只存在于**查询期间**
  - 表别名的使用是在特定SQL语句中重命名表        
  - 列别名用于为特定SQL查询重命名表的列        

  **列的 SQL Alias 语法**

  ```
  SELECT column_name AS alias_name
  FROM table_name;
  WHERE [condition];
  ```

  **表的 SQL Alias 语法**

  ```
  SELECT column_name(s)
  FROM table_name AS alias_name;
  WHERE [condition];
  ```

- **注：如果别名包含空格，则需要双引号或方括号：**    

  ```
  SELECT CustomerName AS Customer, ContactName AS [Contact Person]        
  FROM Customers;
  ```

- 以下SQL语句创建一个名为“Address”的别名，它包含四列（Address，PostalCode，City and Country）：

  ```
  SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
  FROM Customers;
  ```

  　**注意：**要使上面的SQL语句在MySQL中工作，请使用以下命令：    

  ```
  SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address
  FROM Customers;
  ```

- **表的 Alias 实例**

  - 以下SQL语句选择CustomerID = 4（“围绕角”）的所有订单。我们使用“Customers”和“Orders”表，给它们分别为“c”和“o”的表别名（这里我们使用别名来使SQL更短）：    

  ```
  SELECT o.OrderID, o.OrderDate, c.CustomerName        
  FROM Customers AS c, Orders AS o        
  WHERE c.CustomerName="Around the Horn" AND c.CustomerID=o.CustomerID;
  ```

  - 在下列情况下使用别名是有用的：    
    - 查询涉及多个表                    
    - 用于查询函数
    - 需要把两个或更多的列放在一起
    - 列名长或可读性差

***

#### 1、4、2SQL约束

- 约束是作用于数据表中列上的规则，用于限制表中数据的类型。约束的存在保证了数据库中数据的精确性和可靠性。
- 约束有列级和表级之分，列级约束作用于单一的列，而表级约束作用于整张数据表
  - **NOT NULL** 约束：保证列中数据不能有 NULL 值
  - **DEFAULT** 约束：提供该列数据未指定时所采用的默认值
  - **UNIQUE** 约束：保证列中的所有数据各不相同
  - **主键约束**：唯一标识数据表中的行/记录
  - **外键约束**：唯一标识其他表中的一条行/记录
  - **CHECK** 约束：此约束保证列中的所有值满足某一条件
  - **索引**：用于在数据库中快速创建或检索数据

　约束可以在创建表时规定（通过 CREATE TABLE 语句），或者在表创建之后规定（通过 ALTER TABLE 语句）。

- **SQL创建约束**

  　当使用CREATE TABLE语句创建表时，或者在使用ALTER TABLE语句创建表之后，可以指定约束

  ```
  CREATE TABLE table_name (
      column1 datatype constraint,
      column2 datatype constraint,
      column3 datatype constraint,
      ....
  );
  ```

  **SQL CREATE TABLE + CONSTRAINT 语法**

  ```
  CREATE TABLE table_name                
  (                
  column_name1 data_type(size) constraint_name,                
  column_name2 data_type(size) constraint_name,                
  column_name3 data_type(size) constraint_name,                
  ....                
  );      
  ```

- **删除约束**

  - 任何现有约束都可以通过在 ALTER TABLE 命令中指定 DROP CONSTRAINT 选项的方法删除掉。

  - 例如，要去除 EMPLOYEES 表中的主键约束，可以使用下述命令：

  ```
  ALTER TABLE EMPLOYEES DROP CONSTRAINT EMPLOYEES_PK;
  ```

  - 一些数据库实现可能提供了删除特定约束的快捷方法。例如，要在 Oracle 中删除一张表的主键约束，可以使用如下命令：

  ```
  ALTER TABLE EMPLOYEES DROP PRIMARY KEY;
  ```

  - 某些数据库实现允许禁用约束。这样与其从数据库中永久删除约束，你可以只是临时禁用掉它，过一段时间后再重新启用。

***

#### 1、4、3SQL UNIQUE 约束

- UNIQUE 约束唯一标识数据库表中的每条记录。            
- UNIQUE 和 PRIMARY KEY 约束均为列或列集合提供了**唯一性**的保证。
- PRIMARY KEY 约束拥有自动定义的 UNIQUE 约束。
- 请注意，每个表可以有多个 UNIQUE 约束，但是每个表**只能有一个 PRIMARY KEY 约束**。

　下面的 SQL 在 "Persons" 表创建时在 "P_Id" 列上创建 UNIQUE 约束：

　**MySQL：**        

```
CREATE TABLE Persons                
(                
P_Id int NOT NULL,                
LastName varchar(255) NOT NULL,                
FirstName varchar(255),                
Address varchar(255),                
City varchar(255),                
UNIQUE (P_Id)                
)        
```

如需命名 UNIQUE 约束，并定义多个列的 UNIQUE 约束，请使用下面的 SQL 语法：

　**MySQL / SQL Server / Oracle / MS Access：**        

```
CREATE TABLE Persons                
(                
P_Id int NOT NULL,                
LastName varchar(255) NOT NULL,                
FirstName varchar(255),                
Address varchar(255),                
City varchar(255),                
CONSTRAINT uc_PersonID UNIQUE (P_Id,LastName)                
)       
```

- **ALTER TABLE 时的 SQL UNIQUE 约束**

当表已被创建时，如需在 "P_Id" 列创建 UNIQUE 约束，请使用下面的 SQL：

　**MySQL / SQL Server / Oracle / MS Access：**        

```
ALTER TABLE Persons                
ADD UNIQUE (P_Id)      
```

如需命名 UNIQUE 约束，并定义多个列的 UNIQUE 约束，请使用下面的 SQL 语法：

　**MySQL / SQL Server / Oracle / MS Access：**        

```
ALTER TABLE Persons                
ADD CONSTRAINT uc_PersonID UNIQUE (P_Id,LastName)                       
```

**撤销 UNIQUE 约束**

　如需撤销 UNIQUE 约束，请使用下面的 SQL：

　**MySQL：**        

```
ALTER TABLE Persons                
DROP INDEX uc_PersonID        
```

　**SQL Server / Oracle / MS Access：**        

```
ALTER TABLE Persons                
DROP CONSTRAINT uc_PersonID 
```

***

#### 1、4、4**SQL PRIMARY KEY 约束**

- PRIMARY KEY 约束唯一标识数据库表中的每条记录。

  　主键必须包含唯一的值。

    　主键列不能包含 NULL 值

    　每个表都应该有一个主键，并且每个表只能有一个主键

- 下面的 SQL 在 "Persons" 表创建时在 "P_Id" 列上创建 PRIMARY KEY 约束：

  　**MySQL：**        

  ```
  CREATE TABLE Persons                
  (                
  P_Id int NOT NULL,                
  LastName varchar(255) NOT NULL,                
  FirstName varchar(255),                
  Address varchar(255),                
  City varchar(255),                
  PRIMARY KEY (P_Id)                
  )        
  ```

- 如需命名 PRIMARY KEY 约束，并定义多个列的 PRIMARY KEY 约束，请使用下面的 SQL 语法：

  　**MySQL / SQL Server / Oracle / MS Access：**        

  ```
  CREATE TABLE Persons                
  (                
  P_Id int NOT NULL,                
  LastName varchar(255) NOT NULL,                
  FirstName varchar(255),                
  Address varchar(255),                
  City varchar(255),                
  CONSTRAINT pk_PersonID PRIMARY KEY (P_Id,LastName)                
  )     
  ```

> **注释：在上面的实例中，只有一个主键 PRIMARY KEY（pk_PersonID）。然而，pk_PersonID 的值是由两个列（P_Id 和 LastName）组成的**

- **ALTER TABLE 时的 SQL PRIMARY KEY 约束**

  　当表已被创建时，如需在 "P_Id" 列创建 PRIMARY KEY 约束，请使用下面的 SQL：

    　**MySQL / SQL Server / Oracle / MS Access：**        

  ```
  ALTER TABLE Persons                
  ADD PRIMARY KEY (P_Id)        
  ```

  　如需命名 PRIMARY KEY 约束，并定义多个列的 PRIMARY KEY 约束，请使用下面的 SQL 语法：

  　**MySQL / SQL Server / Oracle / MS Access：**        

  ```
  ALTER TABLE Persons                
  ADD CONSTRAINT pk_PersonID PRIMARY KEY (P_Id,LastName)       
  ```

  　**注释：**如果您使用 ALTER TABLE 语句添加主键，必须把主键列声明为不包含 NULL 值（在表首次创建时）

-  **撤销 PRIMARY KEY 约束**

　如需撤销 PRIMARY KEY 约束，请使用下面的 SQL：

　**MySQL：**        

```
ALTER TABLE Persons                
DROP PRIMARY KEY
```

***

#### 1、4、6**SQL FOREIGN KEY 约束**

- 一个表中的 FOREIGN KEY 指向另一个表中的 PRIMARY KEY。            

  　让我们通过一个实例来解释外键。请看下面两个表：

    　**"Persons" 表：**

  | P_Id | LastName  | FirstName | Address      | City      |
  | :--- | :-------- | :-------- | :----------- | :-------- |
  | 1    | Hansen    | Ola       | Timoteivn 10 | Sandnes   |
  | 2    | Svendson  | Tove      | Borgvn 23    | Sandnes   |
  | 3    | Pettersen | Kari      | Storgt 20    | Stavanger |

  　**"Orders" 表：**

  | O_Id | OrderNo | P_Id |
  | :--- | :------ | :--- |
  | 1    | 77895   | 3    |
  | 2    | 44678   | 3    |
  | 3    | 22456   | 2    |
  | 4    | 24562   | 1    |

> 请注意，"Orders" 表中的 "P_Id" 列指向 "Persons" 表中的 "P_Id" 列。
>
> "Persons" 表中的 "P_Id" 列是 "Persons" 表中的 PRIMARY KEY。
>
> "Orders" 表中的 "P_Id" 列是 "Orders" 表中的 FOREIGN KEY。
>
> FOREIGN KEY 约束用于预防破坏表之间连接的行为。
>
> FOREIGN KEY 约束也能防止非法数据插入外键列，因为它必须是它指向的那个表中的值之一

-  **CREATE TABLE 时的 SQL FOREIGN KEY 约束**

    　下面的 SQL 在 "Orders" 表创建时在 "P_Id" 列上创建 FOREIGN KEY 约束：

        　**MySQL：**        

  ```sql
  CREATE TABLE Orders                
  (                
  O_Id int NOT NULL,                
  OrderNo int NOT NULL,                
  P_Id int,               
  PRIMARY KEY (O_Id),                
  FOREIGN KEY (P_Id) REFERENCES Persons(P_Id)                
  )     
  ```

  **SQL Server / Oracle / MS Access：**        

```
CREATE TABLE Orders                
(                
O_Id int NOT NULL PRIMARY KEY,                
OrderNo int NOT NULL,                
P_Id int FOREIGN KEY REFERENCES Persons(P_Id)                
)      
```

- **ALTER TABLE 时的 SQL FOREIGN KEY 约束**

  　当 "Orders" 表已被创建时，如需在 "P_Id" 列创建 FOREIGN KEY 约束，请使用下面的 SQL：

    　**MySQL / SQL Server / Oracle / MS Access：**        

  ```
  ALTER TABLE Orders                
  ADD FOREIGN KEY (P_Id)                
  REFERENCES Persons(P_Id)   
  ```

  　如需命名 FOREIGN KEY 约束，并定义多个列的 FOREIGN KEY 约束，请使用下面的 SQL 语法：

  　**MySQL / SQL Server / Oracle / MS Access：**        

  ```
  ALTER TABLE Orders                
  ADD CONSTRAINT fk_PerOrders                
  FOREIGN KEY (P_Id)                
  REFERENCES Persons(P_Id)       
  ```

- **撤销 FOREIGN KEY 约束**

  　如需撤销 FOREIGN KEY 约束，请使用下面的 SQL：

    　**MySQL：**        

  ```
  ALTER TABLE Orders                
  DROP FOREIGN KEY fk_PerOrders          
  ```

  　**SQL Server / Oracle / MS Access：**        

  ```
  ALTER TABLE Orders                
  DROP CONSTRAINT fk_PerOrders     
  ```

***

#### 1、4、7**SQL DEFAULT 约束**

- DEFAULT 约束用于向列中插入默认值
- 如果没有规定其他的值，那么会将默认值添加到所有的新记录

- **CREATE TABLE 时的 SQL DEFAULT 约束**      

  　下面的 SQL 在 "Persons" 表创建时在 "City" 列上创建 DEFAULT 约束：

    　**My SQL / SQL Server / Oracle / MS Access：**        

  ```
  CREATE TABLE Persons
  (
  P_Id int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Address varchar(255),
  City varchar(255) DEFAULT 'Sandnes'
  ) 
  ```

  　通过使用类似 GETDATE() 这样的函数，DEFAULT 约束也可以用于插入系统值：

  ```
  CREATE TABLE Orders
  (
  O_Id int NOT NULL,
  OrderNo int NOT NULL,
  P_Id int,
  OrderDate date DEFAULT GETDATE()
  )
  ```

- **ALTER TABLE 时的 SQL DEFAULT 约束**

  　当表已被创建时，如需在 "City" 列创建 DEFAULT 约束，请使用下面的 SQL：

    　**MySQL：**        

  ```
  ALTER TABLE Persons
  ALTER City SET DEFAULT 'SANDNES'
  ```

  　**SQL Server / MS Access：**        

  ```
  ALTER TABLE Persons 
  ADD CONSTRAINT DF_Persons_City DEFAULT('SANDNES') FOR City
  
  --注释
  --Persons 为表名
  --City 为列名
  --DF_Persons_City 为我们创建的默认约束的名称 约束名称一般为:约束类型简称_表名_列名
  ```

  　**Oracle：**        

  ```
  ALTER TABLE Persons
  MODIFY City DEFAULT 'SANDNES'
  ```

- **撤销 DEFAULT 约束**

  　如需撤销 DEFAULT 约束，请使用下面的 SQL：

    　**MySQL：**        

  ```
  ALTER TABLE Persons
  ALTER City DROP DEFAULT
  ```

  　**SQL Server / Oracle / MS Access：**        

  ```
  ALTER TABLE Persons
  ALTER COLUMN City DROP DEFAULT
  ```

***

#### 1、4、8SQL CHECK 约束

- CHECK 约束用于限制列中的值的范围        
- 如果对单个列定义 CHECK 约束，那么该列只允许特定的值
- 如果对一个表定义 CHECK 约束，那么此约束会基于行中其他列的值在特定的列中对值进行限制

- **CREATE TABLE 时的 SQL CHECK 约束**

  　下面的 SQL 在 "Persons" 表创建时在 "P_Id" 列上创建 CHECK 约束。CHECK 约束规定 "P_Id" 列必须只包含大于 0 的整数。

    　**MySQL：**        

  ```sql
  CREATE TABLE Persons
  (
  P_Id int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Address varchar(255),
  City varchar(255),
  CHECK (P_Id>0)
  )
  ```

如需命名 CHECK 约束，并定义多个列的 CHECK 约束，请使用下面的 SQL 语法：

　**MySQL / SQL Server / Oracle / MS Access：**        

```
CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT chk_Person CHECK (P_Id>0 AND City='Sandnes')
)
```

- **ALTER TABLE 时的 SQL CHECK 约束**

  　当表已被创建时，如需在 "P_Id" 列创建 CHECK 约束，请使用下面的 SQL：

    　**MySQL / SQL Server / Oracle / MS Access:**        

  ```
  ALTER TABLE Persons
  ADD CHECK (P_Id>0) 
  ```

  　如需命名 CHECK 约束，并定义多个列的 CHECK 约束，请使用下面的 SQL 语法：

  　**MySQL / SQL Server / Oracle / MS Access：**        

  ```
  ALTER TABLE Persons
  ADD CONSTRAINT chk_Person CHECK (P_Id>0 AND City='Sandnes')
  ```

- **撤销 CHECK 约束**

  　如需撤销 CHECK 约束，请使用下面的 SQL：

    　**SQL Server / Oracle / MS Access：**        

  ```
  ALTER TABLE Persons
  DROP CONSTRAINT chk_Person
  ```

  　**MySQL：**        

  ```
  ALTER TABLE Persons
  DROP CHECK chk_Person
  ```

***

#### 1、4、9**SQL UNION 子句**

- SQL **UNION** 子句/运算符用于将两个或者更多的 SELECT 语句的运算结果**组合**起来。
- 在使用 UNION 的时候，每个 SELECT 语句必须有**相同数量**的**选中列**、相同数量的**列表达式**、相同的**数据类型**，并且它们出现的次序要一致，不过长度不一定要相同

**UNION** 子句的基本语法如下所示：

```sql
    SELECT column1 [, column2 ]
    FROM table1 [, table2 ]
    [WHERE condition]

    UNION

    SELECT column1 [, column2 ]
    FROM table1 [, table2 ]
    [WHERE condition]
```

考虑如下两张表，（a）CUSTOMERS 表：

```
    +----+----------+-----+-----------+----------+
    | ID | NAME     | AGE | ADDRESS   | SALARY   |
    +----+----------+-----+-----------+----------+
    |  1 | Ramesh   |  32 | Ahmedabad |  2000.00 |
    |  2 | Khilan   |  25 | Delhi     |  1500.00 |
    |  3 | kaushik  |  23 | Kota      |  2000.00 |
    |  4 | Chaitali |  25 | Mumbai    |  6500.00 |
    |  5 | Hardik   |  27 | Bhopal    |  8500.00 |
    |  6 | Komal    |  22 | MP        |  4500.00 |
    |  7 | Muffy    |  24 | Indore    | 10000.00 |
    +----+----------+-----+-----------+----------+
```

　（b）另一张表是 ORDERS 表，如下所示：

```
    +-----+---------------------+-------------+--------+
    |OID  | DATE                | CUSTOMER_ID | AMOUNT |
    +-----+---------------------+-------------+--------+
    | 102 | 2009-10-08 00:00:00 |           3 |   3000 |
    | 100 | 2009-10-08 00:00:00 |           3 |   1500 |
    | 101 | 2009-11-20 00:00:00 |           2 |   1560 |
    | 103 | 2008-05-20 00:00:00 |           4 |   2060 |
    +-----+---------------------+-------------+--------+
```

　现在，让我们用 SELECT 语句将这两张表连接起来：

```sql
    SQL> SELECT  ID, NAME, AMOUNT, DATE
         FROM CUSTOMERS
         LEFT JOIN ORDERS
         ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID
    UNION
         SELECT  ID, NAME, AMOUNT, DATE
         FROM CUSTOMERS
         RIGHT JOIN ORDERS
         ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;
```

结果如下所示：

```
    +------+----------+--------+---------------------+
    | ID   | NAME     | AMOUNT | DATE                |
    +------+----------+--------+---------------------+
    |    1 | Ramesh   |   NULL | NULL                |
    |    2 | Khilan   |   1560 | 2009-11-20 00:00:00 |
    |    3 | kaushik  |   3000 | 2009-10-08 00:00:00 |
    |    3 | kaushik  |   1500 | 2009-10-08 00:00:00 |
    |    4 | Chaitali |   2060 | 2008-05-20 00:00:00 |
    |    5 | Hardik   |   NULL | NULL                |
    |    6 | Komal    |   NULL | NULL                |
    |    7 | Muffy    |   NULL | NULL                |
    +------+----------+--------+---------------------+
```

- 　UNION ALL 运算符用于将两个 SELECT 语句的结果组合在一起，**重复行也包含在内**。

    　UNION ALL 运算符所遵从的规则与 UNION 一致

- **UNION ALL**的基本语法如下：

  ```
      SELECT column1 [, column2 ]
      FROM table1 [, table2 ]
      [WHERE condition]
  
      UNION ALL
  
      SELECT column1 [, column2 ]
      FROM table1 [, table2 ]
      [WHERE condition]
  ```

结果如下所示：

```
    +------+----------+--------+---------------------+
    | ID   | NAME     | AMOUNT | DATE                |
    +------+----------+--------+---------------------+
    |    1 | Ramesh   |   NULL | NULL                |
    |    2 | Khilan   |   1560 | 2009-11-20 00:00:00 |
    |    3 | kaushik  |   3000 | 2009-10-08 00:00:00 |
    |    3 | kaushik  |   1500 | 2009-10-08 00:00:00 |
    |    4 | Chaitali |   2060 | 2008-05-20 00:00:00 |
    |    5 | Hardik   |   NULL | NULL                |
    |    6 | Komal    |   NULL | NULL                |
    |    7 | Muffy    |   NULL | NULL                |
    |    3 | kaushik  |   3000 | 2009-10-08 00:00:00 |
    |    3 | kaushik  |   1500 | 2009-10-08 00:00:00 |
    |    2 | Khilan   |   1560 | 2009-11-20 00:00:00 |
    |    4 | Chaitali |   2060 | 2008-05-20 00:00:00 |
    +------+----------+--------+---------------------+
```

- **SQL INTERSECT** 子句：用于组合两个 SELECT 语句，但是只返回两个 SELECT 语句的结果中都有的行。
- **SQL EXCEPT** 子句：组合两个 SELECT 语句，并将第一个 SELECT 语句的结果中存在，但是第二个 SELECT 语句的结果中不存在的行返回。

***

#### 1、4、10**SQL 克隆数据表**

- 有些情况下，你可能需要原样拷贝某张数据表。但是，CREATE TABEL 却不能满足你的需要，因为复制表必须和原表拥有一样的索引、默认值等等。

   如果你在使用 MySQL 关系型数据库管理系统的话，下面几个步骤可以帮你解决这个问题：

  - 使用 SHOW CREATE TABLE 命令来获取一条指定了原表的结构、索引等信息的 CREATE　TABLE 语句。
  - 将语句中的表名修改为克隆表的名字，然后执行该语句。这样你就可以得到一张与原表完全相同的克隆表了。
  - 如果你还想要复制表中的数据的话，请执行 INSERT INTO ... SELECT 语句。

- **步骤一**：

  　获取数据表的完整结构：

  ```
  SQL> SHOW CREATE TABLE TUTORIALS_TBL \G;
  *************************** 1. row ***************************
         Table: TUTORIALS_TBL
  Create Table: CREATE TABLE `TUTORIALS_TBL` (
    `tutorial_id` int(11) NOT NULL auto_increment,
    `tutorial_title` varchar(100) NOT NULL default '',
    `tutorial_author` varchar(40) NOT NULL default '',
    `submission_date` date default NULL,
    PRIMARY KEY  (`tutorial_id`),
    UNIQUE KEY `AUTHOR_INDEX` (`tutorial_author`)
  ) TYPE=MyISAM
  1 row in set (0.00 sec)
  ```

  **步骤二：**

  　改变表名，创建新表：

  ```
  SQL> CREATE TABLE `CLONE_TBL` (
    -> `tutorial_id` int(11) NOT NULL auto_increment,
    -> `tutorial_title` varchar(100) NOT NULL default '',
    -> `tutorial_author` varchar(40) NOT NULL default '',
    -> `submission_date` date default NULL,
    -> PRIMARY KEY  (`tutorial_id`),
    -> UNIQUE KEY `AUTHOR_INDEX` (`tutorial_author`)
    -> ) TYPE=MyISAM;
  Query OK, 0 rows affected (1.80 sec)
  ```

  **步骤三：**

  　执行完步骤二之后，数据库就会有克隆表了。如果你还想要复制旧表中的数据的话，可以执行 INSERT INTO... SELECT 语句。

  ```
  SQL> INSERT INTO CLONE_TBL (tutorial_id,
      ->                        tutorial_title,
      ->                        tutorial_author,
      ->                        submission_date)
      -> SELECT tutorial_id,tutorial_title,
      ->        tutorial_author,submission_date,
      -> FROM TUTORIALS_TBL;
  Query OK, 3 rows affected (0.07 sec)
  Records: 3  Duplicates: 0  Warnings: 0
  ```

  　最终，你将如期拥有一张完全相同的克隆表。

***

#### 1、4、11**SQL 索引**

- 索引是一种特殊的查询表，可以被数据库搜索引擎用来**加速数据的检索**。简单说来，索引就是指向表中数据的指针。数据库的索引同书籍后面的索引非常相像
- 索引能够提高 SELECT 查询和 WHERE 子句的速度，但是却降低了包含 UPDATE 语句或 INSERT 语句的数据输入过程的速度。索引的创建与删除不会对表中的数据产生影响

　**CREATE INDEX**命令的基本语法如下：

```
CREATE INDEX index_name ON table_name;
```

**单列索引：**

- 单列索引基于单一的字段创建，其基本语法如下所示：

```
CREATE INDEX index_name
ON table_name (column_name);
```

**唯一索引：**

- 唯一索引不止用于提升查询性能，还用于保证数据完整性。唯一索引不允许向表中插入任何重复值。其基本语法如下所示：

```
CREATE UNIQUE INDEX index_name
on table_name (column_name);
```

**聚簇索引：**

- 聚簇索引在表中两个或更多的列的基础上建立。其基本语法如下所示：

```
CREATE INDEX index_name
on table_name (column1, column2);
```

> 创建单列索引还是聚簇索引，要看每次查询中，哪些列在作为过滤条件的 WHERE 子句中最常出现。
>
> 如果只需要一列，那么就应当创建单列索引。如果作为过滤条件的 WHERE 子句用到了两个或者更多的列，那么聚簇索引就是最好的选择。

**隐式索引：**

- 隐式索引由数据库服务器在创建某些对象的时候自动生成。例如，对于主键约束和唯一约束，数据库服务器就会自动创建索引    

**DROP INDEX 命令：**

　索引可以用 SQL **DROP** 命令删除。删除索引时应当特别小心，数据库的性能可能会因此而降低或者提高。

　其基本语法如下：

```
DROP INDEX table_name.index_name;
```

***

- 尽管创建索引的目的是提升数据库的性能，但是还是有一些情况应当避免使用索引。下面几条指导原则给出了何时应当重新考虑是否使用索引：
  - 小的数据表不应当使用索引；
  - 需要频繁进行大批量的更新或者插入操作的表；
  - 如果列中包含大数或者 NULL 值，不宜创建索引；
  - 频繁操作的列不宜创建索引

***

#### 1、4、12**SQL 子查询**

- 子查询（Sub Query）或者说内查询（Inner Query），也可以称作嵌套查询（Nested Query），是一种嵌套在其他 SQL 查询的 WHERE 子句中的查询
  - 子查询用于为主查询返回其所需数据，或者对检索数据进行进一步的限制
  - 子查询可以在 SELECT、INSERT、UPDATE 和 DELETE 语句中，同 =、<、>、>=、<=、IN、BETWEEN 等运算符一起使用
  - 使用子查询必须遵循以下几个规则：
    - 子查询必须括在圆括号中。
    - 子查询的 SELECT 子句中只能有一个列，除非主查询中有多个列，用于与子查询选中的列相比较。
    - 子查询不能使用 ORDER BY，不过主查询可以。在子查询中，GROUP BY 可以起到同 ORDER BY 相同的作用。
    - 返回多行数据的子查询只能同多值操作符一起使用，比如 IN 操作符。
    - SELECT 列表中不能包含任何对 BLOB、ARRAY、CLOB 或者 NCLOB 类型值的引用。
    - 子查询不能直接用在集合函数中。
    - BETWEEN 操作符不能同子查询一起使用，但是 BETWEEN 操作符可以用在子查询中。

- **SELECT 语句中的子查询**

  　通常情况下子查询都与 SELECT 语句一起使用，其基本语法如下所示：

  ```sql
  SELECT column_name [, column_name ]
  FROM   table1 [, table2 ]
  WHERE  column_name OPERATOR
        (SELECT column_name [, column_name ]
        FROM table1 [, table2 ]
        [WHERE])
  ```

- 考虑 CUSTOMERS 表，表中记录如下所示：

  ```sql
  +----+----------+-----+-----------+----------+
  | ID | NAME     | AGE | ADDRESS   | SALARY   |
  +----+----------+-----+-----------+----------+
  |  1 | Ramesh   |  35 | Ahmedabad |  2000.00 |
  |  2 | Khilan   |  25 | Delhi     |  1500.00 |
  |  3 | kaushik  |  23 | Kota      |  2000.00 |
  |  4 | Chaitali |  25 | Mumbai    |  6500.00 |
  |  5 | Hardik   |  27 | Bhopal    |  8500.00 |
  |  6 | Komal    |  22 | MP        |  4500.00 |
  |  7 | Muffy    |  24 | Indore    | 10000.00 |
  +----+----------+-----+-----------+----------+
  ```

  现在，让我们试一下在 SELECT 语句中进行子查询：

  ```sql
  SQL> SELECT * 
       FROM CUSTOMERS 
       WHERE ID IN (SELECT ID 
                    FROM CUSTOMERS 
                    WHERE SALARY > 4500) ;
  ```

  执行结果如下所示：

```
+----+----------+-----+---------+----------+
| ID | NAME     | AGE | ADDRESS | SALARY   |
+----+----------+-----+---------+----------+
|  4 | Chaitali |  25 | Mumbai  |  6500.00 |
|  5 | Hardik   |  27 | Bhopal  |  8500.00 |
|  7 | Muffy    |  24 | Indore  | 10000.00 |
+----+----------+-----+---------+----------+
```

***

- **INSERT 语句中的子查询：**

  - 子查询还可以用在 INSERT 语句中。INSERT 语句可以将子查询返回的数据插入到其他表中。子查询中选取的数据可以被任何字符、日期或者数值函数所修饰。

  其基本语法如下所示：

  ```
  INSERT INTO table_name [ (column1 [, column2 ]) ]
             SELECT [ *|column1 [, column2 ]
             FROM table1 [, table2 ]
             [ WHERE VALUE OPERATOR ]
  ```

  考虑与 CUSTOMERS 表拥有相似结构的 CUSTOMERS_BKP 表。现在要将 CUSTOMER 表中所有的数据复制到 CUSTOMERS_BKP 表中，代码如下：

```
SQL> INSERT INTO CUSTOMERS_BKP
     SELECT * FROM CUSTOMERS 
     WHERE ID IN (SELECT ID 
                  FROM CUSTOMERS) ;
```

***

- **UPDATE 语句中的子查询：** 

  - 子查询可以用在 UPDATE 语句中。当子查询同 UPDATE 一起使用的时候，既可以更新单个列，也可更新多个列。

  基本语法如下：

  ```
  UPDATE table
  SET column_name = new_value
  [ WHERE OPERATOR [ VALUE ]
     (SELECT COLUMN_NAME
     FROM TABLE_NAME)
     [ WHERE) ]
  ```

- 假设我们有一份 CUSTOMERS_BKP 表作为 CUSTOMERS 表的备份。

  下面的示例将 CUSTOMERS 表中所有 AGE 大于或者等于 27 的客户的 SALARY 字段都变为了原来的 0.25 倍：

  ```
  SQL> UPDATE CUSTOMERS
       SET SALARY = SALARY * 0.25
       WHERE AGE IN (SELECT AGE FROM CUSTOMERS_BKP
                     WHERE AGE >= 27 );
  ```

  　这将影响两行数据，随后 CUSTOMERS 表中的记录将如下所示：

  ```
  +----+----------+-----+-----------+----------+
  | ID | NAME     | AGE | ADDRESS   | SALARY   |
  +----+----------+-----+-----------+----------+
  |  1 | Ramesh   |  35 | Ahmedabad |   125.00 |
  |  2 | Khilan   |  25 | Delhi     |  1500.00 |
  |  3 | kaushik  |  23 | Kota      |  2000.00 |
  |  4 | Chaitali |  25 | Mumbai    |  6500.00 |
  |  5 | Hardik   |  27 | Bhopal    |  2125.00 |
  |  6 | Komal    |  22 | MP        |  4500.00 |
  |  7 | Muffy    |  24 | Indore    | 10000.00 |
  +----+----------+-----+-----------+----------+
  ```

***

- **DELETE 语句中的子查询：**

  　如同前面提到的其他语句一样，子查询还可以同 DELETE 语句一起使用。

    　其基本语法如下所示：

  ```
  DELETE FROM TABLE_NAME
  [ WHERE OPERATOR [ VALUE ]
     (SELECT COLUMN_NAME
     FROM TABLE_NAME)
     [ WHERE) ]
  ```

- 假设我们有一份 CUSTOMERS_BKP 表作为 CUSTOMERS 表的备份。
  
  - 下面的示例将从 CUSTOMERS 表中删除所有 AGE 大于或者等于 27 的记录：

```
SQL> DELETE FROM CUSTOMERS
     WHERE AGE IN (SELECT AGE FROM CUSTOMERS_BKP
                   WHERE AGE > 27 );
```

　这将影响两行数据，随后 CUSTOMERS 表中的记录将如下所示：

```
+----+----------+-----+---------+----------+
| ID | NAME     | AGE | ADDRESS | SALARY   |
+----+----------+-----+---------+----------+
|  2 | Khilan   |  25 | Delhi   |  1500.00 |
|  3 | kaushik  |  23 | Kota    |  2000.00 |
|  4 | Chaitali |  25 | Mumbai  |  6500.00 |
|  6 | Komal    |  22 | MP      |  4500.00 |
|  7 | Muffy    |  24 | Indore  | 10000.00 |
+----+----------+-----+---------+----------+
```

***

#### 1、4、13**SQL ALTER TABLE 命令**

- SQL **ALTER TABLE** 命令用于**添加、删除或者更改**现有数据表中的列。
- 你还可以用 ALTER TABLE 命令来添加或者删除现有数据表上的约束

- 使用 ALTER TABLE 在现有的数据表中**添加新列**的基本语法如下：

  ```
  ALTER TABLE table_name ADD column_name datatype;
  ```

  　使用 ALTER TABLE 在现有的数据表中**删除列**的基本语法如下：

  ```
  ALTER TABLE table_name DROP COLUMN column_name;
  ```

  　使用 ALTER TABLE 更改现有的数据表中**列的数据类型**的基本语法如下：

  ```
  ALTER TABLE table_name MODIFY COLUMN column_name datatype;
  ```

  　使用 ALTER TABLE 给某列添加 **NOT NULL 约束** 的基本语法如下：

  ```
  ALTER TABLE table_name MODIFY column_name datatype NOT NULL;
  ```

  　使用 ALTER TABLE 给数据表添加 **唯一约束** 的基本语法如下：

  ```
  ALTER TABLE table_name 
  ADD CONSTRAINT MyUniqueConstraint UNIQUE(column1, column2...);
  ```

  　使用 ALTER TABLE 给数据表添加 **CHECK 约束** 的基本语法如下：

  ```
  ALTER TABLE table_name 
  ADD CONSTRAINT MyUniqueConstraint CHECK (CONDITION);
  ```

  　使用 ALTER TABLE 给数据表添加 **主键约束** 的基本语法如下：

  ```
  ALTER TABLE table_name 
  ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (column1, column2...);
  ```

***

#### 1、4、14**SQL TRUNCATE TABLE 命令**

- SQL **TRUNCATE TABLE** 命令用于删除现有数据表中的所有数据。
  
- 你也可以使用 DROP TABLE 命令来删除整个数据表，不过 DROP TABLE 命令不但会删除表中所有数据，还会将整个表结构从数据库中移除
  
- **TRUNCATE TABLE** 的基本语法如下所示：

  ```
  TRUNCATE TABLE  table_name;
  ```

***

#### 1、4、15**SQL 处理重复数据**

- 利用 DISTINCT 关键字来消除重复记录的基本语法如下所示：

  ```
  SELECT DISTINCT column1, column2,.....columnN 
  FROM table_name
  WHERE [condition]
  ```

考虑 CUSTOMERS 表，表中记录如下所示：

```
+----+----------+-----+-----------+----------+
| ID | NAME     | AGE | ADDRESS   | SALARY   |
+----+----------+-----+-----------+----------+
|  1 | Ramesh   |  32 | Ahmedabad |  2000.00 |
|  2 | Khilan   |  25 | Delhi     |  1500.00 |
|  3 | kaushik  |  23 | Kota      |  2000.00 |
|  4 | Chaitali |  25 | Mumbai    |  6500.00 |
|  5 | Hardik   |  27 | Bhopal    |  8500.00 |
|  6 | Komal    |  22 | MP        |  4500.00 |
|  7 | Muffy    |  24 | Indore    | 10000.00 |
+----+----------+-----+-----------+----------+
```

```sql
SQL> SELECT DISTINCT SALARY FROM CUSTOMERS
     ORDER BY SALARY;
```

　上述语句将会产生如下结果，这一再没有任何重复的条目了：

```
+----------+
| SALARY   |
+----------+
|  1500.00 |
|  2000.00 |
|  4500.00 |
|  6500.00 |
|  8500.00 |
| 10000.00 |
+----------+
```

***

#### 1、4、16**SQL 使用视图**

- 视图，一种虚拟的表，允许用户执行以下操作：
  - 以用户或者某些类型的用户感觉自然或者直观的方式来组织数据；
  - 限制对数据的访问，从而使得用户仅能够看到或者修改（某些情况下）他们需要的数据；
  - 从多个表中汇总数据，以产生报表。

- 创建视图

  - **CREATE VIEW** 语句的基本语法如下所示：

    ```
    CREATE VIEW view_name AS
    SELECT column1, column2.....
    FROM table_name
    WHERE [condition];
    ```

> 注释：视图总是显示最新数据！每当用户查询视图时，数据库引擎就使用视图的 SQL 语句重新构建数据

- 考虑 CUSTOMERS 表，表中的记录如下所示：

  ```
  +----+----------+-----+-----------+----------+
  | ID | NAME     | AGE | ADDRESS   | SALARY   |
  +----+----------+-----+-----------+----------+
  |  1 | Ramesh   |  32 | Ahmedabad |  2000.00 |
  |  2 | Khilan   |  25 | Delhi     |  1500.00 |
  |  3 | kaushik  |  23 | Kota      |  2000.00 |
  |  4 | Chaitali |  25 | Mumbai    |  6500.00 |
  |  5 | Hardik   |  27 | Bhopal    |  8500.00 |
  |  6 | Komal    |  22 | MP        |  4500.00 |
  |  7 | Muffy    |  24 | Indore    | 10000.00 |
  +----+----------+-----+-----------+----------+
  ```
  - 下面是由 CUSTOMERS 表创建视图的例子。该视图包含来自 CUSTOMERS 表的顾客的名字（name）和年龄（age）：

    ```
    SQL > CREATE VIEW CUSTOMERS_VIEW AS
    SELECT name, age
    FROM  CUSTOMERS;
    ```

  - 现在，你就可以像查询普通的数据表一样查询 CUSTOMERS_VIEW 了：

    ```
    SQL > SELECT * FROM CUSTOMERS_VIEW;
    ```

    　上述语句将会产生如下运行结果：

    ```
    +----------+-----+
    | name     | age |
    +----------+-----+
    | Ramesh   |  32 |
    | Khilan   |  25 |
    | kaushik  |  23 |
    | Chaitali |  25 |
    | Hardik   |  27 |
    | Komal    |  22 |
    | Muffy    |  24 |
    +----------+-----+
    ```

- **WITH CHECK OPTION**

　WITH CHECK OPTION 是 CREATE VIEW 语句的一个可选项。

　WITH CHECK OPTION 用于保证所有的 UPDATE 和 INSERT 语句都满足视图定义中的条件。

　如果不能满足这些条件，UPDATE 或 INSERT 就会返回错误。

- ```
  CREATE VIEW CUSTOMERS_VIEW AS
  SELECT name, age
  FROM  CUSTOMERS
  WHERE age IS NOT NULL
  WITH CHECK OPTION;
  ```

  > 这里 WITH CHECK OPTION 使得视图拒绝任何 AGE 字段为 NULL 的条目，因为视图的定义中，AGE 字段不能为空

- **更新视图**

  　在SQL视图上也可以使用修改数据的DML语句，如 INSERT、UPDATE和DELETE。        

    　视图可以在特定的情况下更新：

  - SELECT 子句不能包含 DISTINCT 关键字
  - SELECT 子句不能包含任何汇总函数（summary functions）
  - SELECT 子句不能包含任何集合函数（set functions）
  - SELECT 子句不能包含任何集合运算符（set operators）
  - SELECT 子句不能包含 ORDER BY 子句
  - 视图不能包含连接操作符                   
  - 视图不能包含伪列或表达式               
  - FROM 子句中不能有多个数据表
  - WHERE 子句不能包含子查询（subquery）
  - 查询语句中不能有 GROUP BY 或者 HAVING
  - 计算得出的列不能更新
  - 视图必须包含原始数据表中所有的 NOT NULL 列，从而使 INSERT 查询生效。

  　如果视图满足以上所有的条件，该视图就可以被更新。下面的例子中，Ramesh 的年龄被更新了：

  ```
  SQL > UPDATE CUSTOMERS_VIEW
        SET AGE = 35
        WHERE name='Ramesh';
  ```

  　最终更新的还是原始数据表，只是其结果反应在了视图上。现在查询原始数据表，SELECT 语句将会产生以下结果：

  ```
  +----+----------+-----+-----------+----------+
  | ID | NAME     | AGE | ADDRESS   | SALARY   |
  +----+----------+-----+-----------+----------+
  |  1 | Ramesh   |  35 | Ahmedabad |  2000.00 |
  |  2 | Khilan   |  25 | Delhi     |  1500.00 |
  |  3 | kaushik  |  23 | Kota      |  2000.00 |
  |  4 | Chaitali |  25 | Mumbai    |  6500.00 |
  |  5 | Hardik   |  27 | Bhopal    |  8500.00 |
  |  6 | Komal    |  22 | MP        |  4500.00 |
  |  7 | Muffy    |  24 | Indore    | 10000.00 |
  +----+----------+-----+-----------+----------+
  ```

- **删除视图**

  - 很明显，当我们不再需要某个视图的时候，需要有一种方式可以让我们将其删除。删除视图的语法非常简单，如下所示：

  ```
  DROP VIEW view_name;
  ```

***

#### 1、4、17**SQL 注入**

- 

***

### 1、5SQL函数

#### 1、5、1

