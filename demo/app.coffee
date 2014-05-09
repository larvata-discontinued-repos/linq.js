
ret=linq(document)
.where((e)->e.tagName.same("div")).where((e,i)->e.id.same("2")).toArray()

console.log ret

ret= linq([1,4,65,2,33,5]).last((a)->a>15)

console.log ret

