// Generated by CoffeeScript 1.6.3
var ret;

ret = linq(document).where(function(e) {
  return e.tagName.same("div");
}).where(function(e, i) {
  return e.id.same("2");
}).toArray();

console.log(ret);

ret = linq([1, 4, 65, 2, 33, 5]).last(function(a) {
  return a > 15;
});

console.log(ret);

//# sourceMappingURL=app.map
