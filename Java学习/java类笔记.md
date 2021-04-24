### Properties









### StringUtility





### DefaultCommentGenerator





### Jwts



### Reference







### Stream

```java
public class Stream {
    public static void main(String[] args) {
        List<String> strings = Arrays.asList("abc", "", "bc", "efg", "abcd","", "jkl");
        List<String> filter = strings.stream().
                filter(string -> !string.isEmpty())
                .sorted(Comparator.reverseOrder())
                .collect(Collectors.toList());
        System.out.println(filter);
    }
}
```

**filter**

```java
//Returns a stream consisting of the elements of this stream that match the given predicate.
Stream<T> filter(Predicate<? super T> predicate);
```

**map**

```java
//Returns a stream consisting of the results of applying the given function to the elements of this stream.
List<String> strings = Arrays.asList("abc", "", "bc", "efg", "abcd","", "jkl");
        List<String> list = new ArrayList<>();
        list = strings.stream()
            .map(s -> {
                    if (!s.isEmpty())
                        return s.toUpperCase(Locale.ROOT);
                    return "null";
                })
                .sorted(Comparator.reverseOrder())
                .toList();
```

