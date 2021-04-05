## **IoC**

> Simply put, [I](https://www.baeldung.com/inversion-control-and-dependency-injection-in-spring)[nversion of Control](https://www.baeldung.com/inversion-control-and-dependency-injection-in-spring), or IoC for short, is **a process in which an object defines its dependencies without creating them.** This object delegates the job of constructing such dependencies to an IoC container.

Assume we have a class declaration:

```java
public class Company {
    private Address address;

    public Company(Address address) {
        this.address = address;
    }

    // getter, setter and other properties
}
```

This class needs a collaborator of type **`Address`**:

```java
public class Address {
    private String street;
    private int number;

    public Address(String street, int number) {
        this.street = street;
        this.number = number;
    }

    // getters and setters
}
```

Normally, we create objects with their classes' constructors:

```java
Address address = new Address("High Street", 1000);
Company company = new Company(address);
```

- Imagine an application with dozens or even hundreds of classes. Sometimes we want to share a single instance of a class across the whole application, other times we need a separate object for each use case, and so on.

> Instead of constructing dependencies by itself, an object can retrieve its dependencies from an IoC container. **All we need to do is to provide the container with appropriate configuration metadata.** 

IoC（Inverse of Control:控制反转）是一种**设计思想**，就是 **将原本在程序中手动创建对象的控制权，交由Spring框架来管理。**

- It is a process whereby objects define their dependencies (that is, the other objects they work with) only through constructor arguments, arguments to a factory method, or properties that are set on the object instance after it is constructed or returned from a factory method. 

- The **`org.springframework.beans`** and **`org.springframework.context`** packages are the basis for Spring Framework’s IoC container. 
  - The **[`BeanFactory`](https://docs.spring.io/spring-framework/docs/5.3.5/javadoc-api/org/springframework/beans/factory/BeanFactory.html)** interface provides an advanced configuration mechanism capable of managing any type of object. **[`ApplicationContext`](https://docs.spring.io/spring-framework/docs/5.3.5/javadoc-api/org/springframework/context/ApplicationContext.html)** is a sub-interface of **`BeanFactory`**. It adds:
    - Easier integration with Spring’s AOP features
    - Message resource handling (for use in internationalization)
    - Event publication
    - Application-layer specific contexts such as the `WebApplicationContext` for use in web applications.
- In short, the **`BeanFactory`** provides the configuration framework and basic functionality, and the **`ApplicationContext`** adds more enterprise-specific functionality. 
- The **`ApplicationContext`** is a complete superset of the **`BeanFactory`**

### 1.2 Container Overview

> The **`org.springframework.context.ApplicationContext`** interface represents the Spring IoC container and is responsible for instantiating, configuring, and assembling the beans.

- The container gets its instructions on what objects to instantiate, configure, and assemble by reading configuration metadata. 
  - The configuration metadata is represented in XML, Java annotations, or Java code.

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210320210346093.png" alt="image-20210320210346093" style="zoom:50%;" />

**Configuration Metadata**

> This configuration metadata represents how you, as an application developer, tell the Spring container to instantiate, configure, and assemble the objects in your application.

- Configuration metadata is traditionally supplied in a **simple and intuitive XML format**, which is what most of this chapter uses to convey key concepts and features of the Spring IoC container.

- Spring configuration consists of at least one and typically more than one bean definition that the container must manage. 
  - XML-based configuration metadata configures these beans as **`<bean/>`** elements inside a top-level **`<beans/>`** element. 
  - Java configuration typically uses **`@Bean`**-annotated methods within a **`@Configuration`** class.

The following example shows the basic structure of XML-based configuration metadata:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="..." class="...">  
        <!-- collaborators and configuration for this bean go here -->
    </bean>

    <bean id="..." class="...">
        <!-- collaborators and configuration for this bean go here -->
    </bean>

    <!-- more bean definitions go here -->

</beans>
```

- The **`id`** attribute is a string that **identifies** the individual bean definition.
- The **`class`** attribute defines the type of the bean and uses the **fully qualified classname**

***

**Using AspectJ to Dependency Inject Domain Objects with Spring**

> **`spring-aspects.jar`** contains an annotation-driven aspect that exploits this capability to allow dependency injection of any object. 
>
> The support is intended to be used for objects created outside of the control of any container. Domain objects often fall into this category because they are often created programmatically with the **`new`** operator or by an ORM tool as a result of a database query.

- The **`@Configurable`** annotation marks a class as being eligible for Spring-driven configuration. In the simplest case, you can use purely it as a marker annotation.
  - You can also use autowiring to avoid having to specify a dedicated bean definition at all. To have Spring apply autowiring, use the **`autowire`** property of the `@Configurable` annotation. 
  - You can specify either **`@Configurable(autowire=Autowire.BY_TYPE)`** 
  - or **`@Configurable(autowire=Autowire.BY_NAME)`** for autowiring by type or by name.

****

**Instantiating a Container**

> The location path or paths supplied to an **`ApplicationContext`** constructor are resource strings that let the container load configuration metadata from a variety of external resources, such as the local file system, the Java `CLASSPATH`, and so on.

```
ApplicationContext context = new ClassPathXmlApplicationContext("services.xml", "daos.xml");
```

The following example shows the service layer objects **`(services.xml)`** configuration file:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd">

    <!-- services -->

    <bean id="petStore" class="org.springframework.samples.jpetstore.services.PetStoreServiceImpl">
        <property name="accountDao" ref="accountDao"/>
        <property name="itemDao" ref="itemDao"/>
        <!-- additional collaborators and configuration for this bean go here -->
    </bean>

    <!-- more bean definitions for services go here -->

</beans>
```

The following example shows the data access objects **`daos.xml`** file:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="accountDao"
        class="org.springframework.samples.jpetstore.dao.jpa.JpaAccountDao">
        <!-- additional collaborators and configuration for this bean go here -->
    </bean>

    <bean id="itemDao" class="org.springframework.samples.jpetstore.dao.jpa.JpaItemDao">
        <!-- additional collaborators and configuration for this bean go here -->
    </bean>

    <!-- more bean definitions for data access objects go here -->

</beans>
```

- The **`property name`** element refers to the name of the JavaBean property, and the **`ref`** element refers to the name of another bean definition. This linkage between **`id`** and **`ref`** elements expresses the dependency between collaborating objects.

**Composing XML-based Configuration Metadata**

> It can be useful to have bean definitions span multiple XML files. Often, each individual XML configuration file represents a logical layer or module in your architecture.

- You can use the application context constructor to load bean definitions from all these XML fragments. This constructor takes multiple `Resource` locations.
- Alternatively, use one or more occurrences of the **`<import/>`** element to load bean definitions from another file or files.

```xml
<beans>
    <import resource="services.xml"/>
    <import resource="resources/messageSource.xml"/>
    <import resource="/resources/themeSource.xml"/>

    <bean id="bean1" class="..."/>
    <bean id="bean2" class="..."/>
</beans>
```

***

**The Groovy Bean Definition DSL**

As a further example for externalized configuration metadata, bean definitions can also be expressed in Spring’s Groovy Bean Definition DSL, as known from the Grails framework. Typically, such configuration live in a ".groovy" file with the structure shown in the following example:

```groovy
beans {
    dataSource(BasicDataSource) {
        driverClassName = "org.hsqldb.jdbcDriver"
        url = "jdbc:hsqldb:mem:grailsDB"
        username = "sa"
        password = ""
        settings = [mynew:"setting"]
    }
    sessionFactory(SessionFactory) {
        dataSource = dataSource
    }
    myService(MyService) {
        nestedBean = { AnotherBean bean ->
            dataSource = dataSource
        }
    }
}
```

***

**Using the Container**

> The **`ApplicationContext`** is the interface for an advanced factory capable of maintaining a registry of different beans and their dependencies. 
>
> By using the method **`T getBean(String name, Class<T> requiredType)`**, you can retrieve instances of your beans.

The `ApplicationContext` lets you read bean definitions and access them, as the following example shows:

```java
// create and configure beans
ApplicationContext context = new ClassPathXmlApplicationContext("services.xml", "daos.xml");

// retrieve configured instance
PetStoreService service = context.getBean("petStore", PetStoreService.class);

// use configured instance
List<String> userList = service.getUsernameList();
```

***

### 1.3 Bean Overview

![Spring Bean 生命周期](http://my-blog-to-use.oss-cn-beijing.aliyuncs.com/18-9-17/48376272.jpg)

> A Spring IoC container manages one or more beans. These beans are created with the configuration metadata that you supply to the container. 

Within the container itself, these bean definitions are represented as **`BeanDefinition`** objects, which contain (among other information) the following metadata:

- **A package-qualified class name**: typically, the actual implementation class of the bean being defined.
- **Bean behavioral configuration elements**, which state how the bean should behave in the container (scope, lifecycle callbacks, and so forth).
- **References to other beans** that are needed for the bean to do its work. These references are also called collaborators or dependencies.
- Other configuration settings to set in the newly created object — for example, the size limit of the pool or the number of connections to use in a bean that manages a connection pool.

| Property                 | Explained in…                                                |
| :----------------------- | :----------------------------------------------------------- |
| Class                    | [Instantiating Beans](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-class) |
| Name                     | [Naming Beans](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-beanname) |
| Scope                    | [Bean Scopes](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-scopes) |
| Constructor arguments    | [Dependency Injection](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-collaborators) |
| Properties               | [Dependency Injection](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-collaborators) |
| Autowiring mode          | [Autowiring Collaborators](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-autowire) |
| Lazy initialization mode | [Lazy-initialized Beans](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-lazy-init) |
| Initialization method    | [Initialization Callbacks](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-lifecycle-initializingbean) |
| Destruction method       | [Destruction Callbacks](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-lifecycle-disposablebean) |

**Naming Beans**

> Every bean has one or more identifiers. These identifiers must be unique within the container that hosts the bean. 
>
> A bean usually has only one identifier. However, if it requires more than one, the extra ones can be considered aliases.

**Instantiating Beans**

> A bean definition is essentially a recipe for creating one or more objects. 
>
> The container looks at the recipe for a named bean when asked and uses the configuration metadata encapsulated by that bean definition to create (or acquire) an actual object.

- If you use XML-based configuration metadata, you specify the type (or class) of object that is to be instantiated in the `class` attribute of the `<bean/>` element. 
  - This `class` attribute (which, internally, is a `Class` property on a `BeanDefinition` instance) is usually mandatory. 
- You can use the `Class` property in one of two ways:
  - Typically, to specify the bean class 	to be constructed in the case where the container itself directly creates the bean by calling its constructor reflectively, somewhat equivalent to Java code with the **`new`** operator.
  - To specify the actual class containing the `static` factory method that is invoked to create the object, in the less common case where the container invokes a `static` factory method on a class to create the bean. The object type returned from the invocation of the `static` factory method may be the same class or another class entirely.

***

### 1.4 Dependencies

> A typical enterprise application does not consist of a single object (or bean in the Spring parlance). Even the simplest application has a few objects that work together to present what the end-user sees as a coherent application. 

**Dependency Injection**

> Dependency injection (DI) is a process whereby objects **define their dependencies** (that is, the other objects with which they work) only through **`constructor arguments`**, arguments to a **`factory method`,** or **`properties`** that are set on the object instance after it is constructed or returned from a factory method. 

#### **Constructor-based Dependency Injection**

> Constructor-based DI is accomplished by the container invoking a constructor with a number of arguments, each representing a dependency. Calling a `static` factory method with specific arguments to construct the bean is nearly equivalent.

```java
public class SimpleMovieLister {

    // the SimpleMovieLister has a dependency on a MovieFinder
    private MovieFinder movieFinder;

    // a constructor so that the Spring container can inject a MovieFinder
    public SimpleMovieLister(MovieFinder movieFinder) {
        this.movieFinder = movieFinder;
    }

    // business logic that actually uses the injected MovieFinder is omitted...
}
```

**Constructor Argument Resolution**

> Constructor argument resolution matching occurs by using the argument’s type. 
>
> If no potential ambiguity exists in the constructor arguments of a bean definition, the order in which the constructor arguments are defined in a bean definition is the order in which those arguments are supplied to the appropriate constructor when the bean is being instantiated. 

Constructor argument type matching

In the preceding scenario, the container can use type matching with simple types if you explicitly specify the type of the constructor argument by using the `type` attribute. as the following example shows:

```xml
<bean id="exampleBean" class="examples.ExampleBean">
    <constructor-arg type="int" value="7500000"/>
    <constructor-arg type="java.lang.String" value="42"/>
</bean>
```

**Constructor argument index**

You can use the `index` attribute to specify explicitly the index of constructor arguments, as the following example shows:

```xml
<bean id="exampleBean" class="examples.ExampleBean">
    <constructor-arg index="0" value="7500000"/>
    <constructor-arg index="1" value="42"/>
</bean>
```

**Constructor argument name**

You can also use the constructor parameter name for value disambiguation, as the following example shows:

```xml
<bean id="exampleBean" class="examples.ExampleBean">
    <constructor-arg name="years" value="7500000"/>
    <constructor-arg name="ultimateAnswer" value="42"/>
</bean>
```

***

**Examples of Dependency Injection**

> The following example uses XML-based configuration metadata for setter-based DI. 
>
> A small part of a Spring XML configuration file specifies some bean definitions as follows:

```xml
<bean id="exampleBean" class="examples.ExampleBean">
    <!-- setter injection using the nested ref element -->
    <property name="beanOne">
        <ref bean="anotherExampleBean"/>
    </property>

    <!-- setter injection using the neater ref attribute -->
    <property name="beanTwo" ref="yetAnotherBean"/>
    <property name="integerProperty" value="1"/>
</bean>

<bean id="anotherExampleBean" class="examples.AnotherBean"/>
<bean id="yetAnotherBean" class="examples.YetAnotherBean"/>
```

The following example shows the corresponding **`ExampleBean`** class:

```java
public class ExampleBean {

    private AnotherBean beanOne;

    private YetAnotherBean beanTwo;

    private int i;

    public void setBeanOne(AnotherBean beanOne) {
        this.beanOne = beanOne;
    }

    public void setBeanTwo(YetAnotherBean beanTwo) {
        this.beanTwo = beanTwo;
    }

    public void setIntegerProperty(int i) {
        this.i = i;
    }
}
```

> In the preceding example, **setters** are declared to match against the properties specified in the XML file. The following example uses **constructor-based** DI:

```xml
<bean id="exampleBean" class="examples.ExampleBean">
    <!-- constructor injection using the nested ref element -->
    <constructor-arg>
        <ref bean="anotherExampleBean"/>
    </constructor-arg>

    <!-- constructor injection using the neater ref attribute -->
    <constructor-arg ref="yetAnotherBean"/>

    <constructor-arg type="int" value="1"/>
</bean>

<bean id="anotherExampleBean" class="examples.AnotherBean"/>
<bean id="yetAnotherBean" class="examples.YetAnotherBean"/>
```

The following example shows the corresponding `ExampleBean` class:

```java
public class ExampleBean {

    private AnotherBean beanOne;

    private YetAnotherBean beanTwo;

    private int i;

    public ExampleBean(
        AnotherBean anotherBean, YetAnotherBean yetAnotherBean, int i) {
        this.beanOne = anotherBean;
        this.beanTwo = yetAnotherBean;
        this.i = i;
    }
}
```

***

**Dependencies and Configuration in Detail**

**Straight Values (Primitives, Strings, and so on)**

The `value` attribute of the `<property/>` element specifies a property or constructor argument as a human-readable string representation. Spring’s [conversion service](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#core-convert-ConversionService-API) is used to convert these values from a `String` to the actual type of the property or argument. The following example shows various values being set:

```xml
<bean id="myDataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close">
    <!-- results in a setDriverClassName(String) call -->
    <property name="driverClassName" value="com.mysql.jdbc.Driver"/>
    <property name="url" value="jdbc:mysql://localhost:3306/mydb"/>
    <property name="username" value="root"/>
    <property name="password" value="misterkaoli"/>
</bean>
```

The following example uses the [p-namespace](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-p-namespace) for even more succinct XML configuration:

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:p="http://www.springframework.org/schema/p"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
    https://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="myDataSource" class="org.apache.commons.dbcp.BasicDataSource"
        destroy-method="close"
        p:driverClassName="com.mysql.jdbc.Driver"
        p:url="jdbc:mysql://localhost:3306/mydb"
        p:username="root"
        p:password="misterkaoli"/>

</beans>
```

***

**Method Injection**

> A problem arises when the bean lifecycles are different. Suppose singleton bean A needs to use non-singleton (prototype) bean B, perhaps on each method invocation on A.
>
> The container creates the singleton bean A only once, and thus only gets one opportunity to set the properties. The container cannot provide bean A with a new instance of bean B every time one is needed.



***

### 1.5. Bean Scopes

> When you create a bean definition, you create a recipe for creating actual instances of the class defined by that bean definition. The idea that a bean definition is a recipe is important, because it means that, as with a class, you can create many object instances from a single recipe.

| Scope                                                        | Description                                                  |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [singleton](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-scopes-singleton) | (Default) Scopes a single bean definition to a single object instance for each Spring IoC container. |
| [prototype](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-scopes-prototype) | Scopes a single bean definition to any number of object instances. |
| [request](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-scopes-request) | Scopes a single bean definition to the lifecycle of a single HTTP request. That is, each HTTP request has its own instance of a bean created off the back of a single bean definition. Only valid in the context of a web-aware Spring `ApplicationContext`. |
| [session](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-scopes-session) | Scopes a single bean definition to the lifecycle of an HTTP `Session`. Only valid in the context of a web-aware Spring `ApplicationContext`. |
| [application](https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-factory-scopes-application) | Scopes a single bean definition to the lifecycle of a `ServletContext`. Only valid in the context of a web-aware Spring `ApplicationContext`. |
| [websocket](https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#websocket-stomp-websocket-scope) | Scopes a single bean definition to the lifecycle of a `WebSocket`. Only valid in the context of a web-aware Spring `ApplicationContext`. |

### 1.6自动装配

spring的bean配置：

- xml中显示配置
- java中配置
- 隐式自动装配

也就是用 `autowired` 自动将该对象装配到IOC容器

`ByName`自动装配：

- 人有两个宠物：狗和猫
  - 在xml中注册的时候，在人的bean中设置 `autowired = ByName` ，就会自动把狗和猫的依赖注入

```xml
<bean id="cat" class="com.example.demo.cat"/>
<bean id="dog" class="com.example.demo.dog"/>

<!--之前如何装配给人 -->
<bean id="people" class="com.example.demo">
	<property name="cat" ref="cat"/>
	<property name="dog" ref="dog"/>
</bean>

<!--必须保证名字对应 -->
<bean id="people" class="com.example.demo.people" autowired="Byname"/>

<!--必须保证type是唯一的 -->
<bean id="people" class="com.example.demo.people" autowired="ByType"/>
```

***

**使用`@Autowired`**

- 需将下面 的配置放入xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:context="http://www.springframework.org/schema/context"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context
        https://www.springframework.org/schema/context/spring-context.xsd">

    <component-scan
    <context:annotation-config/>

</beans>
```

现在再来配置xml

```xml
<bean id="cat" class="com.example.demo.cat"/>
<bean id="dog" class="com.example.demo.dog"/>
<bean id="people" class="com.example.demo.people">
```

可以直接在属性上使用

```java
public class people{
    @Autowired
    private Cat cat;
    
    @Autowired
    private Dog dog;
}
```

`@Autowired`自动为 `Byname`方式，如果匹配不上则用 `ByType`

`@Qualifier(value="")`为都匹配不上时，用这个指定id

***

`@Resource`实现了相同的功能

***

### 1.7注解开发

```java
@Component 
//等价于 <bean id=" " class=" "/>
//id默认为类名的小写
@Scope("single")
//确定作用域
public class people{
    
    @Value("自动注入值给name")
    //等价于 <property name=" " value=" "/>
	public String name; 	
}
```

由于MVC三层分层，所以

- dao层：`@Repository`
- service层：`@Service`
- controller层：`@Controller`

***

### 1.8 JavaConfig

```java
@Configuration
//相当于bean.xml
@ComponentScan("com.example")
//自动扫描包
@Import(AnotherClass.class)
//引入其他类
public class name{
    
    @Bean
    //注册一个bean，相当于bean标签，id=方法名，class=方法的返回值
    public User GetUser(){
        return new User(); //返回要注入到bean的对象
    }
	
}

//如果使用了注解，那么将使用AnnotationConfigApplicationContext来获得工厂

```



























































***

## **AOP**

> AOP(Aspect-Oriented Programming:面向切面编程)能够将那些与业务无关，**却为业务模块所共同调用的逻辑或责任（例如事务处理、日志管理、权限控制等）封装起来**，便于**减少系统的重复代码**，**降低模块间的耦合度**，并**有利于未来的可拓展性和可维护性**。

**Spring AOP就是基于动态代理的**，如果要代理的对象，实现了某个接口，那么Spring AOP会使用**JDK Proxy**，去创建代理对象，而对于没有实现接口的对象，就无法使用 JDK Proxy 去进行代理了，这时候Spring AOP会使用**Cglib** ，这时候Spring AOP会使用 **Cglib** 生成一个被代理对象的子类来作为代理

![SpringAOPProcess](https://my-blog-to-use.oss-cn-beijing.aliyuncs.com/2019-6/SpringAOPProcess.jpg)

> The key unit of modularity in OOP is the class, whereas in AOP the unit of modularity is the **aspect**. 
>
> Aspects enable the modularization of concerns (such as transaction management) that **cut across multiple types and objects**. 

### 5.1. AOP Concepts

> Let us begin by defining some central AOP concepts and terminology. 

- **Aspect**: A modularization of a concern that cuts across multiple classes. Transaction management is a good example of a crosscutting concern in enterprise Java applications. In Spring AOP, aspects are implemented by using regular classes or regular classes annotated with the **`@Aspect`** annotation

- **Join point**: A point during the execution of a program, such as the execution of a method or the handling of an exception. In Spring AOP, a join point always represents a method execution.

- **Advice**: Action taken by an aspect at a particular join point. Different types of advice include “around”, “before” and “after” advice.
- **Pointcut**: A predicate that matches join points. Advice is associated with a pointcut expression and runs at any join point matched by the pointcut (for example, the execution of a method with a certain name). 



















***

- #### **spring bean**

Spring Bean是被实例的，组装的及被Spring 容器管理的Java对象。

Spring 容器会自动完成@bean对象的实例化。

创建应用对象之间的协作关系的行为称为：**装配(wiring)**，这就是依赖注入的本质。

**自动化装配bean**

- 组件扫描(component scanning):Spring 会自动发现应用上下文中所创建的bean。
- 自动装配(autowiring):Spring自动满足bean之间的依赖。

































***

### IOC源码分析

<img src="https://www.javadoop.com/blogimages/spring-context/1.png" alt="1" style="zoom:50%;" />

我们先来一个简单的例子来看看怎么实例化 ApplicationContext。

首先，定义一个接口：

```java
public interface MessageService {
    String getMessage();
}
```

定义接口实现类：

```java
public class MessageServiceImpl implements MessageService {

    public String getMessage() {
        return "hello world";
    }
}
```

接下来，我们在 **resources** 目录新建一个配置文件，文件名随意，通常叫 application.xml 或 application-xxx.xml 就可以了：

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<beans xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns="http://www.springframework.org/schema/beans"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd" default-autowire="byName">

    <bean id="messageService" class="com.javadoop.example.MessageServiceImpl"/>
</beans>
```

这样，我们就可以跑起来了：

```java
public class App {
    public static void main(String[] args) {
        // 用我们的配置文件来启动一个 ApplicationContext
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:application.xml");

        System.out.println("context 启动成功");

        // 从 context 中取出我们的 Bean，而不是用 new MessageServiceImpl() 这种方式
        MessageService messageService = context.getBean(MessageService.class);
        // 这句将输出: hello world
        System.out.println(messageService.getMessage());
    }
}
```

<img src="https://www.javadoop.com/blogimages/spring-context/2.png" alt="2" style="zoom:50%;" />

***

#### **启动过程分析**

- 第一步，我们肯定要从 **`ClassPathXmlApplicationContext`** 的构造方法说起。

  ```java
  public class ClassPathXmlApplicationContext extends AbstractXmlApplicationContext {
    private Resource[] configResources;
  
    // 如果已经有 ApplicationContext 并需要配置成父子关系，那么调用这个构造方法
    public ClassPathXmlApplicationContext(ApplicationContext parent) {
        super(parent);
    }
    ...
    public ClassPathXmlApplicationContext(String[] configLocations, boolean refresh, ApplicationContext parent)
        throws BeansException {
  
      super(parent);
      // 根据提供的路径，处理成配置文件数组(以分号、逗号、空格、tab、换行符分割)
      setConfigLocations(configLocations);
      if (refresh) {
        refresh(); // 核心方法
      }
    }
      ...
  }
  ```

接下来，就是 **`refresh()`**，这里简单说下为什么是 `refresh()`，而不是 `init() `这种名字的方法。因为 `ApplicationContext` 建立起来以后，其实我们是可以通过调用` refresh() `这个方法重建的，`refresh() `会将原来的 `ApplicationContext` 销毁，然后再重新执行一次初始化操作。

往下看，`refresh()` 方法里面调用了那么多方法，就知道肯定不简单了，请读者先看个大概，细节之后会详细说。

```java
@Override
public void refresh() throws BeansException, IllegalStateException {
   // 来个锁，不然 refresh() 还没结束，你又来个启动或销毁容器的操作，那不就乱套了嘛
   synchronized (this.startupShutdownMonitor) {

      // 准备工作，记录下容器的启动时间、标记“已启动”状态、处理配置文件中的占位符
      prepareRefresh();

      // 这步比较关键，这步完成后，配置文件就会解析成一个个 Bean 定义，注册到 BeanFactory 中，
      // 当然，这里说的 Bean 还没有初始化，只是配置信息都提取出来了，
      // 注册也只是将这些信息都保存到了注册中心(说到底核心是一个 beanName-> beanDefinition 的 map)
      ConfigurableListableBeanFactory beanFactory = obtainFreshBeanFactory();

      // 设置 BeanFactory 的类加载器，添加几个 BeanPostProcessor，手动注册几个特殊的 bean
      // 这块待会会展开说
      prepareBeanFactory(beanFactory);

      try {
         // 【这里需要知道 BeanFactoryPostProcessor 这个知识点，Bean 如果实现了此接口，
         // 那么在容器初始化以后，Spring 会负责调用里面的 postProcessBeanFactory 方法。】

         // 这里是提供给子类的扩展点，到这里的时候，所有的 Bean 都加载、注册完成了，但是都还没有初始化
         // 具体的子类可以在这步的时候添加一些特殊的 BeanFactoryPostProcessor 的实现类或做点什么事
         postProcessBeanFactory(beanFactory);
         // 调用 BeanFactoryPostProcessor 各个实现类的 postProcessBeanFactory(factory) 方法
         invokeBeanFactoryPostProcessors(beanFactory);

         // 注册 BeanPostProcessor 的实现类，注意看和 BeanFactoryPostProcessor 的区别
         // 此接口两个方法: postProcessBeforeInitialization 和 postProcessAfterInitialization
         // 两个方法分别在 Bean 初始化之前和初始化之后得到执行。注意，到这里 Bean 还没初始化
         registerBeanPostProcessors(beanFactory);

         // 初始化当前 ApplicationContext 的 MessageSource，国际化这里就不展开说了，不然没完没了了
         initMessageSource();

         // 初始化当前 ApplicationContext 的事件广播器，这里也不展开了
         initApplicationEventMulticaster();

         // 从方法名就可以知道，典型的模板方法(钩子方法)，
         // 具体的子类可以在这里初始化一些特殊的 Bean（在初始化 singleton beans 之前）
         onRefresh();

         // 注册事件监听器，监听器需要实现 ApplicationListener 接口。这也不是我们的重点，过
         registerListeners();

         // 重点，重点，重点
         // 初始化所有的 singleton beans
         //（lazy-init 的除外）
         finishBeanFactoryInitialization(beanFactory);

         // 最后，广播事件，ApplicationContext 初始化完成
         finishRefresh();
      }

      catch (BeansException ex) {
         if (logger.isWarnEnabled()) {
            logger.warn("Exception encountered during context initialization - " +
                  "cancelling refresh attempt: " + ex);
         }

         // Destroy already created singletons to avoid dangling resources.
         // 销毁已经初始化的 singleton 的 Beans，以免有些 bean 会一直占用资源
         destroyBeans();

         // Reset 'active' flag.
         cancelRefresh(ex);

         // 把异常往外抛
         throw ex;
      }

      finally {
         // Reset common introspection caches in Spring's core, since we
         // might not ever need metadata for singleton beans anymore...
         resetCommonCaches();
      }
   }
}
```

**创建 Bean 容器前的准备工作**

这个比较简单，直接看代码中的几个注释即可。

```java
protected void prepareRefresh() {
   // 记录启动时间，
   // 将 active 属性设置为 true，closed 属性设置为 false，它们都是 AtomicBoolean 类型
   this.startupDate = System.currentTimeMillis();
   this.closed.set(false);
   this.active.set(true);

   if (logger.isInfoEnabled()) {
      logger.info("Refreshing " + this);
   }

   // Initialize any placeholder property sources in the context environment
   initPropertySources();

   // 校验 xml 配置文件
   getEnvironment().validateRequiredProperties();

   this.earlyApplicationEvents = new LinkedHashSet<ApplicationEvent>();
}
```

#### **创建 Bean 容器，加载并注册 Bean**

我们回到 `refresh()` 方法中的下一行 `obtainFreshBeanFactory()`。

注意，**这个方法是全文最重要的部分之一**，这里将会初始化 BeanFactory、加载 Bean、注册 Bean 等等。

当然，这步结束后，Bean 并没有完成初始化。这里指的是 Bean 实例并未在这一步生成。

```java
protected ConfigurableListableBeanFactory obtainFreshBeanFactory() {
   // 关闭旧的 BeanFactory (如果有)，创建新的 BeanFactory，加载 Bean 定义、注册 Bean 等等
   refreshBeanFactory();

   // 返回刚刚创建的 BeanFactory
   ConfigurableListableBeanFactory beanFactory = getBeanFactory();
   if (logger.isDebugEnabled()) {
      logger.debug("Bean factory for " + getDisplayName() + ": " + beanFactory);
   }
   return beanFactory;
}
```

```java
@Override
protected final void refreshBeanFactory() throws BeansException {
   // 如果 ApplicationContext 中已经加载过 BeanFactory 了，销毁所有 Bean，关闭 BeanFactory
   // 注意，应用中 BeanFactory 本来就是可以多个的，这里可不是说应用全局是否有 BeanFactory，而是当前
   // ApplicationContext 是否有 BeanFactory
   if (hasBeanFactory()) {
      destroyBeans();
      closeBeanFactory();
   }
   try {
      // 初始化一个 DefaultListableBeanFactory，为什么用这个，我们马上说。
      DefaultListableBeanFactory beanFactory = createBeanFactory();
      // 用于 BeanFactory 的序列化，我想不部分人应该都用不到
      beanFactory.setSerializationId(getId());

      // 下面这两个方法很重要，别跟丢了，具体细节之后说
      // 设置 BeanFactory 的两个配置属性：是否允许 Bean 覆盖、是否允许循环引用
      customizeBeanFactory(beanFactory);

      // 加载 Bean 到 BeanFactory 中
      loadBeanDefinitions(beanFactory);
      synchronized (this.beanFactoryMonitor) {
         this.beanFactory = beanFactory;
      }
   }
   catch (IOException ex) {
      throw new ApplicationContextException("I/O error parsing bean definition source for " + getDisplayName(), ex);
   }
}
```

在继续往下之前，我们需要先了解 BeanDefinition。**我们说 BeanFactory 是 Bean 容器，那么 Bean 又是什么呢？**

这里的 BeanDefinition 就是我们所说的 Spring 的 Bean，我们自己定义的各个 Bean 其实会转换成一个个 BeanDefinition 存在于 Spring 的 BeanFactory 中。

> BeanDefinition 中保存了我们的 Bean 信息，比如这个 Bean 指向的是哪个类、是否是单例的、是否懒加载、这个 Bean 依赖了哪些 Bean 等等。

#### **BeanDefinition 接口定义**

我们来看下 BeanDefinition 的接口定义：

```java
public interface BeanDefinition extends AttributeAccessor, BeanMetadataElement {

   // 我们可以看到，默认只提供 sington 和 prototype 两种，
   // 很多读者可能知道还有 request, session, globalSession, application, websocket 这几种，
   // 不过，它们属于基于 web 的扩展。
   String SCOPE_SINGLETON = ConfigurableBeanFactory.SCOPE_SINGLETON;
   String SCOPE_PROTOTYPE = ConfigurableBeanFactory.SCOPE_PROTOTYPE;

   // 比较不重要，直接跳过吧
   int ROLE_APPLICATION = 0;
   int ROLE_SUPPORT = 1;
   int ROLE_INFRASTRUCTURE = 2;

   // 设置父 Bean，这里涉及到 bean 继承，不是 java 继承。请参见附录的详细介绍
   // 一句话就是：继承父 Bean 的配置信息而已
   void setParentName(String parentName);

   // 获取父 Bean
   String getParentName();

   // 设置 Bean 的类名称，将来是要通过反射来生成实例的
   void setBeanClassName(String beanClassName);

   // 获取 Bean 的类名称
   String getBeanClassName();


   // 设置 bean 的 scope
   void setScope(String scope);

   String getScope();

   // 设置是否懒加载
   void setLazyInit(boolean lazyInit);

   boolean isLazyInit();

   // 设置该 Bean 依赖的所有的 Bean，注意，这里的依赖不是指属性依赖(如 @Autowire 标记的)，
   // 是 depends-on="" 属性设置的值。
   void setDependsOn(String... dependsOn);

   // 返回该 Bean 的所有依赖
   String[] getDependsOn();

   // 设置该 Bean 是否可以注入到其他 Bean 中，只对根据类型注入有效，
   // 如果根据名称注入，即使这边设置了 false，也是可以的
   void setAutowireCandidate(boolean autowireCandidate);

   // 该 Bean 是否可以注入到其他 Bean 中
   boolean isAutowireCandidate();

   // 主要的。同一接口的多个实现，如果不指定名字的话，Spring 会优先选择设置 primary 为 true 的 bean
   void setPrimary(boolean primary);

   // 是否是 primary 的
   boolean isPrimary();

   // 如果该 Bean 采用工厂方法生成，指定工厂名称。对工厂不熟悉的读者，请参加附录
   // 一句话就是：有些实例不是用反射生成的，而是用工厂模式生成的
   void setFactoryBeanName(String factoryBeanName);
   // 获取工厂名称
   String getFactoryBeanName();
   // 指定工厂类中的 工厂方法名称
   void setFactoryMethodName(String factoryMethodName);
   // 获取工厂类中的 工厂方法名称
   String getFactoryMethodName();

   // 构造器参数
   ConstructorArgumentValues getConstructorArgumentValues();

   // Bean 中的属性值，后面给 bean 注入属性值的时候会说到
   MutablePropertyValues getPropertyValues();

   // 是否 singleton
   boolean isSingleton();

   // 是否 prototype
   boolean isPrototype();

   // 如果这个 Bean 是被设置为 abstract，那么不能实例化，
   // 常用于作为 父bean 用于继承，其实也很少用......
   boolean isAbstract();

   int getRole();
   String getDescription();
   String getResourceDescription();
   BeanDefinition getOriginatingBeanDefinition();
}
```

**customizeBeanFactory**

customizeBeanFactory(beanFactory) 比较简单，就是配置是否允许 BeanDefinition 覆盖、是否允许循环引用。

```java
protected void customizeBeanFactory(DefaultListableBeanFactory beanFactory) {
   if (this.allowBeanDefinitionOverriding != null) {
      // 是否允许 Bean 定义覆盖
      beanFactory.setAllowBeanDefinitionOverriding(this.allowBeanDefinitionOverriding);
   }
   if (this.allowCircularReferences != null) {
      // 是否允许 Bean 间的循环依赖
      beanFactory.setAllowCircularReferences(this.allowCircularReferences);
   }
}
```

- BeanDefinition 的覆盖问题可能会有开发者碰到这个坑，就是在配置文件中定义 bean 时使用了相同的 id 或 name，默认情况下，allowBeanDefinitionOverriding 属性为 null，如果在同一配置文件中重复了，会抛错，但是如果不是同一配置文件中，会发生覆盖。

#### **加载 Bean: loadBeanDefinitions**

接下来是最重要的 **`loadBeanDefinitions(beanFactory)`** 方法了，这个方法将根据配置，加载各个 Bean，然后放到 BeanFactory 中。

读取配置的操作在 **`XmlBeanDefinitionReader`** 中，其负责加载配置、解析。

```java
/** 我们可以看到，此方法将通过一个 XmlBeanDefinitionReader 实例来加载各个 Bean。*/
@Override
protected void loadBeanDefinitions(DefaultListableBeanFactory beanFactory) throws BeansException, IOException {
   // 给这个 BeanFactory 实例化一个 XmlBeanDefinitionReader
   XmlBeanDefinitionReader beanDefinitionReader = new XmlBeanDefinitionReader(beanFactory);

   // Configure the bean definition reader with this context's
   // resource loading environment.
   beanDefinitionReader.setEnvironment(this.getEnvironment());
   beanDefinitionReader.setResourceLoader(this);
   beanDefinitionReader.setEntityResolver(new ResourceEntityResolver(this));

   // 初始化 BeanDefinitionReader，其实这个是提供给子类覆写的，
   // 我看了一下，没有类覆写这个方法，我们姑且当做不重要吧
   initBeanDefinitionReader(beanDefinitionReader);
   // 重点来了，继续往下
   loadBeanDefinitions(beanDefinitionReader);
}
```



````java
protected void loadBeanDefinitions(XmlBeanDefinitionReader reader) throws BeansException, IOException {
   Resource[] configResources = getConfigResources();
   if (configResources != null) {
      // 往下看
      reader.loadBeanDefinitions(configResources);
   }
   String[] configLocations = getConfigLocations();
   if (configLocations != null) {
      // 2
      reader.loadBeanDefinitions(configLocations);
   }
}

// 上面虽然有两个分支，不过第二个分支很快通过解析路径转换为 Resource 以后也会进到这里
@Override
public int loadBeanDefinitions(Resource... resources) throws BeanDefinitionStoreException {
   Assert.notNull(resources, "Resource array must not be null");
   int counter = 0;
   // 注意这里是个 for 循环，也就是每个文件是一个 resource
   for (Resource resource : resources) {
      // 继续往下看
      counter += loadBeanDefinitions(resource);
   }
   // 最后返回 counter，表示总共加载了多少的 BeanDefinition
   return counter;
}

// XmlBeanDefinitionReader 303
@Override
public int loadBeanDefinitions(Resource resource) throws BeanDefinitionStoreException {
   return loadBeanDefinitions(new EncodedResource(resource));
}

// XmlBeanDefinitionReader 314
public int loadBeanDefinitions(EncodedResource encodedResource) throws BeanDefinitionStoreException {
   Assert.notNull(encodedResource, "EncodedResource must not be null");
   if (logger.isInfoEnabled()) {
      logger.info("Loading XML bean definitions from " + encodedResource.getResource());
   }
   // 用一个 ThreadLocal 来存放配置文件资源
   Set<EncodedResource> currentResources = this.resourcesCurrentlyBeingLoaded.get();
   if (currentResources == null) {
      currentResources = new HashSet<EncodedResource>(4);
      this.resourcesCurrentlyBeingLoaded.set(currentResources);
   }
   if (!currentResources.add(encodedResource)) {
      throw new BeanDefinitionStoreException(
            "Detected cyclic loading of " + encodedResource + " - check your import definitions!");
   }
   try {
      InputStream inputStream = encodedResource.getResource().getInputStream();
      try {
         InputSource inputSource = new InputSource(inputStream);
         if (encodedResource.getEncoding() != null) {
            inputSource.setEncoding(encodedResource.getEncoding());
         }
         // 核心部分是这里，往下面看
         return doLoadBeanDefinitions(inputSource, encodedResource.getResource());
      }
      finally {
         inputStream.close();
      }
   }
   catch (IOException ex) {
      throw new BeanDefinitionStoreException(
            "IOException parsing XML document from " + encodedResource.getResource(), ex);
   }
   finally {
      currentResources.remove(encodedResource);
      if (currentResources.isEmpty()) {
         this.resourcesCurrentlyBeingLoaded.remove();
      }
   }
}

// 还在这个文件中，第 388 行
protected int doLoadBeanDefinitions(InputSource inputSource, Resource resource)
      throws BeanDefinitionStoreException {
   try {
      // 这里就不看了，将 xml 文件转换为 Document 对象
      Document doc = doLoadDocument(inputSource, resource);
      // 继续
      return registerBeanDefinitions(doc, resource);
   }
   catch (...
}
// 还在这个文件中，第 505 行
// 返回值：返回从当前配置文件加载了多少数量的 Bean
public int registerBeanDefinitions(Document doc, Resource resource) throws BeanDefinitionStoreException {
   BeanDefinitionDocumentReader documentReader = createBeanDefinitionDocumentReader();
   int countBefore = getRegistry().getBeanDefinitionCount();
   // 这里
   documentReader.registerBeanDefinitions(doc, createReaderContext(resource));
   return getRegistry().getBeanDefinitionCount() - countBefore;
}
// DefaultBeanDefinitionDocumentReader 90
@Override
public void registerBeanDefinitions(Document doc, XmlReaderContext readerContext) {
   this.readerContext = readerContext;
   logger.debug("Loading bean definitions");
   Element root = doc.getDocumentElement();
   // 从 xml 根节点开始解析文件
   doRegisterBeanDefinitions(root);
}  
````

#### **doRegisterBeanDefinitions：**

```java
// DefaultBeanDefinitionDocumentReader 116
protected void doRegisterBeanDefinitions(Element root) {
   // 我们看名字就知道，BeanDefinitionParserDelegate 必定是一个重要的类，它负责解析 Bean 定义，
   // 这里为什么要定义一个 parent? 看到后面就知道了，是递归问题，
   // 因为 <beans /> 内部是可以定义 <beans /> 的，所以这个方法的 root 其实不一定就是 xml 的根节点，也可以是嵌套在里面的 <beans /> 节点，从源码分析的角度，我们当做根节点就好了
   BeanDefinitionParserDelegate parent = this.delegate;
   this.delegate = createDelegate(getReaderContext(), root, parent);

   if (this.delegate.isDefaultNamespace(root)) {
      // 这块说的是根节点 <beans ... profile="dev" /> 中的 profile 是否是当前环境需要的，
      // 如果当前环境配置的 profile 不包含此 profile，那就直接 return 了，不对此 <beans /> 解析
      // 不熟悉 profile 为何物，不熟悉怎么配置 profile 读者的请移步附录区
      String profileSpec = root.getAttribute(PROFILE_ATTRIBUTE);
      if (StringUtils.hasText(profileSpec)) {
         String[] specifiedProfiles = StringUtils.tokenizeToStringArray(
               profileSpec, BeanDefinitionParserDelegate.MULTI_VALUE_ATTRIBUTE_DELIMITERS);
         if (!getReaderContext().getEnvironment().acceptsProfiles(specifiedProfiles)) {
            if (logger.isInfoEnabled()) {
               logger.info("Skipped XML bean definition file due to specified profiles [" + profileSpec +
                     "] not matching: " + getReaderContext().getResource());
            }
            return;
         }
      }
   }

   preProcessXml(root); // 钩子
   // 往下看
   parseBeanDefinitions(root, this.delegate);
   postProcessXml(root); // 钩子

   this.delegate = parent;
}
```

***

### **项目结构**

<img src="https://my-blog-to-use.oss-cn-beijing.aliyuncs.com/2019-7/springboot-hellowold-structure.png" alt="img" style="zoom:50%;" />

**Spring Boot 的启动类是需要最外层的，不然可能导致一些类无法被正确扫描到，导致一些奇怪的问题。** 一般情况下 Spring Boot 项目结构类似下面这样

```
com
  +- example
    +- myproject
      +- Application.java
      |
      +- domain
      |  +- Customer.java
      |  +- CustomerRepository.java
      |
      +- service
      |  +- CustomerService.java
      |
      +- controller
      |  +- CustomerController.java
      |  
      +- config
      |  +- swagerConfig.java
      |
```

- ` Application.java`是项目的启动类
- domain目录主要用于实体（Entity）与数据访问层（Repository）
- service 层主要是业务类代码
- controller 负责页面访问控制
- config 目录主要放一些配置类

**`@SpringBootApplication` 注解**，这个注解的相关代码如下：

```java
package org.springframework.boot.autoconfigure;
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
@SpringBootConfiguration
@EnableAutoConfiguration
@ComponentScan(excludeFilters = {
        @Filter(type = FilterType.CUSTOM, classes = TypeExcludeFilter.class),
        @Filter(type = FilterType.CUSTOM, classes = AutoConfigurationExcludeFilter.class) })
public @interface SpringBootApplication {
   ......
}
package org.springframework.boot;
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Configuration
public @interface SpringBootConfiguration {

}
```

可以看出大概可以把 `@SpringBootApplication `看作是 `@Configuration`、`@EnableAutoConfiguration`、`@ComponentScan ` 注解的集合。根据 SpringBoot官网，这三个注解的作用分别是：

- `@EnableAutoConfiguration`：启用 SpringBoot 的自动配置机制
- `@ComponentScan`： 扫描被`@Component` (`@Service`,`@Controller`)注解的bean，注解默认会扫描该类所在的包下所有的类。
- `@Configuration`：允许在上下文中注册额外的bean或导入其他配置类。

> @RestController`是Spring 4 之后新加的注解，如果在Spring4之前开发 RESTful Web服务的话，你需要使用`@Controller` 并结合`@ResponseBody`注解，也就是说`@Controller` +`@ResponseBody`= `@RestController

***

### 注解

- **@Field**：使用@Field为映射到NoSql数据的对象 定义结构化数据类型的字段名
  - @Field注释是@Column注释的一种通用形式，它并不特定于关系数据库。您可以使用@Field映射EIS和NoSQL数据。
- 

***

### lombok

- `val`：用在局部变量前面，相当于将变量声明为final

- `@NonNull`：给方法参数增加这个注解会自动在方法内对该参数进行是否为空的校验，如果为空，则抛出NPE（NullPointerException）

- `@Cleanup`：自动管理资源，用在局部变量之前，在当前变量范围内即将执行完毕退出之前会自动清理资源，自动生成try-finally这样的代码来关闭流。虽然自JDK7以来，原生引入了try--with--resource结构，但还是不如@Cleanup来的简洁。

- `@Getter/@Setter`：用在属性上，再也不用自己手写setter和getter方法了，还可以指定访问范围

- `@ToString`：用在类上，可以自动覆写toString方法，当然还可以加其他参数，例如@ToString(exclude=”id”)排除id属性，或者@ToString(callSuper=true, includeFieldNames=true)调用父类的toString方法，包含所有属性

- `@EqualsAndHashCode`：用在类上，自动生成equals方法和hashCode方法

- `@NoArgsConstructor, @RequiredArgsConstructor and @AllArgsConstructor`：用在类上，自动生成无参构造和使用所有参数的构造函数以及把所有@NonNull属性作为参数的构造函数，如果指定staticName = “of”参数，同时还会生成一个返回类对象的静态工厂方法，比使用构造函数方便很多

- `@Data`：注解在类上，相当于同时使用了`@ToString`、`@EqualsAndHashCode`、`@Getter`、`@Setter`和`@RequiredArgsConstrutor`这些注解，对于`POJO类`十分有用

- `@Value`：用在类上，是`@Data`的不可变形式，相当于为属性添加final声明，只提供getter方法，而不提供setter方法

- `@Builder`：用在类、构造器、方法上，为你提供复杂的builder APIs，让你可以像如下方式一样调用`Person.builder().name("Adam Savage").city("San Francisco").job("Mythbusters").job("Unchained Reaction").build();`更多说明参考Builder

- `@SneakyThrows`：自动抛受检异常，而无需显式在方法上使用throws语句

- `@Synchronized`：用在方法上，将方法声明为同步的，并自动加锁，而锁对象是一个私有的属性`$lock`或`$LOCK`，而java中的synchronized关键字锁对象是this，锁在this或者自己的类对象上存在副作用，就是你不能阻止非受控代码去锁this或者类对象，这可能会导致竞争条件或者其它线程错误

- `@Getter(lazy=true)`：可以替代经典的Double Check Lock样板代码

- `@Log`：根据不同的注解生成不同类型的log对象，但是实例名称都是log，有六种可选实现类

- - `@CommonsLog` Creates log = org.apache.commons.logging.LogFactory.getLog(LogExample.class);
  - `@Log` Creates log = java.util.logging.Logger.getLogger(LogExample.class.getName());
  - `@Log4j` Creates log = org.apache.log4j.Logger.getLogger(LogExample.class);
  - `@Log4j2` Creates log = org.apache.logging.log4j.LogManager.getLogger(LogExample.class);
  - `@Slf4j` Creates log = org.slf4j.LoggerFactory.getLogger(LogExample.class);
  - `@XSlf4j` Creates log = org.slf4j.ext.XLoggerFactory.getXLogger(LogExample.class);

- `RestController` **将返回的对象数据直接以 JSON 或 XML 形式写入 HTTP 响应(Response)中。**绝大部分情况下都是直接以 JSON 形式返回给客户端，很少的情况下才会以 XML 形式返回。转换成 XML 形式还需要额为的工作，上面代码中演示的直接就是将对象数据直接以 JSON 形式写入 HTTP 响应(Response)中。

***

### Springboot

```java
@SpringBootApplication
	@SpringBootConfiguration
		@Configuration
    @EnableAutoConfiguration
		@Import(AutoConfigurationImportSelector.class)
    @ComponentScan
		
```

#### `@Controller`和 `RestController`

`@RestControlle`r注解相当于`@ResponseBody ＋ @Controller`合在一起

- `@ResponseBody`注解的作用是将`controller`的方法返回的对象通过适当的转换器转换为指定的格式之后，写入到`response`对象的`body`区，通常用来返回`JSON`数据或者是`XML`
  
- 在使用此注解之后不会再走试图处理器`handler`，而是直接将数据写入到输入流中，他的效果等同于通response对象输出指定格式的数据
  
- use `@RequestMapping` annotation to map requests to `controllers` methods. 

  - You can use it at the class level to express shared mappings or at the method level to narrow down to a specific endpoint mapping.

  There are also HTTP method specific shortcut variants of `@RequestMapping`:

  - `@GetMapping`
  - `@PostMapping`
  - `@PutMapping`
  - `@DeleteMapping`
  - `@PatchMapping`

#### Restful风格

- REST全称是Representational State Transfer，中文意思是表征性状态转移
- URI既可以看成是资源的**地址**，也可以看成是资源的**名称**。如果某些信息没有使用URI来表示，那它就不能算是一个资源， 只能算是资源的一些信息而已。URI的设计应该遵循可寻址性原则，具有**自描述性**，需要在形式上给人以直觉上的关联

**统一资源接口**

- RESTful架构应该遵循统一接口原则，统一接口包含了一组受限的预定义的操作，不论什么样的资源，都是通过使用相同的接口进行资源的访问。
  - 接口应该使用标准的HTTP方法如GET，PUT和POST，并遵循这些方法的语义。

***

#### Restful设计

![img](http://blog.didispace.com/content/images/posts/springbootrestfulapi-1.png)

***

### JWT

- JWT token的格式：header.payload.signature

- header中用于存放签名的生成算法

  ```json
  {"alg": "HS512"}
  ```

- payload中用于存放用户名、token的生成时间和过期时间

  ```json
  {"sub":"admin","created":1489079981393,"exp":1489684781}
  ```

- signature为以header和payload生成的签名，一旦header和payload被篡改，验证将失败

  ```java
  se64UrlEncode(payload),secret)//secret为加密算法的密钥
  String signature = HMACSHA512(base64UrlEncode(header) + "." +base64UrlEncode(payload),secret)
  ```





































### Mybatis Generator(MBG)

- MyBatis生成器（MBG）是MyBatis的代码生成器。它将为MyBatis的所有版本生成代码。它将对一个（或多个）数据库表进行内部检查，并将生成可用于访问表的工件。这减轻了设置对象和配置文件以与数据库表进行交互的麻烦。

**目标运行时信息和示例**

- `MyBatis3DynamicSql`

  *This is the default value*

  - Generates Java code
  - Does not generate XML 
  - The generated model objects are "flat" - there is no separate primary key object
  - The generated code is dependent on the MyBatis Dynamic SQL Library
  - The amount of generated code is relatively small
  - The generated code allows tremendous flexibility in query construction

  ```xml
  <!DOCTYPE generatorConfiguration PUBLIC
   "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
   "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
  <generatorConfiguration>
    <context id="dsql" targetRuntime="MyBatis3DynamicSql">
      <jdbcConnection driverClass="org.hsqldb.jdbcDriver"
          connectionURL="jdbc:hsqldb:mem:aname" />
  
      <javaModelGenerator targetPackage="example.model" targetProject="src/main/java"/>
  
      <javaClientGenerator targetPackage="example.mapper" targetProject="src/main/java"/>
  
      <table tableName="FooTable" />
    </context>
  </generatorConfiguration>
  ```

- `Mybatis3`
  This is the original runtime. Before version 1.3.6 of MBG, most usages of MBG used this style of code.

  - Generates Java code
  - Generates MyBatis3 compatible XML and SQL or MyBatis3 compatible annotated interfaces with no XML
  - The generated model objects may have a hierarchy with separate primary key objects and/or separate object with BLOB fields
  - The generated code has no external dependencies
  - The amount of generated code is very large
  - The generated code has limited capabilities for query construction and is difficult to extend

  ```xml
  <!DOCTYPE generatorConfiguration PUBLIC
   "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
   "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
  <generatorConfiguration>
    <context id="simple" targetRuntime="MyBatis3Simple">
      <jdbcConnection driverClass="org.hsqldb.jdbcDriver"
          connectionURL="jdbc:hsqldb:mem:aname" />
  
      <javaModelGenerator targetPackage="example.model" targetProject="src/main/java"/>
  
      <sqlMapGenerator targetPackage="example.mapper" targetProject="src/main/resources"/>
  
      <javaClientGenerator type="XMLMAPPER" targetPackage="example.mapper" targetProject="src/main/java"/>
  
      <table tableName="FooTable" />
    </context>
  </generatorConfiguration>
  ```

  
  







### nosql







### Redis

#### The Building Blocks 

**Databases**

> In Redis, databases are simply identified by a number with the default database being number 0.

- If you want to change to a different database you can do so via the select command.

**Commands, Keys and Values** 

> While Redis is more than just a key-value store, at its core, every one of Redis’ five data structures has at least a key and a value.

- **Keys** are how you identify pieces of data.
  - it’s good enough to know that a key might look like users:leto. 
  -  The colon doesn’t have any special meaning
- **Values** represent the actual data associated with the key. 
  - They can be anything. Sometimes you’ll store strings, sometimes integers, sometimes you’ll store serialized objects (in JSON, XML or some other format). 
  - For the most part, Redis treats values as a byte array and doesn’t care what they are. 

```
set users:leto '{"name": "leto", "planet": "dune", "likes": ["spice"]}'
```

- The **set** command takes two parameters: the **key** we are setting and the **value** we are setting it to.

```
get users:leto
```

***

**Querying**

> Redis doesn’t allow you to query an object’s values. 

**Memory and Persistence**



#### The Data Structures

**Strings** 

> Strings are the most basic data structures available in Redis.

- Additionally, Redis lets you do some common operations. 
  - For example strlen <key> can be used to get the length of a key’s value; 

```
> strlen users:leto
(integer) 50
> getrange users:leto 31 48
"\"likes\": [\"spice\"]"
> append users:leto " OVER 9000!!"
(integer) 62
```

**Hashes**

> Hashes are a good example of why calling Redis a key-value store isn’t quite accurate.

- The important difference is that they provide an extra level of indirection: a field. Therefore, the hash equivalents of set and get are: 

```
hset users:goku powerlevel 9000
hget users:goku powerlevel
```

- We can also set multiple fields at once, get multiple fields at once, get all fields and values, list all the fields or delete a specific field:

```
hmset users:goku race saiyan age 737
hmget users:goku race powerlevel
hgetall users:goku
hkeys users:goku
hdel users:goku age
```

**Lists**

> Lists let you store and manipulate an array of values for a given key. 
>
> You can add values to the list, get the first or last value and manipulate values at a given index. 
>
> Lists maintain their order and have efficient index-based operations. 

- We could have a newusers list which tracks the newest registered users to our site:

```
lpush newusers goku
ltrim newusers 0 49
```

**Sets**

> Sets are used to store unique values and provide a number of set-based operations, like unions. 

- Sets aren’t ordered but they provide efficient value-based operations. 
- A friend’s list is the classic example of using a set:

```
sadd friends:leto ghanima paul chani jessica
sadd friends:duncan paul jessica alia
```

- Regardless of how many friends a user has, we can efficiently tell (O(1)) whether userX is a friend of userY or not:

```
sismember friends:leto jessica
sismember friends:leto vladimir
```

- Furthermore we can see whether two or more people share the same friends: 

```
sinter friends:leto friends:duncan
```

and even store the result at a new key:

````
sinterstore friends:leto_duncan friends:leto friends:duncan
````

Sets are great for tagging or tracking any other properties of a value for which duplicates don’t make any sense

**Sorted Sets** 

> The last and most powerful data structure are sorted sets. If hashes are like strings but with fields, then sorted sets are like sets but with a score.











### OSS







***

### Swagger

> Swagger-UI是HTML, Javascript, CSS的一个集合，可以动态地根据注解生成在线API文档。 

- `@Api`：用于修饰Controller类，生成Controller相关文档信息
- `@ApiOperation`：用于修饰Controller类中的方法，生成接口方法相关文档信息
- `@ApiParam`：用于修饰接口中的参数，生成接口参数相关文档信息
- `@ApiModelProperty`：用于修饰实体类的属性，当实体类是请求参数或返回结果时，直接生成相关文档信息





***

### Elasticsearch

> Elasticsearch 是一个分布式、可扩展、实时的搜索与数据分析引擎。 它能从项目一开始就赋予你的数据以搜索、分析和探索的能力，可用于实现全文搜索和实时数据统计。

**Spring Data Elasticsearch**

> Spring Data Elasticsearch是Spring提供的一种以Spring Data风格来操作数据存储的方式，它可以避免编写大量的样板代码。

**常用注解**

@Document

```java
//标示映射到Elasticsearch文档上的领域对象
public @interface Document {
  //索引库名次，mysql中数据库的概念
    String indexName();
  //文档类型，mysql中表的概念
    String type() default "";
  //默认分片数
    short shards() default 5;
  //默认副本数量
    short replicas() default 1;
}
```

@Id

```java
//表示是文档的id，文档可以认为是mysql中表行的概念
public @interface Id {
}
```

**@Field**

```java
public @interface Field {
  //文档中字段的类型
    FieldType type() default FieldType.Auto;
  //是否建立倒排索引
    boolean index() default true;
  //是否进行存储
    boolean store() default false;
  //分词器名次
    String analyzer() default "";
}

//为文档自动指定元数据类型
public enum FieldType {
    Text,//会进行分词并建了索引的字符类型
    Integer,
    Long,
    Date,
    Float,
    Double,
    Boolean,
    Object,
    Auto,//自动判断字段类型
    Nested,//嵌套对象类型
    Ip,
    Attachment,
    Keyword//不会进行分词建立索引的类型
}
```

**Sping Data方式的数据操作**

**继承ElasticsearchRepository接口可以获得常用的数据操作方法**



**可以使用衍生查询**

> 在接口中直接指定查询方法名称便可查询，无需进行实现，如商品表中有商品名称、标题和关键字，直接定义以下查询，就可以对这三个字段进行全文搜索。

```java
    /**
     * 搜索查询
     *
     * @param name              商品名称
     * @param subTitle          商品标题
     * @param keywords          商品关键字
     * @param page              分页信息
     * @return
     */
    Page<EsProduct> findByNameOrSubTitleOrKeywords(String name, String subTitle, String keywords, Pageable page);
```



