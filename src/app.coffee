
ret=document.getElementsByTagName("div").linq().where((e)->
	return e.tagName.toLowerCase()=="div";
	)

console.log ret

ret=document.getElementsByTagName("div").linq().where((e,i)->

	return e.tagName.toLowerCase()=="div" && i<2;
	)

console.log ret
