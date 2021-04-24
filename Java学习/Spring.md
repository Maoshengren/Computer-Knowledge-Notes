### ContextLoaderListener

- Bootstrap listener to start up and shut down Spring's root `{@link WebApplicationContext}`.
- 这个类是用来开启和关闭Spring的root上下文，即`WebApplicationContext`，那么这个接口的定义是什么呢

```java
/**
 * Interface to provide configuration for a web application.
 * This interface adds a {@code getServletContext()} method to the generic
 * ApplicationContext interface, and defines a well-known application attribute name
 * that the root context must be bound to in the bootstrap process.
 */
```

- Simply delegates to `{@link ContextLoader}` as well as to `{@link ContextCleanupListener}`.
- 这个类有两个构造方法，默认构造和传入一个现有的上下文进行构造
- 还有初始化和销毁web环境的上下文方法

```java
public class ContextLoaderListener extends ContextLoader implements ServletContextListener{
    /**Create a new {@code ContextLoaderListener} that will create a web application
	 * context based on the "contextClass" and "contextConfigLocation" servlet
	 * context-params.
	 */
    public ContextLoaderListener() {
	}
    
    /**
	 * Create a new {@code ContextLoaderListener} with the given application context.
	 */
    public ContextLoaderListener(WebApplicationContext context) {
		super(context);
	}
    
    /**
	 * Initialize the root web application context.
	 */
	@Override
	public void contextInitialized(ServletContextEvent event) {
        /**
          * getServletContext()返回Servlet的上下文
          * initWebApplicationContext 父类ContextLoader的方法
          */
		initWebApplicationContext(event.getServletContext());
	}
    
    /**
	 * Close the root web application context.
	 */
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		closeWebApplicationContext(event.getServletContext());
		ContextCleanupListener.cleanupAttributes(event.getServletContext());
	}
}
```

- 它实现了Tomcat容器的**`ServletContextListener`**接口，所以它与普通的Servlet监听是一样的。同样是重写到两个方法：**`contextInitialized()`**方法在web容器初始化时执行，**`contextDestroyed()`**方法在容器销毁时执行。

- WEB容器启动时会触发初始化事件，`ContextLoaderListener` 监听到这个事件，其 `contextInitialized() ` 方法会被调用，在这个方法中Spring会初始化一个根上下文，即 **`WebApplicationContext`**

### ContextLoader

- `ContextLoader`是真正加载环境配置的类

```java
/**
 * Performs the actual initialization work for the root application context.
 * Called by {@link ContextLoaderListener}.
 * 定义了一些常量用于初始化配置
 */
public class ContextLoader {
    
    /**
	 * Config param for the root WebApplicationContext id,
	 * to be used as serialization id for the underlying BeanFactory: {@value}.
	 */
	public static final String CONTEXT_ID_PARAM = "contextId";
    
	/**
	 * 此处省略上面的一堆常量
	 * Name of the class path resource (relative to the ContextLoader class)
	 * that defines ContextLoader's default strategy names.
	 */
	private static final String DEFAULT_STRATEGIES_PATH = "ContextLoader.properties";

    private static final Properties defaultStrategies;
    
    static {
		// Load default strategy implementations from properties file.
		// This is currently strictly internal and not meant to be customized
		// by application developers.
         // 加载默认的配置，即 XmlWebApplicationContext
		try {
			ClassPathResource resource = new 
                 ClassPathResource(DEFAULT_STRATEGIES_PATH, ContextLoader.class);
			defaultStrategies = PropertiesLoaderUtils.loadProperties(resource);
		}
		catch (IOException ex) {
			throw new IllegalStateException("Could not load 'ContextLoader.properties': " + ex.getMessage());
		}
	}
}
```

- `ClassPathResource`: implementation for class path resources，类路径资源的实现，加载以供 `ClassLoder`使用

```java
/**
 * Create a new {@code ClassPathResource} for {@code ClassLoader} usage.
 * A leading slash will be removed, as the ClassLoader resource access
 * methods will not accept it.
 */
public ClassPathResource(String path, @Nullable ClassLoader classLoader) {
		Assert.notNull(path, "Path must not be null");
        /**
         * Normalize the path by suppressing sequences like "path/.." and
         * inner simple dots.
         */
		String pathToUse = StringUtils.cleanPath(path);
		if (pathToUse.startsWith("/")) {
			pathToUse = pathToUse.substring(1);
		}
		this.path = pathToUse;
		this.classLoader = 
            (classLoader != null ? classLoader : ClassUtils.getDefaultClassLoader());
}
```

- `Properties` 实际上就是一张哈希表，其中存储了对象的各种属性，用 `PropertiesLoaderUtils.loadProperties(resource)` 从xml文件中对这些属性进行加载

```java
/**The Properties class represents a persistent set of properties. 
 * The Properties can be saved to a stream or loaded from a stream. 
 * Each key and its corresponding value in the property list is a string.
 */
public class Properties extends Hashtable<Object,Object> {
    private Properties(Properties defaults, int initialCapacity) {
        // use package-private constructor to
        // initialize unused fields with dummy values
        super((Void) null);
        map = new ConcurrentHashMap<>(initialCapacity);
        this.defaults = defaults;

        // Ensure writes can't be reordered
        UNSAFE.storeFence();
    }
}
```

- 现在到了 `ContextLoader.properties` 文件的内容了，即要加载的默认 Spring 配置

```properties
# Default WebApplicationContext implementation class for ContextLoader.
# Used as fallback when no explicit context implementation has been specified as context-param.
# Not meant to be customized by application developers.
org.springframework.web.context.WebApplicationContext=org.springframework.web.context.support.XmlWebApplicationContext
```

