/*------------------------------------- 
スマホTEL
-------------------------------------*/
$(function(){
	'use strict';
        $('.tel-link').each(function(){
            var str = $(this).text();
            $(this).html($('<a>').attr('href', 'tel:' + str.replace(/-/g, '')).append(str + '</a>'));
        });
         $('.tel-img img').each(function(){
            var alt = $(this).attr('alt');
            $(this).wrap($('<a>').attr('href', 'tel:' + alt.replace(/-/g, '')));
        });
});

/*------------------------------------- 
slidebars
-------------------------------------*/
(function($) {
	'use strict';
	$(document).ready(function() {
		$.slidebars();
	});
}) (jQuery);

/*------------------------------------- 
smoothScroll
-------------------------------------*/

/**
* smoothScrollEx Plugin ver1.1
*
* 2015 Jun Sato http://creator-index.com/
*
* MIT-style license.
*
*/

;(function($) {
	$(window).load(function(){
			
		var options = $.extend({
			
			scrollSpeed: 1000,
			easing: 'swing',
			adjustment:-20,
			delayTime: 200
			
			},options);
				
		$('[href*=#]').click(function(event){
			var element = $(this);
			var elementHref = element.attr('href');
			
			
			if(elementHref.search(/^#.+/) === 0){
			
				var targetId = elementHref;
				var targetY = $(targetId).offset().top + options.adjustment;
				event.preventDefault();
				$('html,body').animate({scrollTop: targetY},options.scrollSpeed,options.easing);
			
			}else {
	
				var hrefSplit = elementHref.split(/#/);
				var hrefFirst = hrefSplit[0];
				var hrefLast = '#' + hrefSplit[1];

				var pathname = location.pathname;
				var pathnameSplit = pathname.split(/\//);				
				var pathnameLast = pathnameSplit[pathnameSplit.length - 1];
				
				var hostname = location.hostname;
			
				function aHrefCheck(){ 
				 
					var check1 = hrefFirst.match(/https?:\/\/.[^\/]+\//);
					if(check1 === null){
						return true;
					}else{
						var check2 = check1[0].indexOf(hostname);
						if (check2 != -1){
							return true;
						}else{
							return false;
						}
					}
				}			
		
				function aHrefChange(){
					if (hrefFirst.indexOf(hostname) !== -1 || hrefFirst.indexOf(pathnameLast) === -1){
						hrefLast = hrefLast.replace('#','?id=');			
						elementHref = hrefFirst + hrefLast;
						element.attr('href',elementHref);			
					}else{
						return;
					}
				}
				
				if(aHrefCheck() === true){
					aHrefChange();
				}else{

					return;
				}		
			}
		});
				
		var url = $(location).attr('href');
		var stringMatch = url.indexOf('?id=');
		
		if(stringMatch === -1){
			return;
		}else {
			var urlSplit = url.split(/\?id=/);
			var anchorLink = '#' + urlSplit[urlSplit.length -1];
			var anchorLinkTop = $(anchorLink).offset().top + options.adjustment;
			
			$('html,body').delay(options.delayTime).animate({scrollTop: anchorLinkTop},options.scrollSpeed,options.easing);
			
		}

	return this;
	
	});
		
})(jQuery);

/*------------------------------------- 
inlineNav
-------------------------------------*/
$(function() {
	'use strict';
   var innav = $('.outline .inlineNav');
   var container = $('.outline .container');
   var innavHeight = innav.height();
   innav.css('top', -innavHeight+'px');
   $(window).scroll(function () {
      if ($(this).scrollTop() > 600) {
			innav.addClass('fixed');
			container.addClass('fixed');
			innav.not(':animated').animate({'top' : '0px'}, 200);
      } else {
			innav.removeClass('fixed');
			container.removeClass('fixed');
			innav.not(':animated').animate({'top' : -innavHeight+'px'}, 200);
      }
   });
});

/*-------------------------------------
gnav
-------------------------------------*/
$(document).ready(function(){
	'use strict';
    var ua = navigator.userAgent;
	var rowWidth = 0;
	function megaHoverOver(){
		$(this).find(".subNav").stop().fadeTo('fast', 1 , function(){ this.style.removeAttribute("filter"); }).show();
		(function($) {
			jQuery.fn.calcSubWidth = function() {
				$(this).find("ul").each(function() {
					rowWidth  = $(this).width();
				});
			};
		})(jQuery);
		if ( $(this).find(".row").length > 0 ) {
			var biggestRow = 0;
			$(this).find(".row").each(function() {
				$(this).calcSubWidth();
				if(rowWidth > biggestRow) {
					biggestRow = rowWidth;
				}
			});
			$(this).find(".subNav").css({'width' :biggestRow});
			$(this).find(".row:last").css({'margin':'0'});
		} else {
			$(this).calcSubWidth();
			$(this).find(".sub").css({'width' : rowWidth});
		}
	}
	function megaHoverOut(){
		$(this).find(".subNav").stop().fadeTo('fast', 0, function() {
			$(this).hide();  //after fading, hide it
		});
	}
	var config = {
		sensitivity: 2,
		interval: 30,
		over: megaHoverOver,
		timeout: 100,
		out: megaHoverOut
	};
	if(!(ua.indexOf('iPhone') > 0 || ua.indexOf('iPod') > 0 || ua.indexOf('Android') > 0 && ua.indexOf('Mobile') > 0)){
		$("ul.gNav li div.subNav").css({'opacity':'0'});
		$("ul.gNav li").hoverIntent(config);
	}
});

/*------------------------------------- 
slider
-------------------------------------*/
$(document).ready(function(){
	'use strict';
	$('.garelly .slider').bxSlider({
		auto: true,
		pause: 6000,
		speed: 800,
		pagerCustom: '.garelly .pager',
		controls: false
	});

});

/*------------------------------------- 
matchHeight
-------------------------------------*/
$(document).ready(function(){
	'use strict';
	$('div.ichioshi div.item').matchHeight();
});


