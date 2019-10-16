/*------------------------------------- 
tools
-------------------------------------*/
$(function() {
$("#branding").tabs("#branding > div", {  
        effect: 'fade',  
        fadeInSpeed: "slow", 
        rotate: true,
		current: "active"
    }).slideshow({
		autoplay: true,
		interval:5000,
		clickable: false
		}); 
});

/*------------------------------------- 
Rollover
-------------------------------------*/
function smartRollover() {
	if(document.getElementsByTagName) {
		var images = document.getElementsByTagName("img");

		for(var i=0; i < images.length; i++) {
			if(images[i].getAttribute("src").match("_off."))
			{
				images[i].onmouseover = function() {
					this.setAttribute("src", this.getAttribute("src").replace("_off.", "_on."));
				}
				images[i].onmouseout = function() {
					this.setAttribute("src", this.getAttribute("src").replace("_on.", "_off."));
				}
			}
		}
	}
}

if(window.addEventListener) {
	window.addEventListener("load", smartRollover, false);
}
else if(window.attachEvent) {
	window.attachEvent("onload", smartRollover);
}

/*------------------------------------- 
lightbox
-------------------------------------*/
$(document).ready(function() {
	$('a[rel*=lightbox]').lightBox();
});