- 看看 `XmlWebApplicationContext` 的代码和注释
- 可以看到这个类默认加载spring配置好的 `applicationContext.xml` 
- 其实可以看成spring初始化与IOC容器初始化是一样的

```java
/**
 * By default, the configuration will be taken from "/WEB-INF/applicationContext.xml"
 */
public class XmlWebApplicationContext extends AbstractRefreshableWebApplicationContext{
    /** Default config location for the root context. */
	public static final String DEFAULT_CONFIG_LOCATION = "/WEB-INF/applicationContext.xml";
    
    /** Default prefix for building a config location for a namespace. */
	public static final String DEFAULT_CONFIG_LOCATION_PREFIX = "/WEB-INF/";

	/** Default suffix for building a config location for a namespace. */
	public static final String DEFAULT_CONFIG_LOCATION_SUFFIX = ".xml";
    
    /**
	 * Loads the bean definitions via an XmlBeanDefinitionReader.
	 */
    protected void loadBeanDefinitions(DefaultListableBeanFactory beanFactory) 
        throws BeansException, IOException {
		// Create a new XmlBeanDefinitionReader for the given BeanFactory.
		XmlBeanDefinitionReader beanDefinitionReader = 
            new XmlBeanDefinitionReader(beanFactory);

		// Configure the bean definition reader with this context's
		// resource loading environment.
		beanDefinitionReader.setEnvironment(getEnvironment());
		beanDefinitionReader.setResourceLoader(this);
		beanDefinitionReader.setEntityResolver(new ResourceEntityResolver(this));

		// Allow a subclass to provide custom initialization of the reader,
		// then proceed with actually loading the bean definitions.
		initBeanDefinitionReader(beanDefinitionReader);
		loadBeanDefinitions(beanDefinitionReader);
	}
}
```

- ServletListener会把监听到的创建context信息传送给ContextLoader，然后进行初始化

```java
public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
    if(servletContext.
       getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE) != null) {
      throw new IllegalStateException(
            "Cannot initialize context because there is already a root application context present - " +
            "check whether you have multiple ContextLoader* definitions in your web.xml!");
   }

   servletContext.log("Initializing Spring root WebApplicationContext");
   Log logger = LogFactory.getLog(ContextLoader.class);
   if (logger.isInfoEnabled()) {
      logger.info("Root WebApplicationContext: initialization started");
   }
   long startTime = System.currentTimeMillis();

   try {
      // Store context in local instance variable, to guarantee that
      // it is available on ServletContext shutdown.
      if (this.context == null) {
         this.context = createWebApplicationContext(servletContext);
      }
      if (this.context instanceof ConfigurableWebApplicationContext) {
         ConfigurableWebApplicationContext cwac = 
             (ConfigurableWebApplicationContext) this.context;
         if (!cwac.isActive()) {
            // The context has not yet been refreshed -> provide services such as
            // setting the parent context, setting the application context id, etc
            if (cwac.getParent() == null) {
               // The context instance was injected without an explicit parent ->
               // determine parent for root web application context, if any.
               ApplicationContext parent = loadParentContext(servletContext);
               cwac.setParent(parent);
            }
            configureAndRefreshWebApplicationContext(cwac, servletContext);
         }
      }
      			         servletContext.setAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE, this.context);

      ClassLoader ccl = Thread.currentThread().getContextClassLoader();
      if (ccl == ContextLoader.class.getClassLoader()) {
         currentContext = this.context;
      }
      else if (ccl != null) {
         currentContextPerThread.put(ccl, this.context);
      }

      if (logger.isInfoEnabled()) {
         long elapsedTime = System.currentTimeMillis() - startTime;
         logger.info("Root WebApplicationContext initialized in " + elapsedTime + " ms");
      }

      return this.context;
   }
   catch (RuntimeException | Error ex) {
      logger.error("Context initialization failed", ex);
      servletContext.setAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE, ex);
      throw ex;
   }
}
---------------------------------------------------------------------------------------------
//先创建一个这个实例
/**
 * Instantiate the root WebApplicationContext for this loader, either the
 * default context class or a custom context class if specified.
 */
protected WebApplicationContext createWebApplicationContext(ServletContext sc) {
		Class<?> contextClass = determineContextClass(sc);
		if (!ConfigurableWebApplicationContext.class.isAssignableFrom(contextClass)) {
			throw new ApplicationContextException("Custom context class [" + 									contextClass.getName() + "] is not of type [" + 										ConfigurableWebApplicationContext.class.getName() + "]");
		}
		return (ConfigurableWebApplicationContext) BeanUtils.instantiateClass(contextClass);
}

/**
 * Return the WebApplicationContext implementation class to use, either the
 * default XmlWebApplicationContext or a custom context class if specified.
 * @param servletContext current servlet context
 * @return the WebApplicationContext implementation class to use
 */
protected Class<?> determineContextClass(ServletContext servletContext)
--------------------------------------------------------------------------------------------
```

- **`instantiateClass`**方法来初始化这个类

```java
/**
 * @param clazz the class to instantiate
 * @return the new instance
 * @throws BeanInstantiationException if the bean cannot be instantiated.
 */
public static <T> T instantiateClass(Class<T> clazz) throws BeanInstantiationException;
```



