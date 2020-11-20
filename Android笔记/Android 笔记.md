# Android 笔记

### 打印日志

![image-20201031170331720](C:\Users\13793\Desktop\学习笔记\Android笔记\image-20201031170331720.png)

```java
protected void onCreate (Bundle savedInstanceState) {
    super.onCreate (savedInstanceState);
    setContentView(R.layout.hello_world_layout);
    Log.d( "HelloWorldActivity", "onCreate execute");
}
```

Log.d()方法中传入了两个参数:第-一个参数是tag, 一般传人当前的类名就好，主要用于对打印信息进行过滤;第二个参数是msg，即想要打印的具体的内容。



***

### 使用Intent在活动间穿梭

































### 活动生命周期

![image-20201031165700376](C:\Users\13793\Desktop\学习笔记\Android笔记\image-20201031165700376.png)

![image-20201031165640920](C:\Users\13793\Desktop\学习笔记\Android笔记\image-20201031165640920.png)

***

**活动被回收**

- onSaveInstanceState()方法会携带-个Bundle类型的参数，Bundle 提供了一系列的方法用于保存数据，比如可以使用putString()方法保存字符串，使用putInt ()方法保存整型数据，以此类推。每个保存方法需要传入两个参数,第一个参数是键，用于后面从Bundle中取值，第二个参数是真正要保存的内容。在MainActivity中添加如下代码就可以将临时数据进行保存:

```java
@Override
protected void onSaveInstanceState(Bundle outState) {
    super.onSaveInstanceState(outState) ;
    String tempData = "Something you just typed" ;
    outState.putString("data_ key", tempData) ;
}
```

如果在活动被系统回收之前有通过onSaveInstanceState( )方法来保存数据的话,这个参数就会带有之前所保存的全部数据，我们只需要再通过相应的取值方法将数据取出即可。修改MainActivity的onCreate()方法，如下所示:

```java
@0verride
protected void onCreate (Bundle savedInstanceState) {
    super.onCreate (savedInstanceState);
    Log.d(TAG, "onCreate");
    setContentView(R.layout.activity_main);
    if (savedInstanceState != null) {
        String tempData = savedInstanceState.getString ("data_key");
        Log.d (TAG, tempData);
    }
    ···
}
```

***

### 活动的启动模式

