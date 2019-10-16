<!--
var ie=document.all
var dom=document.getElementById
var ns4=document.layers
var calunits=document.layers? "" : "px"

var bouncelimit=32
var direction="up"

function drop(){
if (!dom&&!ie&&!ns4)
return
crossobj=(dom)?document.getElementById("sinks").style : ie? document.all.sinks : document.sinks
scroll_top=(ie)? body().scrollTop : window.pageYOffset
crossobj.top=scroll_top-150+calunits
crossobj.visibility=(dom||ie)? "visible" : "show"
dropstart=setInterval("sinks()",50)
}

function sinks(){
scroll_top=(ie)? body().scrollTop : window.pageYOffset
if (parseInt(crossobj.top)<50+scroll_top)
crossobj.top=parseInt(crossobj.top)+40+calunits
else{
clearInterval(dropstart)
bouncestart=setInterval("bound()",50)
}
}

function bound(){
crossobj.top=parseInt(crossobj.top)-bouncelimit+calunits
if (bouncelimit<0)
bouncelimit+=8
bouncelimit=bouncelimit*-1
if (bouncelimit==0){
clearInterval(bouncestart)
}
}

function closs(){
if (window.bouncestart) clearInterval(bouncestart)
crossobj.visibility="hidden"
}



function nobu(){

bouncelimit=32
direction="up"
drop()

}

function body(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

window.onload=drop
// -->