```java
@Override
public void refresh() throws BeansException, IllegalStateException {
    synchronized (this.startupShutdownMonitor) {
        StartupStep contextRefresh=this.applicationStartup.start("spring.context.refresh");

        // Prepare this context for refreshing.
        prepareRefresh();

        // Tell the subclass to refresh the internal bean factory.
        ConfigurableListableBeanFactory beanFactory = obtainFreshBeanFactory();

        // Prepare the bean factory for use in this context.
        prepareBeanFactory(beanFactory);

        try {
            // Allows post-processing of the bean factory in context subclasses.
            postProcessBeanFactory(beanFactory);

            StartupStep beanPostProcess = 
                this.applicationStartup.start("spring.context.beans.post-process");
            // Invoke factory processors registered as beans in the context.
            invokeBeanFactoryPostProcessors(beanFactory);

            // Register bean processors that intercept bean creation.
            registerBeanPostProcessors(beanFactory);
            beanPostProcess.end();

            // Initialize message source for this context.
            initMessageSource();

            // Initialize event multicaster for this context.
            initApplicationEventMulticaster();

            // Initialize other special beans in specific context subclasses.
            onRefresh();

            // Check for listener beans and register them.
            registerListeners();

            // Instantiate all remaining (non-lazy-init) singletons.
            finishBeanFactoryInitialization(beanFactory);

            // Last step: publish corresponding event.
            finishRefresh();
        }

        catch (BeansException ex) {
            if (logger.isWarnEnabled()) {
                logger.warn("Exception encountered during context initialization - " +
                            "cancelling refresh attempt: " + ex);
            }

            // Destroy already created singletons to avoid dangling resources.
            destroyBeans();

            // Reset 'active' flag.
            cancelRefresh(ex);

            // Propagate exception to caller.
            throw ex;
        }

        finally {
            // Reset common introspection caches in Spring's core, since we
            // might not ever need metadata for singleton beans anymore...
            resetCommonCaches();
            contextRefresh.end();
        }
    }
}
```

- 获得这个类的加载器，和当前的context，放进map中

```java
ClassLoader ccl = Thread.currentThread().getContextClassLoader();
if (ccl == ContextLoader.class.getClassLoader()) {
    currentContext = this.context;
}

else if (ccl != null) {
    currentContextPerThread.put(ccl, this.context);
}
```

这样就算初始化完成了，打印了加载的时间

****

### loadBeanDefinitions

```java
   /**
    * Load bean definitions from the specified resource location.
    * <p>The location can also be a location pattern, provided that the
    * ResourceLoader of this bean definition reader is a ResourcePatternResolver.
    * @param location the resource location, to be loaded with the ResourceLoader
    * (or ResourcePatternResolver) of this bean definition reader
    * @param actualResources a Set to be filled with the actual Resource objects
    * that have been resolved during the loading process. May be {@code null}
    * to indicate that the caller is not interested in those Resource objects.
    * @return the number of bean definitions found
    * @throws BeanDefinitionStoreException in case of loading or parsing errors
    * @see #getResourceLoader()
    * @see #loadBeanDefinitions(org.springframework.core.io.Resource)
    * @see #loadBeanDefinitions(org.springframework.core.io.Resource[])
    */
public int loadBeanDefinitions(String location, @Nullable Set<Resource> actualResources) 
throws BeanDefinitionStoreException {
    ResourceLoader resourceLoader = getResourceLoader();
    if (resourceLoader == null) {
        throw new BeanDefinitionStoreException(
            "Cannot load bean definitions from location [" + 
             location + "]: no ResourceLoader available");
    }

    if (resourceLoader instanceof ResourcePatternResolver) {
        // Resource pattern matching available.
        try {
            Resource[] resources = ((ResourcePatternResolver) 
                                    resourceLoader).getResources(location);
            int count = loadBeanDefinitions(resources);
            if (actualResources != null) {
                Collections.addAll(actualResources, resources);
            }
            if (logger.isTraceEnabled()) {
                logger.trace("Loaded " + count + 
                             " bean definitions from location pattern [" + location + "]");
            }
            return count;
        }
        catch (IOException ex) {
            throw new BeanDefinitionStoreException(
                "Could not resolve bean definition resource pattern [" + location + "]", ex);
        }
    }
    else {
        // Can only load single resources by absolute URL.
        Resource resource = resourceLoader.getResource(location);
        int count = loadBeanDefinitions(resource);
        if (actualResources != null) {
            actualResources.add(resource);
        }
        if (logger.isTraceEnabled()) {
            logger.trace("Loaded " + count + 
                         " bean definitions from location [" + location + "]");
        }
        return count;
    }
}
```

- **`ConfigurableListableBeanFactory`** 

```java
/**由大多数可列出的bean工厂实现的配置接口。
 * 除了ConfigurableBeanFactory，它还提供了用于分析和修改bean定义以及预先实例化单例的工具。
 * org.springframework.beans.factory.BeanFactory的此子接口不能在常规应用程序代码中使用：
 * 对于典型用例，请坚持使用org.springframework.beans.factory.BeanFactory或ListableBeanFactory。
 * 即使需要访问bean工厂配置方法，此接口也仅允许框架内部即插即用。
 */

```

### ApplicationContext

- 中央接口，为应用程序提供配置。在应用程序运行时，它是只读的，但是如果实现支持，则可以重新加载。
- ApplicationContext提供：
  - 用于访问应用程序组件的Bean工厂方法。继承自 `ListableBeanFactory`。
  - 以通用方式加载文件资源的能力。继承自org.springframework.core.io.ResourceLoader接口。
  - 将事件发布到注册的侦听器的能力。继承自ApplicationEventPublisher接口。
  - 解决消息的能力，支持国际化。继承自MessageSource接口。
  - 从父上下文继承。后代上下文中的定义将始终优先。例如，这意味着整个Web应用程序都可以使用单个父上下文，而每个servlet都有其自己的子上下文，该子上下文独立于任何其他servlet的子上下文。

