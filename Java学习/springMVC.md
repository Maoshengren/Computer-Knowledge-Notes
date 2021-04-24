### Special Bean Types

> The **`DispatcherServlet`** delegates to special beans to process requests and render the appropriate responses. By “special beans” we mean Spring-managed `Object` instances that implement framework contracts. Those usually come with built-in contracts, but you can customize their properties and extend or replace them.

The following table lists the special beans detected by the `DispatcherServlet`:

| Bean type                | Explanation                                                  |
| :----------------------- | :----------------------------------------------------------- |
| `HandlerMapping`         | Map a request to a handler along with a list of [interceptors](https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#mvc-handlermapping-interceptor) for pre- and post-processing. The mapping is based on some criteria, the details of which vary by `HandlerMapping` implementation. |
| `HandlerAdapter`         | Help the `DispatcherServlet` to invoke a handler mapped to a request, regardless of how the handler is actually invoked. For example, invoking an annotated controller requires resolving annotations. The main purpose of a `HandlerAdapter` is to shield the `DispatcherServlet` from such details. |
| HandlerExceptionResolver | Strategy to resolve exceptions, possibly mapping them to handlers, to HTML error views, or other targets. |

***

### 配置springmvc

把相关依赖配置好

```xml
<dependencies>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-webmvc</artifactId>
            <version>5.3.5</version>
        </dependency>

        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>servlet-api</artifactId>
            <version>2.5</version>
        </dependency>

        <dependency>
            <groupId>javax.servlet.jsp</groupId>
            <artifactId>jsp-api</artifactId>
            <version>2.2</version>
        </dependency>

        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>jstl</artifactId>
            <version>1.2</version>
        </dependency>
    </dependencies>
```

- 创建maven项目，新建module项目，导入web支持

配置web.xml，**注册DispatchServlet**，如同Servlet的注册一样

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">

    <!--注册DispatchServlet-->
    <servlet>
        <servlet-name>springmvc</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>classpath:springmvc.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet-mapping>
        <servlet-name>springmvc</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>

</web-app>

<build>
    <resources>
        <resource>
            <directory>src/main/resources</directory>
            <includes>
                <include>**/*.properties</include>
                <include>**/*.xml</include>
            </includes>
            <filtering>true</filtering>
        </resource>
        <resource>
            <directory>src/main/java</directory>
            <includes>
                <include>**/*.properties</include>
                <include>**/*.xml</include>
            </includes>
            <filtering>true</filtering>
        </resource>
    </resources>
</build>
```

然后配置对应的spring-Servlet.xml文件

```xml
<?xm1 version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context
        https://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/mvc
        https://www.springframework.org/schema/mvc/spring-mvc.xsd">

    <context:component-scan base-package="com.mao.controller"/>
    <mvc:default-servlet-handler/>
    <mvc:annotation-driven/>

    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver"
          id="internalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/jsp"/>
        <property name="suffix" value=".jsp"/>
    </bean>


</beans>
```

这里有个视图解析器，`InternalResourceViewResolver`指定了逻辑视图的物理地址







<img src="https://blog.didispace.com/books/spring-mvc-4-tutorial/publish/21-2/figures/figure-21-1-the-request-processing-workflow-in-spring-web-mvc.jpg" alt="图21.1 Spring Web MVC处理请求的（高层抽象）工作流" style="zoom: 67%;" />



### DispatcherServlet初始化顺序

**1. Web容器启动时将调用HttpServletBean的init方法**

```java
public abstract class HttpServletBean extends HttpServlet implements EnvironmentAware{
    @Override
    public final void init() throws ServletException {
       //省略部分代码
       //1、如下代码的作用是将Servlet初始化参数设置到该组件上
       //如contextAttribute、contextClass、namespace、contextConfigLocation；
       try {
           PropertyValues pvs = new ServletConfigPropertyValues(getServletConfig(), this.requiredProperties);
           BeanWrapper bw = PropertyAccessorFactory.forBeanPropertyAccess(this);
           ResourceLoader resourceLoader = new ServletContextResourceLoader(getServletContext());
           bw.registerCustomEditor(Resource.class, new ResourceEditor(resourceLoader, this.environment));
           initBeanWrapper(bw);
           bw.setPropertyValues(pvs, true);
       }
       catch (BeansException ex) {
           //省略其他代码
       }
       //2、提供给子类初始化的扩展点，该方法由FrameworkServlet覆盖
       initServletBean();
       if (logger.isDebugEnabled()) {
           logger.debug("Servlet '" + getServletName() + "' configured successfully");
       }
    }
    //…………省略其他代码
}
```

将Servlet初始化参数（init-param）设置到该组件上（如contextAttribute、contextClass、namespace、contextConfigLocation），通过BeanWrapper简化设值过程，方便后续使用；



提供给子类初始化扩展点，initServletBean()，该方法由FrameworkServlet覆盖。



**2. FrameworkServlet通过initServletBean()进行Web上下文初始化**

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210402085129474.png" alt="image-20210402085129474" style="zoom:67%;" />

- `HttpServletBean`：Simple extension of `HttpServlet` which treats its config parameters (init-param entries within the servlet tag in web.xml) as bean properties.

```java
public abstract class FrameworkServlet extends HttpServletBean {
	@Override
    protected final void initServletBean() throws ServletException {
        
       //省略部分代码
        
       try {
           //1、初始化Web上下文
           this.webApplicationContext = initWebApplicationContext();
           //2、提供给子类初始化的扩展点
           initFrameworkServlet();
       }
        
       //省略部分代码
        
    }
}
```

该方法主要作用如下：

初始化web上下文； 

提供给子类初始化扩展点；

- 其中`WebApplicationContext` 也是一个bean工厂，继承了`ApplicationContext`接口，并有不同的初始化Context的类如 `XML`，`Groovy`和 `Annotation`三个

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210402084031133.png" alt="image-20210402084031133" style="zoom:67%;" />

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210402084341280.png" alt="image-20210402084341280" style="zoom:67%;" />

- 对于XML配置的DispatchServlet

```xml
<servlet>
    <servlet-name>springmvc</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:spring-servlet.xml</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
</servlet>
<!--Calling setContextConfigLocation (init-param 'contextConfigLocation') will dictate which XML files will be loaded by the default XmlWebApplicationContext -->
```





```java
protected WebApplicationContext initWebApplicationContext() {
	//ROOT上下文（ContextLoaderListener加载的）
   WebApplicationContext rootContext =
		  WebApplicationContextUtils.getWebApplicationContext(getServletContext());
   WebApplicationContext wac = null;
   if (this.webApplicationContext != null) {
	   // 1、在创建该Servlet注入的上下文
	   wac = this.webApplicationContext;
	   if (wac instanceof ConfigurableWebApplicationContext) {
		  ConfigurableWebApplicationContext cwac = (ConfigurableWebApplicationContext) wac;
		  if (!cwac.isActive()) {
			  if (cwac.getParent() == null) {
				  cwac.setParent(rootContext);
			  }
			  configureAndRefreshWebApplicationContext(cwac);
		  }
	   }
   }
   if (wac == null) {
		 //2、查找已经绑定的上下文
	   wac = findWebApplicationContext();
   }
   if (wac == null) {
		//3、如果没有找到相应的上下文，并指定父亲为ContextLoaderListener
	   wac = createWebApplicationContext(rootContext);
   }
   if (!this.refreshEventReceived) {
		 //4、刷新上下文（执行一些初始化）
	   onRefresh(wac);
   }
   if (this.publishContext) {
	   // Publish the context as a servlet context attribute.
	   String attrName = getServletContextAttributeName();
	   getServletContext().setAttribute(attrName, wac);
	   //省略部分代码
   }
   return wac;
}
```

从`initWebApplicationContext()`方法可以看出，基本上如果`ContextLoaderListener`加载了上下文将作为根上下文（DispatcherServlet的父容器）。 最后调用了`onRefresh()`方法执行容器的一些初始化，这个方法由子类实现，来进行扩展。

**3. DispatcherServlet实现了onRefresh()方法提供一些前端控制器相关的配置**

```java
public class DispatcherServlet extends FrameworkServlet {
     //实现子类的onRefresh()方法，该方法委托为initStrategies()方法。
    @Override
    protected void onRefresh(ApplicationContext context) {
       initStrategies(context);
    }

    //初始化默认的Spring Web MVC框架使用的策略（如HandlerMapping）
    protected viod initStrategies(ApplicationContext context){
		initMultipartResolver(context);//初始化上传文件解析器
		initLocaleResolver(context);//初始化本地解析器
		initThemeResolver(context);//初始化主题解析器
		initHandlerMapping(context);
		//初始化处理器映射器,将请求映射到处理器
		initHandlerAdapters(context);//初始化处理器适配器
		initHandlerExceptionResolver(context);
		//初始化处理器异常解析器,如果执行过程中遇到异常将交给HandlerExceptionResolver来解析
		initRequestToViewNameTranslator(context);
		//初始化请求到具体视图名称解析器
		initViewResolvers(context);
		//初始化视图解析器,通过ViewResolver解析逻辑视图名到具体视图实现
		initFlshMapManager(context);//初始化flash映射管理
	}
}
```

`initStrategies` 方法将在 `WebApplicationContext` 初始化后自动执行，自动扫描上下文的Bean，根据名称或者类型匹配的机制查找自定义组件，如果没有找到则会装配一套Spring的默认组件`org.springframework.web.servlet`路径下有一个`DispatcherServlet.properties`配置文件，该文件指定了`DispatcherServlet` 所使用的默认组件.

***

### DispatcherServlet工作流程

- 当用户对SpringMVC应用程序发起请求时，这些请求都会被SpringMVC的`DispatcherServlet`处理

- 通过处理器找到最为合适的`HandlerMapping`定义的请求映射中最为合适的映射

  - 例如

    ```java
    @GetMapping("/hello")
    //Controller
    //注意，Controller只是一个接口，我们实现了这个接口，然后HandlerAdapter寻找合适的适配器
    //利用java的反射机制，替我们调用这个实现了的控制器
    ```

    请求中带`/hello`后缀的请求将由对应的控制器来处理

- 然后通过`HandlerMapping`找到相对应的`Handler`，然后再通过相对应的`HandlerAdapter`处理该Handler

  - `DispatcherServlte`会根据配置文件信息注册`HandlerAdapter`，如果在配置文件中没有配置，那么 DispatcherServlte会获取HandlerAdapter的默认配置，如果是读取默认配置的话，DispatcherServlte会读取 DispatcherServlte.properties文件,该文件中配置了三种 HandlerAdapter：`HttpRequestHandlerAdapter`，`SimpleControllerHandlerAdapter`和 `AnnotationMethodHandlerAdapter`。DispatcherServlte会将这三个HandlerAdapter对象存储到 它的`handlerAdapters`这个集合属性中，这样就完成了HandlerAdapter的注册。
  - DispatcherServlte会根据handlerMapping传过来的controller与已经注册好了的HandlerAdapter 一一匹配，看哪一种HandlerAdapter是支持该controller类型的，如果找到了其中一种HandlerAdapter是支持传过来的 controller类型，那么该HandlerAdapter会调用自己的handle方法，handle方法运用Java的 反射机制执行controller的具体方法来获得ModelAndView，例如SimpleControllerHandlerAdapter是支持 实现了`controller`接口的控制器，如果自己写的控制器实现了controller接口，那么 `SimpleControllerHandlerAdapter`就会去执行自己写控制器中的具体方法来完成请求。

- 返回结果是一个`ModelAndView`对象，当该ModelAndView对象中不包含真正的视图，而是一个**逻辑视图路径**的时候，`ViewResolver`就会把该逻辑视图路径解析为真正的View视图对象，然后通过View的渲染，将最终结果返回给用户。

  - 之前在xml中注册的`InternalResourceViewResolver`就是这个ViewResolver的实现类，通过名字调用render方法即可解析视图

```java
//如何查看源码结构
Ctrl+H即可查看
```

***

### SpringMVC执行原理

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210402103601095.png" alt="image-20210402103601095" style="zoom:50%;" />

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210402103626679.png" alt="image-20210402103626679" style="zoom:67%;" />

***

### 测试接口 MockMvc





***

### 全局返回

在我们提供后端 API 给前端时，我们需要告前端，这个 API 调用结果是否成功：

- 如果**成功**，成功的数据是什么。后续，前端会取数据渲染到页面上
- 如果**失败**，失败的原因是什么。一般，前端会将原因弹出提示给用户

这样，我们就需要有统一的返回结果，而不能是每个接口自己定义自己的风格。一般来说，统一的全局返回信息如下：

- 成功时，返回**成功的状态码** + **数据**
- 失败时，返回**失败的状态码** + **错误提示**

实际项目在实践时，我们会将状态码放在 Response Body **响应内容**中返回。

在全局统一返回里，我们至少需要定义三个字段：

- `code`：状态码。无论是否成功，必须返回。
  - 成功时，状态码为 0 。
  - 失败时，对应业务的错误码。

```java
// 成功响应
{
    code: 0,
    data: {
        id: 1,
        username: "yudaoyuanma"
    }
}
// 失败响应
{
    code: 233666,
    message: "徐妈太丑了"
}

/**
 * 通用返回结果
 *
 * @param <T> 结果泛型
 */
public class CommonResult<T> implements Serializable {

    public static Integer CODE_SUCCESS = 0;

    /**
     * 错误码
     */
    private Integer code;
    /**
     * 错误提示
     */
    private String message;
    /**
     * 返回数据
     */
    private T data;

    /**
     * 将传入的 result 对象，转换成另外一个泛型结果的对象
     *
     * 因为 A 方法返回的 CommonResult 对象，不满足调用其的 B 方法的返回，所以需要进行转换。
     *
     * @param result 传入的 result 对象
     * @param <T> 返回的泛型
     * @return 新的 CommonResult 对象
     */
    public static <T> CommonResult<T> error(CommonResult<?> result) {
        return error(result.getCode(), result.getMessage());
    }

    public static <T> CommonResult<T> error(Integer code, String message) {
        Assert.isTrue(!CODE_SUCCESS.equals(code), "code 必须是错误的！");
        CommonResult<T> result = new CommonResult<>();
        result.code = code;
        result.message = message;
        return result;
    }

    public static <T> CommonResult<T> success(T data) {
        CommonResult<T> result = new CommonResult<>();
        result.code = CODE_SUCCESS;
        result.data = data;
        result.message = "";
        return result;
    }

    ···

    @JsonIgnore
    public boolean isSuccess() {
        return CODE_SUCCESS.equals(code);
    }

    @JsonIgnore
    public boolean isError() {
        return !isSuccess();
    }

    @Override
    public String toString() {
        return "CommonResult{" +
                "code=" + code +
                ", message='" + message + '\'' +
                ", data=" + data +
                '}';
    }

}
```

创建 **GlobalResponseBodyHandler** 类，全局统一返回的处理器。代码如下：

```java
// GlobalResponseBodyHandler.java

@ControllerAdvice(basePackages = "cn.iocoder.springboot.lab23.springmvc.controller")
public class GlobalResponseBodyHandler implements ResponseBodyAdvice {

    /**
     * 实现 #supports(MethodParameter returnType, Class converterType) 方法，返回 true
     * 表示拦截 Controller 所有 API 接口的返回结果
     */
    @Override
    public boolean supports(MethodParameter returnType, Class converterType) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body, 
                                  MethodParameter returnType, 
                                  MediaType selectedContentType, 
                                  Class selectedConverterType,
                                  ServerHttpRequest request, 
                                  ServerHttpResponse response) {
        // 如果已经是 CommonResult 类型，则直接返回
        if (body instanceof CommonResult) {
            return body;
        }
        // 如果不是，则包装成 CommonResult 类型
        return CommonResult.success(body);
    }

}
```

- 在 SpringMVC 中，可以使用通过实现 [ResponseBodyAdvice](https://github.com/spring-projects/spring-framework/blob/master/spring-webmvc/src/main/java/org/springframework/web/servlet/mvc/method/annotation/ResponseBodyAdvice.java) 接口，并添加 [`@ControllerAdvice`](https://github.com/spring-projects/spring-framework/blob/master/spring-web/src/main/java/org/springframework/web/bind/annotation/ControllerAdvice.java) 接口，拦截 Controller 的返回结果。注意，我们这里 `@ControllerAdvice` 注解，设置了 `basePackages` 属性，**只拦截** `"cn.iocoder.springboot.lab23.springmvc.controller"` 包

```java
package com.macro.mall.tiny.common.api;

