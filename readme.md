linq.js
=====
Query data in linq-like syntax and select dom elements as well.

DEMO
```
// coffeescript
// query all div with id="2"
result=linq(document).where((e)->e.tagName.same("div") && e.id.same("2")).toArray()

```