### ConfigurableApplicationContext

- SPI接口将由大多数（如果不是全部）应用程序上下文实现。
- 除了ApplicationContext接口中的应用程序上下文客户端方法外，还提供了配置ApplicationContext 的功能。
- Configuration and lifecycle方法在此处进行了封装，以避免使它们对于ApplicationContext客户端代码而言是显而易见的。
- 本方法仅应由 startup and shutdown code 使用。

### AbstractApplicationContext

- ApplicationContext接口的抽象实现。
- 不要求用于配置的存储类型；简单地实现通用上下文功能。
- 使用**模板方法设计模式**，需要具体的子类来实现抽象方法。
- 与普通BeanFactory相比，ApplicationContext应该能够检测在其内部bean工厂中定义的特殊bean：
  - 因此，此类自动注册在上下文中定义为bean的**BeanFactoryPostProcessors**，**BeanPostProcessors**和**ApplicationListeners**。
- 一个MessageSource也可以在上下文中作为bean提供，名称为“ messageSource”。否则，消息解析将委派给父上下文。
- 此外，可以在上下文中将用于应用程序事件的多播器作为类型为ApplicationEventMulticaster的“ applicationEventMulticaster” bean提供。
- 否则，将使用类型为SimpleApplicationEventMulticaster的默认多播器。
- 通过扩展DefaultResourceLoader来实现资源加载。因此，除非在子类中覆盖了getResourceByPath方法，否则将非URL资源路径视为类路径资源（支持包含包路径的完整类路径资源名称，例如“ mypackage / myresource.dat”）。

### AbstractRefreshableApplicationContext

- ApplicationContext实现的基类，该实现应该支持对refresh（）的多次调用，每次都创建一个新的内部bean工厂实例。
- 通常（但不是必须），这样的上下文将由一组配置位置来驱动，以从中加载bean定义。
- 子类唯一实现的方法是loadBeanDefinitions，它在每次刷新时被调用。
- 一个具体的实现应该将bean定义加载到给定的DefaultListableBeanFactory中，通常委托给一个或多个特定的bean定义读取器。
- 以特定的bean定义格式读取的该基类的具体独立子类是ClassPathXmlApplicationContext和FileSystemXmlApplicationContext，它们均从通用AbstractXmlApplicationContext基类派生。 

### AbstractXmlApplicationContext

- 方便的ApplicationContext实现基类，可从XML文档中提取配置，该XML文档包含XmlBeanDefinitionReader可以理解的bean定义。
- 子类只需要实现getConfigResources和/或getConfigLocations方法。
- 此外，它们可能会覆盖getResourceByPath钩子，以特定于环境的方式解释相对路径，和/或覆盖getResourcePatternResolver以扩展模式解析。

<img src="https://www.javadoop.com/blogimages/spring-context/1.png" alt="1" style="zoom: 40%;" />

<img src="https://www.javadoop.com/blogimages/spring-context/2.png" alt="2" style="zoom: 40%;" />

### BeanFactory

```java
/**用于访问Spring bean容器的根接口。这是bean容器的基本客户端视图。
 * 诸如ListableBeanFactory和ConfigurableBeanFactory之类的其他接口可用于特定目的。
 * 该接口由包含多个bean定义的对象实现，每个定义均由String名称唯一标识。
 * 根据bean的定义，工厂将返回所包含对象的独立实例（Prototype设计模式），
 * 或单个共享实例（Singleton设计模式的替代方案，其中实例是作用域中的单例）的工厂。
 * 将返回哪种类型的实例取决于bean工厂的配置：API是相同的。
 * 从Spring 2.0开始，根据具体的应用程序上下文，可以使用更多范围
 * (例如，Web环境中的“ request”和“ session”范围)。
 * 这种方法的重点是BeanFactory是应用程序组件的中央注册表，并集中了应用程序组件的配置
 * (例如，不再需要单个对象读取属性文件）。
 * 
 * 通常，BeanFactory会加载存储在配置源（例如XML文档）中的Bean定义，
 * 并使用org.springframework.beans包来配置Bean。
 * 但是，实现可以根据需要直接在Java代码中直接返回它创建的Java对象。
 * 定义的存储方式没有任何限制：LDAP，RDBMS，XML，属性文件等。
 * 鼓励实现以支持Bean之间的引用(Dependency Injection)。
 * 与ListableBeanFactory中的方法相比，此接口中的所有操作还将检查父工厂(HierarchicalBeanFactory)。
 * 如果在此工厂实例中未找到bean，则将询问直接的父工厂。
 * 应该在此工厂实例中的Bean覆盖任何父工厂中同名的Bean。
 * Bean工厂实现应尽可能支持标准Bean生命周期接口。全套初始化方法及其标准顺序为：
 * BeanNameAware's			setBeanName
 * BeanClassLoaderAware's	setBeanClassLoader
 * BeanFactoryAware's		setBeanFactory
 * EnvironmentAware's		setEnvironment
   ...
 * 在关闭bean工厂时，以下生命周期方法适用：
 - DestructionAwareBeanPostProcessors的postProcessBeforeDestruction方法
 - DisposableBean's destroy
 - a custom destroy-method definitio
 */
```

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210408194405825.png" alt="image-20210408194405825" style="zoom: 67%;" />

***

### ListableBeanFactory

