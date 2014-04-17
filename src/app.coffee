
ret=document.getElementsByTagName("div")

.linq()
.where((e)->
	e.tagName.toLowerCase()=="div";
	)
.where((e,i)->e.tagName.toLowerCase()=="div" && i<2;)

console.log ret
