linq.js
=====
Query data in linq-like syntax and select dom elements as well.

DEMO
```
// coffeescript
// query all div with id="2"
result=linq(document).where((e)->e.tagName.same("div") && e.id.same("2")).toArray()

// get last element larger then 15
// returns 33
list=[1,4,65,2,33,5]
linq(list).last((a)->a>15)

```