```java
/**
 * BeanFactory接口的扩展将由 可以枚举其所有bean实例的bean工厂 来实现，而不是按客户的要求按名称一一尝
 * 试进行bean查找。
 * 预加载其所有bean定义的BeanFactory实现（例如，基于XML的工厂）可以实现此接口。
 * 如果这是HierarchicalBeanFactory，则返回值将不考虑任何BeanFactory层次结构，而仅与当前工厂中定义的
 * Bean有关。也可以使用BeanFactoryUtils帮助器类来考虑祖先工厂中的bean。
 * 该接口中的方法将仅遵守该工厂的bean定义。他们将忽略通过其他方式（例如ConfigurableBeanFactory的
 * registerSingleton方法）注册的任何单例bean，但getBeanNamesForType和getBeansOfType除外，它们也将
 * 检查此类手动注册的单例。当然，BeanFactory的getBean确实也允许透明访问此类特殊Bean。
 * 但是，在典型情况下，无论如何，所有bean都将由外部bean定义来定义，因此大多数应用程序不必担心这种区别。
 * 注意：除了getBeanDefinitionCount和containsBeanDefinition之外，此接口中的方法不适用于频繁调用。
 * 实施可能很慢。
 */
```

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210411193904098.png" alt="image-20210411193904098" style="zoom:67%;" />

***

### HierarchicalBeanFactory

```java
/**
 * 由bean工厂实现的子接口，可以是层次结构的一部分。
 * 可以在ConfigurableBeanFactory接口中找到用于bean工厂的相应setParentBeanFactory方法，
 * 该方法允许以可配置的方式设置父对象。
 */
```

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210411193924743.png" alt="image-20210411193924743" style="zoom:67%;" />

***

### AutowireCapableBeanFactory

```java
/**
 * BeanFactory接口的扩展将由能够自动装配的bean工厂实现，前提是它们希望为现有的bean实例公开此功能。
 * 此子接口不能在常规应用程序代码中使用：在典型的使用情况下，请坚持使用BeanFactory或
 * ListableBeanFactory。
 * 其他框架的集成代码可以利用此接口来连接和填充Spring无法控制其生命周期的现有bean实例。
 * 例如，这对于WebWork操作和Tapestry页面对象特别有用。
 * 请注意，此接口不是由ApplicationContext实现的，因为应用程序代码几乎从未使用过此接口。
 * 也就是说，它也可以从应用程序上下文中获得，可以通过ApplicationContext的 
 * getAutowireCapableBeanFactory（）方法进行访问。
 * 您也可以实现BeanFactoryAware接口，该接口即使在ApplicationContext中运行时也公开内部BeanFactory，
 * 以访问AutowireCapableBeanFactory：
 * 只需将传入的BeanFactory强制转换为AutowireCapableBeanFactory。
 */
```

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210411194526612.png" alt="image-20210411194526612" style="zoom:67%;" />

***

### ConfigurableListableBeanFactory

```java
/**
 * 由大多数listable的bean工厂实现的配置接口。
 * 除了ConfigurableBeanFactory，它还提供了用于分析和修改bean定义以及预先实例化singleton的工具。
 * 此子接口不能在常规应用程序代码中使用：对于典型用例，请坚持使用BeanFactory或ListableBeanFactory。
 * 即使需要访问bean工厂配置方法，该接口也仅允许框架内部即插即用
 */
```

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210411195713519.png" alt="image-20210411195713519" style="zoom:67%;" />

***

### AbstractBeanFactory

```java
/**
 * BeanFactory实现的抽象基类，提供ConfigurableBeanFactory SPI的全部功能。
 * 不假定有可列出的bean工厂：因此也可以用作bean工厂实现的基类，这些实现从某些后端资源
 *（其中bean定义访问是一项昂贵的操作）获取bean定义。
 * 此类提供singleton缓存(通过其基类DefaultSingletonBeanRegistry，单例/原型确定，FactoryBean处理，
 * 别名，用于子bean定义的bean定义合并以及bean销毁（DisposableBean接口，自定义destroy方法)
 * 此外，它可以通过实现HierarchicalBeanFactory接口来管理bean工厂层次结构
 * (在未知bean的情况下委托给父工厂)。
 * 子类要实现的主要模板方法是getBeanDefinition和createBean，分别为给定的bean名称检索bean定义并为给
 * 定的bean定义创建bean实例。
 * 这些操作的默认实现可以在DefaultListableBeanFactory和AbstractAutowireCapableBeanFactory中找到.
 */
```

****

### AbstractAutowireCapableBeanFactory

```java
/**
 * 实现默认bean创建的抽象bean工厂超类，具有RootBeanDefinition类指定的全部功能。
 * 除了AbstractBeanFactory的createBean方法之外，还实现AutowireCapableBeanFactory接口。
 * 提供Bean创建（具有构造函数解析），属性填充，连接（包括自动装配）和初始化。
 * 处理运行时Bean引用，解析托管集合，调用初始化方法等。
 * 支持自动装配构造函数，按名称的属性和按类型的属性。
 * 子类要实现的主要模板方法是resolveDependency(DependencyDescriptor，String，Set，
 * TypeConverter)，用于按类型自动装配。
 * 如果工厂能够搜索其bean定义，则通常将通过此类搜索来实现匹配的bean。
 * 对于其他工厂样式，可以实现简化的匹配算法。
 * 请注意，此类不承担或实现bean定义注册表功能。有关ListableBeanFactory和BeanDefinitionRegistry接口
 * 的实现，请参见DefaultListableBeanFactory，它们分别表示该工厂的API和SPI视图。
 */
```

***

### DefaultListableBeanFactory

```java
/**
 * 基于bean定义元数据的成熟bean工厂，可通过后处理器进行扩展。
 * 典型的用法是在访问bean之前先注册所有bean定义（可能是从bean定义文件中读取）。
 * 因此，按名称查找Bean是在本地Bean定义表中进行的廉价操作，用于对预解析的Bean定义元数据对象进行操作
 */
```

















































































