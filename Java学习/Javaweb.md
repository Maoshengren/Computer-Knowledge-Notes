# Javaweb

### Servlet生命周期

1. **加载Servlet**。当Tomcat第一次访问Servlet的时候，**Tomcat会负责创建Servlet的实例**
2. **初始化**。当Servlet被实例化后，Tomcat会**调用init()方法初始化这个对象**
3. **处理服务**。当浏览器**访问Servlet**的时候，Servlet **会调用service()方法处理请求**
4. **销毁**。当Tomcat关闭时或者检测到Servlet要从Tomcat删除的时候会自动调用destroy()方法，**让该实例释放掉所占的资源**。一个Servlet如果长时间不被使用的话，也会被Tomcat自动销毁
5. **卸载**。当Servlet调用完destroy()方法后，等待垃圾回收。如果**有需要再次使用这个Servlet，会重新调用init()方法进行初始化操作**。

- 简单总结：**只要访问Servlet，service()就会被调用。init()只有第一次访问Servlet的时候才会被调用。 destroy()只有在Tomcat关闭的时候才会被调用。**

***

**GET和POST区别**

**GET**

“读取“一个资源。比如Get到一个html文件。

**POST**

在页面里`<form> `标签会定义一个表单。点击其中的submit元素会发出一个POST请求让服务器做一件事。这件事往往是有副作用的，不幂等的。









































































***

### JDBC

**简单操作JDBC**

步骤:

1. 导入MySQL或者Oracle驱动包
2. 装载数据库驱动程序
3. 获取到与数据库连接
4. 获取可以执行SQL语句的对象
5. 执行SQL语句
6. 关闭连接

```java
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try {

    /*
    * 加载驱动有两种方式
    *
    * 1：会导致驱动会注册两次，过度依赖于mysql的api，脱离的mysql的开发包，程序则无法编译
    * 2：驱动只会加载一次，不需要依赖具体的驱动，灵活性高
    *
    * 我们一般都是使用第二种方式
    * */

    //1.
    //DriverManager.registerDriver(new com.mysql.jdbc.Driver());

    //2.
    Class.forName("com.mysql.jdbc.Driver");

    //获取与数据库连接的对象-Connetcion
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/zhongfucheng", "root", "root");

    //获取执行sql语句的statement对象
    statement = connection.createStatement();

    //执行sql语句,拿到结果集
    resultSet = statement.executeQuery("SELECT * FROM users");

    //遍历结果集，得到数据
    while (resultSet.next()) {

        System.out.println(resultSet.getString(1));

        System.out.println(resultSet.getString(2));
    }

} catch (SQLException e) {
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} finally {

    /*
    * 关闭资源，后调用的先关闭
    *
    * 关闭之前，要判断对象是否存在
    * */

    if (resultSet != null) {
        try {
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    if (statement != null) {
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    if (connection != null) {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
```

**Connection对象**

**客户端与数据库所有的交互都是通过Connection来完成的。**

常用的方法：

```java
//创建向数据库发送sql的statement对象
createcreateStatement()

//创建向数据库发送预编译sql的PrepareSatement对象。
prepareStatement(sql) 

//创建执行存储过程的callableStatement对象
prepareCall(sql)

//设置事务自动提交
setAutoCommit(boolean autoCommit)

//提交事务
commit()

//回滚事务
rollback()
```

**Statement对象**

**Statement对象用于向数据库发送Sql语句**，对数据库的增删改查都可以通过此对象发送sql语句完成。

Statement对象的常用方法：

```java
//查询
executeQuery(String sql)

//增删改
executeUpdate(String sql)

//任意sql语句都可以，但是目标不明确，很少用
execute(String sql)

//把多条的sql语句放进同一个批处理中
addBatch(String sql)

//向数据库发送一批sql语句执行
executeBatch()
```

**ResultSet对象**

**ResultSet对象代表Sql语句的执行结果**，当Statement对象执行executeQuery()时，会返回一个ResultSet对象

ResultSet对象维护了一个数据行的游标【简单理解成指针】，调用**ResultSet.next()**方法，可以让游标指向具体的数据行，进行获取该行的数据

常用方法：

```java
//获取任意类型的数据
getObject(String columnName)

//获取指定类型的数据【各种类型，查看API】
getString(String columnName)

//对结果集进行滚动查看的方法
next()

Previous()

absolute(int row)

beforeFirst()

afterLast()
```

***

**PreparedStatement对象**

**PreparedStatement对象继承Statement对象，它比Statement对象更强大，使用起来更简单**

- Statement对象编译SQL语句时，如果SQL语句有变量，就需要使用分隔符来隔开，如果变量非常多，就会使SQL变得非常复杂。**PreparedStatement可以使用占位符，简化sql的编写**

- Statement会频繁编译SQL。**PreparedStatement可对SQL进行预编译，提高效率，预编译的SQL存储在PreparedStatement对象中**

- **PreparedStatement防止SQL注入**。【Statement通过分隔符'++',编写永等式，可以不需要密码就进入数据库】

```java
String sql = "SELECT * FROM users WHERE id = ?";
PreparedStatement preparedStatement = connection.preparedStatement(sql);

//第一个参数表示第几个占位符【也就是?号】，第二个参数表示值是多少
preparedStatement.setString(1,id);
```

**批处理**

当需要向数据库发送一批SQL语句执行时，应避免向数据库一条条发送执行，**采用批处理以提升执行效率**

批处理有两种方式：

1. Statement
2. PreparedStatement

**通过executeBath()方法批量处理执行SQL语句，返回一个int[]数组，该数组代表各句SQL的返回值**

以下代码是以Statement方式实现批处理

```java
/*
* Statement执行批处理
*
* 优点：
*       可以向数据库发送不同的SQL语句
* 缺点：
*       SQL没有预编译
*       仅参数不同的SQL，需要重复写多条SQL
* */
Connection connection = UtilsDemo.getConnection();

Statement statement = connection.createStatement();
String sql1 = "UPDATE users SET name='zhongfucheng' WHERE id='3'";
String sql2 = "INSERT INTO users (id, name, password, email, birthday)" +
        " VALUES('5','nihao','123','ss@qq.com','1995-12-1')";

//将sql添加到批处理
statement.addBatch(sql1);
statement.addBatch(sql2);

//执行批处理
statement.executeBatch();

//清空批处理的sql
statement.clearBatch();

UtilsDemo.release(connection, statement, null);
```

以下方式以PreparedStatement方式实现批处理

```java
/*
* PreparedStatement批处理
*   优点：
*       SQL语句预编译了
*       对于同一种类型的SQL语句，不用编写很多条
*   缺点：
*       不能发送不同类型的SQL语句
*
* */
Connection connection = UtilsDemo.getConnection();

String sql = "INSERT INTO test(id,name) VALUES (?,?)";
PreparedStatement preparedStatement = connection.prepareStatement(sql);

for (int i = 1; i <= 205; i++) {
    preparedStatement.setInt(1, i);
    preparedStatement.setString(2, (i + "zhongfucheng"));

    //添加到批处理中
    preparedStatement.addBatch();

    if (i %2 ==100) {

        //执行批处理
        preparedStatement.executeBatch();

        //清空批处理【如果数据量太大，所有数据存入批处理，内存肯定溢出】
        preparedStatement.clearBatch();
    }

}
//不是所有的%2==100，剩下的再执行一次批处理
preparedStatement.executeBatch();

//再清空
preparedStatement.clearBatch();

UtilsDemo.release(connection, preparedStatement, null);
```

***

**处理大文本和二进制数据**

**clob和blob**

- clob用于存储大文本
- blob用于存储二进制数据