/**
 * 通用返回对象
 *
 * @author macro
 * @date 2019/4/19
 */
public class CommonResult<T> {
    private long code;
    private String message;
    private T data;

    protected CommonResult() {
    }

    protected CommonResult(long code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    /**
     * 成功返回结果
     *
     * @param data 获取的数据
     */
    public static <T> CommonResult<T> success(T data) {
        return new CommonResult<T>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), data);
    }

    /**
     * 成功返回结果
     *
     * @param data 获取的数据
     * @param  message 提示信息
     */
    public static <T> CommonResult<T> success(T data, String message) {
        return new CommonResult<T>(ResultCode.SUCCESS.getCode(), message, data);
    }

    /**
     * 失败返回结果
     * @param errorCode 错误码
     */
    public static <T> CommonResult<T> failed(IErrorCode errorCode) {
        return new CommonResult<T>(errorCode.getCode(), errorCode.getMessage(), null);
    }

    /**
     * 失败返回结果
     * @param message 提示信息
     */
    public static <T> CommonResult<T> failed(String message) {
        return new CommonResult<T>(ResultCode.FAILED.getCode(), message, null);
    }

    /**
     * 失败返回结果
     */
    public static <T> CommonResult<T> failed() {
        return failed(ResultCode.FAILED);
    }

    /**
     * 参数验证失败返回结果
     */
    public static <T> CommonResult<T> validateFailed() {
        return failed(ResultCode.VALIDATE_FAILED);
    }

    /**
     * 参数验证失败返回结果
     * @param message 提示信息
     */
    public static <T> CommonResult<T> validateFailed(String message) {
        return new CommonResult<T>(ResultCode.VALIDATE_FAILED.getCode(), message, null);
    }

    /**
     * 未登录返回结果
     */
    public static <T> CommonResult<T> unauthorized(T data) {
        return new CommonResult<T>(ResultCode.UNAUTHORIZED.getCode(), 
                                   ResultCode.UNAUTHORIZED.getMessage(), data);
    }

    /**
     * 未授权返回结果
     */
    public static <T> CommonResult<T> forbidden(T data) {
        return new CommonResult<T>(ResultCode.FORBIDDEN.getCode(), ResultCode.FORBIDDEN.getMessage(), data);
    }

    public long getCode() {
        return code;
    }

    public void setCode(long code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
```



```java
package com.macro.mall.tiny.common.api;

import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * 分页数据封装类
 * Created by macro on 2019/4/19.
 */
public class CommonPage<T> {
    private Integer pageNum;
    private Integer pageSize;
    private Integer totalPage;
    private Long total;
    private List<T> list;

    /**
     * 将PageHelper分页后的list转为分页信息
     */
    public static <T> CommonPage<T> restPage(List<T> list) {
        CommonPage<T> result = new CommonPage<T>();
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        result.setTotalPage(pageInfo.getPages());
        result.setPageNum(pageInfo.getPageNum());
        result.setPageSize(pageInfo.getPageSize());
        result.setTotal(pageInfo.getTotal());
        result.setList(pageInfo.getList());
        return result;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
}
```

```java
package com.macro.mall.tiny.common.api;

/**
 * 枚举了一些常用API操作码
 *
 * @author macro
 * @date 2019/4/19
 */
public enum ResultCode implements IErrorCode {
    /**
     *
     */
    SUCCESS(200, "操作成功"),
    FAILED(500, "操作失败"),
    VALIDATE_FAILED(404, "参数检验失败"),
    UNAUTHORIZED(401, "暂未登录或token已经过期"),
    FORBIDDEN(403, "没有相关权限");
    private long code;
    private String message;

    ResultCode(long code, String message) {
        this.code = code;
        this.message = message;
    }

    @Override
    public long getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }
}

```

```java
package com.macro.mall.tiny.common.api;

/**
 * 封装API的错误码
 *
 * @author macro
 * @date 2019/4/19
 */
public interface IErrorCode {
    long getCode();

    String getMessage();
}

```



### 全局异常处理