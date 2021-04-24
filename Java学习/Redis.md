### The Building Blocks 

**Databases**

> In Redis, databases are simply identified by a number with the default database being number 0.

- If you want to change to a different database you can do so via the select command.

**Commands, Keys and Values** 

> While Redis is more than just a key-value store, at its core, every one of Redis’ five data structures has at least a key and a value.

- **Keys** are how you identify pieces of data.
  - it’s good enough to know that a key might look like users:leto. 
  - The colon doesn’t have any special meaning
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



### The Data Structures

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

****

### 配置

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/mall?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai
    username: root
    password: 123456
  redis:
    host: localhost # Redis服务器地址
    database: 0 # Redis数据库索引（默认为0）
    port: 6379 # Redis服务器连接端口
    password: # Redis服务器连接密码（默认为空）
    jedis:
      pool:
        max-active: 8 # 连接池最大连接数（使用负值表示没有限制）
        max-wait: -1ms # 连接池最大阻塞等待时间（使用负值表示没有限制）
        max-idle: 8 # 连接池中的最大空闲连接
        min-idle: 0 # 连接池中的最小空闲连接
    timeout: 3000ms # 连接超时时间（毫秒）
    
# 自定义redis key
redis:
  key:
    prefix:
      authCode: "portal:authCode:"
    expire:
      authCode: 120 # 验证码超期时间
```

****

java中的使用

```java
/**
 * redis操作Service的实现类
 *
 * @author macro
 * @date 2018/8/7
 */
@Service
public class RedisServiceImpl implements RedisService {
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public void set(String key, String value) {
        stringRedisTemplate.opsForValue().set(key, value);
    }

    @Override
    public String get(String key) {
        return stringRedisTemplate.opsForValue().get(key);
    }

    @Override
    public boolean expire(String key, long expire) {
        return stringRedisTemplate.expire(key, expire, TimeUnit.SECONDS);
    }

    @Override
    public void remove(String key) {
        stringRedisTemplate.delete(key);
    }

    @Override
    public Long increment(String key, long delta) {
        return stringRedisTemplate.opsForValue().increment(key,delta);
    }
}

```

### StringRedisTemplate

- String-focused extension of RedisTemplate. 
- Since most operations against Redis are String based, this class provides a dedicated class that minimizes configuration of its more generic template especially in terms of serializers.

- Note that this template exposes the RedisConnection used by the RedisCallback as a StringRedisConnection.