## IOC容器加载过程

- 想要看spring的加载过程，打断点调试就好了，可以看得很清楚，下面开始吧！

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210407215111879.png" alt="image-20210407215111879" style="zoom: 50%;" />

```java
public ClassPathXmlApplicationContext(
    String[] configLocations, boolean refresh, @Nullable ApplicationContext parent)
    throws BeansException {
	//先进行父环境的设定
    super(parent);
    setConfigLocations(configLocations);
    if (refresh) {
        refresh();
    }
}
-----------------------------------------------------------------
//经过一系列的跳转到了这个类
//Create a new AbstractApplicationContext with no parent.
public AbstractApplicationContext() {
    this.resourcePatternResolver = getResourcePatternResolver();
}
//
```

- 设置一些配置

```java
//Logger used by this class. Available to subclasses.
protected final Log logger = LogFactory.getLog(getClass()); 
//Unique id for this context, if any.
private String id = ObjectUtils.identityToString(this);
//Display name.
private String displayName = ObjectUtils.identityToString(this);
//Flag that indicates whether this context is currently active.
private final AtomicBoolean active = new AtomicBoolean();
//Flag that indicates whether this context has been closed already.
private final AtomicBoolean closed = new AtomicBoolean();
//Synchronization monitor for the "refresh" and "destroy".
private final Object startupShutdownMonitor = new Object();
//Local listeners registered before refresh.
@Nullable
private Set<ApplicationListener<?>> earlyApplicationListeners;
//ApplicationEvents published before the multicaster setup.
@Nullable
private Set<ApplicationEvent> earlyApplicationEvents;
```

- 配置好父环境后，现在开始配置xml文件了

```java
super(parent);
setConfigLocations(configLocations);
if (refresh) {
    refresh();
}
```

<img src="C:\Users\13793\Desktop\学习笔记\Java学习\image-20210407220709925.png" alt="image-20210407220709925" style="zoom:50%;" />

- 只配置了一个xml，所以这个数组里只有一个配置文件，即 `applicationContext.xml` 

***

### 开始最重要的方法：**refresh**

```java
@Override
public void refresh() throws BeansException, IllegalStateException {
    synchronized (this.startupShutdownMonitor) {
        StartupStep contextRefresh = this.applicationStartup.start("spring.context.refresh");

        // Prepare this context for refreshing.
        prepareRefresh();

        // Tell the subclass to refresh the internal bean factory.
        ConfigurableListableBeanFactory beanFactory = obtainFreshBeanFactory();

        // Prepare the bean factory for use in this context.
        prepareBeanFactory(beanFactory);

        try {
            // Allows post-processing of the bean factory in context subclasses.
            postProcessBeanFactory(beanFactory);

            StartupStep beanPostProcess = 
                this.applicationStartup.start("spring.context.beans.post-process");
            // Invoke factory processors registered as beans in the context.
            invokeBeanFactoryPostProcessors(beanFactory);

            // Register bean processors that intercept bean creation.
            registerBeanPostProcessors(beanFactory);
            beanPostProcess.end();

            // Initialize message source for this context.
            initMessageSource();

            // Initialize event multicaster for this context.
            initApplicationEventMulticaster();

            // Initialize other special beans in specific context subclasses.
            onRefresh();

            // Check for listener beans and register them.
            registerListeners();

            // Instantiate all remaining (non-lazy-init) singletons.
            finishBeanFactoryInitialization(beanFactory);

            // Last step: publish corresponding event.
            finishRefresh();
        }

        catch (BeansException ex) {
            if (logger.isWarnEnabled()) {
                logger.warn("Exception encountered during context initialization - " +
                            "cancelling refresh attempt: " + ex);
            }

            // Destroy already created singletons to avoid dangling resources.
            destroyBeans();

            // Reset 'active' flag.
            cancelRefresh(ex);

            // Propagate exception to caller.
            throw ex;
        }

        finally {
            // Reset common introspection caches in Spring's core, since we
            // might not ever need metadata for singleton beans anymore...
            resetCommonCaches();
            contextRefresh.end();
        }
    }
}
```

- 来一个一个看这些函数

```
StartupStep:
分步记录有关ApplicationStartup期间发生的特定阶段或操作的度量。
StartupStep的生命周期如下：
该 步骤 已创建并通过调用应用程序启动程序开始，并被分配了唯一的ID。
然后我们可以在处理过程中使用StartupStep.Tags附加信息
然后，我们需要标记 步骤 的end()
实现可以跟踪“执行时间”或其他度量标准。
```

#### PrepareRefresh方法

```java
//准备此上下文以进行刷新，设置其 启动日期 和 活动标志 以及 执行属性源 的任何初始化。
protected void prepareRefresh() {
    // Switch to active.
    this.startupDate = System.currentTimeMillis();
    this.closed.set(false);
    this.active.set(true);

    if (logger.isDebugEnabled()) {
        if (logger.isTraceEnabled()) {
            logger.trace("Refreshing " + this);
        }
        else {
            logger.debug("Refreshing " + getDisplayName());
        }
    }

    // Initialize any placeholder property sources in the context environment.
    initPropertySources();

    // Validate that all properties marked as required are resolvable:
    // see ConfigurablePropertyResolver#setRequiredProperties
    getEnvironment().validateRequiredProperties();

    // Store pre-refresh ApplicationListeners...
    if (this.earlyApplicationListeners == null) {
        this.earlyApplicationListeners = new LinkedHashSet<>(this.applicationListeners);
    }
    else {
        // Reset local application listeners to pre-refresh state.
        this.applicationListeners.clear();
        this.applicationListeners.addAll(this.earlyApplicationListeners);
    }

    // Allow for the collection of early ApplicationEvents,
    // to be published once the multicaster is available...
    this.earlyApplicationEvents = new LinkedHashSet<>();
}
```

#### ConfigurableListableBeanFactory



- 通过 `obtainFreshBeanFactory()` 方法获取

##### **refreshBeanFactory()**

```java
// 此实现对该上下文的基础bean工厂进行实际刷新，关闭前一个bean工厂（如果有），
// 并为该上下文生命周期的下一阶段初始化一个新的bean工厂。
@Override
protected final void refreshBeanFactory() throws BeansException {
    // 确定此上下文当前是否拥有Bean工厂，即至少已刷新一次且尚未关闭。
    if (hasBeanFactory()) {
        destroyBeans();
        closeBeanFactory();
    }
    try {
        // 
        DefaultListableBeanFactory beanFactory = createBeanFactory();
        beanFactory.setSerializationId(getId());
        customizeBeanFactory(beanFactory);
        loadBeanDefinitions(beanFactory);
        this.beanFactory = beanFactory;
    }
    catch (IOException ex) {
        throw new ApplicationContextException("I/O error parsing bean definition source for " + getDisplayName(), ex);
    }
}
```

##### createBeanFactory()

- 在try后的createBeanFactory()，最终调用这个类，即先进行单例bean的注册

```java
// 共享bean实例的通用注册表，实现SingletonBeanRegistry。
// 允许注册应通过Bean名称获得的注册中心所有调用者共享的Singleton实例。
// 定义好了一大堆东西
public class DefaultSingletonBeanRegistry extends SimpleAliasRegistry implements SingletonBeanRegistry {

	/** Maximum number of suppressed exceptions to preserve. */
	private static final int SUPPRESSED_EXCEPTIONS_LIMIT = 100;


	/** Cache of singleton objects: bean name to bean instance. */
	private final Map<String, Object> singletonObjects = new ConcurrentHashMap<>(256);

	/** Cache of singleton factories: bean name to ObjectFactory. */
	private final Map<String, ObjectFactory<?>> singletonFactories = new HashMap<>(16);

	/** Cache of early singleton objects: bean name to bean instance. */
	private final Map<String, Object> earlySingletonObjects = new ConcurrentHashMap<>(16);

	/** Set of registered singletons, containing the bean names in registration order. */
	private final Set<String> registeredSingletons = new LinkedHashSet<>(256);

	/** Names of beans that are currently in creation. */
	private final Set<String> singletonsCurrentlyInCreation =
			Collections.newSetFromMap(new ConcurrentHashMap<>(16));

	/** Names of beans currently excluded from in creation checks. */
	private final Set<String> inCreationCheckExclusions =
			Collections.newSetFromMap(new ConcurrentHashMap<>(16));

	/** Collection of suppressed Exceptions, available for associating related causes. */
	@Nullable
	private Set<Exception> suppressedExceptions;

	/** Flag that indicates whether we're currently within destroySingletons. */
	private boolean singletonsCurrentlyInDestruction = false;

	/** Disposable bean instances: bean name to disposable instance. */
    // 一次性bean实例：bean名称到一次性实例。
    // 回调接口
	private final Map<String, Object> disposableBeans = new LinkedHashMap<>();

	/** Map between containing bean names: bean name to Set of bean names that the bean contains. */
    // 包含bean名称之间的映射:bean名称到bean所包含的一组bean名称
	private final Map<String, Set<String>> containedBeanMap = new ConcurrentHashMap<>(16);

	/** Map between dependent bean names: bean name to Set of dependent bean names. */
	private final Map<String, Set<String>> dependentBeanMap = new ConcurrentHashMap<>(64);

	/** Map between depending bean names: bean name to Set of bean names for the bean's dependencies. */
	private final Map<String, Set<String>> dependenciesForBeanMap = new ConcurrentHashMap<>(64);
}
```

- 然后从上面的类返回这个类 `AbstractBeanFactory`

```java
/**BeanFactory实现的抽象基类，提供ConfigurableBeanFactory SPI的全部功能。
 * 不假定有可列出的bean工厂：因此也可以用作bean工厂实现的基类，这些实现从某些后端资源
 * (其中bean定义访问是一项昂贵的操作)获取bean定义。
 * 此类提供Singleton缓存 (通过其基类DefaultSingletonBeanRegistry，单例/原型确定，
 * FactoryBean处理，别名，用于子bean定义的bean定义合并以及bean销毁
 * (org.springframework.beans.factory.DisposableBean接口，自定义destroy方法).
 * 此外，它可以通过实现org.springframework.beans.factory.HierarchicalBeanFactory接口来管理
 * bean工厂层次结构（在未知bean的情况下委托给父工厂）。
 * 子类要实现的主要模板方法是getBeanDefinition和createBean，
 * 分别为给定的bean名称检索bean定义并为给定的bean定义创建bean实例。
 * 这些操作的默认实现可以在DefaultListableBeanFactory和AbstractAutowireCapableBeanFactory中找到
 */
```

- 再到这个类 `AbstractAutowireCapableBeanFactory`

```java
/**实现默认bean创建的抽象bean工厂超类，具有RootBeanDefinition类指定的全部功能。
 * 除了AbstractBeanFactory的createBean方法之外，还实现AutowireCapableBeanFactory接口。
 * 提供Bean创建（具有构造函数解析），属性填充，wiring（包括自动装配）和初始化。
 * 处理运行时Bean引用，解析托管集合，调用初始化方法等。
 * 支持自动装配构造函数，按名称的属性和按类型的属性。
 * 子类要实现的主要模板方法是resolveDependency (DependencyDescriptor，String，Set，
 * TypeConverter)，用于按类型自动装配。
 * 如果工厂能够搜索其bean定义，则通常将通过此类搜索来实现匹配的bean
 * 对于其他工厂样式，可以实现简化的匹配算法
 */
public abstract class AbstractAutowireCapableBeanFactory extends AbstractBeanFactory
    implements AutowireCapableBeanFactory {
    //Whether to automatically try to resolve circular references between beans.
    //是否自动尝试解析bean之间的循环引用。
    private boolean allowCircularReferences = true;
    
    //Whether to resort to injecting a raw bean instance in case of circular reference, 
    //even if the injected bean eventually got wrapped.
    private boolean allowRawInjectionDespiteWrapping = false;

    //Dependency types to ignore on dependency check and autowire, 
    //as Set of Class objects: for example, String. Default is none.
	private final Set<Class<?>> ignoredDependencyTypes = new HashSet<>();
	
    //The name of the currently created bean, for implicit dependency registration on getBean 
    //etc invocations triggered from a user-specified Supplier callback.
    private final NamedThreadLocal<String> currentlyCreatedBean = 
        new NamedThreadLocal<>("Currently created bean");

    //Cache of unfinished FactoryBean instances: FactoryBean name to BeanWrapper.
    private final ConcurrentMap<String, BeanWrapper> factoryBeanInstanceCache = 
        new ConcurrentHashMap<>();

    //Cache of candidate factory methods per factory class.
    private final ConcurrentMap<Class<?>, Method[]> factoryMethodCandidateCache = 
        new ConcurrentHashMap<>();

    //Cache of filtered PropertyDescriptors: bean Class to PropertyDescriptor array.
    private final ConcurrentMap<Class<?>, PropertyDescriptor[]> 
        filteredPropertyDescriptorsCache =
			new ConcurrentHashMap<>();
}
```

****

#### DefaultListableBeanFactory

````java
/**
 * 基于bean定义元数据的成熟bean工厂，可通过后处理器进行扩展。
 * 典型的用法是在访问bean之前先注册所有bean定义（可能是从bean定义文件中读取）。
 * 因此，按名称查找Bean是在本地Bean定义表中进行的廉价操作，用于对预解析的Bean定义元数据对象进行操作
 */
````

***

最后终于回到了**refreshBeanFactory**()方法

#####  loadBeanDefinitions

```java
protected void loadBeanDefinitions(DefaultListableBeanFactory beanFactory) 
    throws BeansException, IOException {
    
		// Create a new XmlBeanDefinitionReader for the given BeanFactory.
		XmlBeanDefinitionReader beanDefinitionReader = 
            new XmlBeanDefinitionReader(beanFactory);

		// Configure the bean definition reader with this context's
		// resource loading environment.
		beanDefinitionReader.setEnvironment(this.getEnvironment());
		beanDefinitionReader.setResourceLoader(this);
		beanDefinitionReader.setEntityResolver(new ResourceEntityResolver(this));

		// Allow a subclass to provide custom initialization of the reader,
		// then proceed with actually loading the bean definitions.
		initBeanDefinitionReader(beanDefinitionReader);
		loadBeanDefinitions(beanDefinitionReader);
}

--------------------------------------------------------------------------------------------
protected void loadBeanDefinitions(XmlBeanDefinitionReader reader) 
    throws BeansException, IOException {
    
    Resource[] configResources = getConfigResources();
    if (configResources != null) {
        reader.loadBeanDefinitions(configResources);
    }
    String[] configLocations = getConfigLocations();
    if (configLocations != null) {
        reader.loadBeanDefinitions(configLocations);
    }
}
------------------------------------------------------------------------------------------
@Override
public int loadBeanDefinitions(String... locations) throws BeanDefinitionStoreException {
    Assert.notNull(locations, "Location array must not be null");
    int count = 0;
    for (String location : locations) {
        count += loadBeanDefinitions(location);
    }
    return count;
}

@Override
public int loadBeanDefinitions(String location) throws BeanDefinitionStoreException {
    return loadBeanDefinitions(location, null);
}
------------------------------------------------------------------------------------------
public int loadBeanDefinitions(String location, @Nullable Set<Resource> actualResources) 
    throws BeanDefinitionStoreException {
    
    ResourceLoader resourceLoader = getResourceLoader();
    if (resourceLoader == null) {
        throw new BeanDefinitionStoreException(
            "Cannot load bean definitions from location [" + 
             	location + "]: no ResourceLoader available");
    }

    if (resourceLoader instanceof ResourcePatternResolver) {
        // Resource pattern matching available.
        try {
            Resource[] resources = 
                	   ((ResourcePatternResolver) resourceLoader).getResources(location);
            int count = loadBeanDefinitions(resources);
            if (actualResources != null) {
                Collections.addAll(actualResources, resources);
            }
            if (logger.isTraceEnabled()) {
                logger.trace("Loaded " + count + 
                             " bean definitions from location pattern [" + location + "]");
            }
            return count;
        }
        catch (IOException ex) {
            throw new BeanDefinitionStoreException(
                "Could not resolve bean definition resource pattern [" + location + "]", ex);
        }
    }
    else {
        // Can only load single resources by absolute URL.
        Resource resource = resourceLoader.getResource(location);
        int count = loadBeanDefinitions(resource);
        if (actualResources != null) {
            actualResources.add(resource);
        }
        if (logger.isTraceEnabled()) {
            logger.trace("Loaded " + count + 
                         " bean definitions from location [" + location + "]");
        }
        return count;
    }
}
```

