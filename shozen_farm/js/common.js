/*------------------------------------- 
 header
 -------------------------------------*/
$(function () {
	$(window).on('load scroll', function(){
		if ($(window).scrollTop() > 50) {
			$('.header').addClass('fixed');
		} else {
			$('.header').removeClass('fixed');
		}
	});
});


/*------------------------------------- 
 nav
 -------------------------------------*/
$(function() {
    $('#navToggle').click(function(){//headerÇ… .openNav Çïtâ¡ÅEçÌèú
        $('header').toggleClass('openNav');
    });
});

/*------------------------------------- 
 SpTelLink
 -------------------------------------*/
var SpTelLink = (function () {
	function SpTelLink() {
		$('.tel-link').each(function () {
			var str = $(this).text();
			$(this).html($('<a>').attr('href', 'tel:' + str.replace(/-/g, '')).append(str + '</a>'));
		});
		$('.tel-img img').each(function () {
			var alt = $(this).attr('alt');
			$(this).wrap($('<a>').attr('href', 'tel:' + alt.replace(/-/g, '')));
		});
	}
	return SpTelLink;
})();

/*------------------------------------- 
 Pagetop
 -------------------------------------*/
$(function () {
	var topBtn = $('.pagetop a');
	topBtn.click(function () {
		$("html, body").animate({
			scrollTop: 0
		}, 800, "swing");
		return false;
	});
});

/*------------------------------------- 
 SmoothScroll
 -------------------------------------*/
$(function () {
	function SmoothScroll(heightnum) {
		var headerHight = heightnum;
		$("a.anchorlink").click(function () {
			var href = $(this).attr("href");
			var target = $(href == "#" || href == "" ? "body" : href);
			var position = target.offset().top - headerHight;
			$("html, body").animate({
				scrollTop: position
			}, 800, "swing");
		});
		var url = $(location).attr("href");
		if (url.indexOf("?id=") == -1) {} else {
			var url_sp = url.split("?id=");
			var hash = "#" + url_sp[url_sp.length - 1];
			var target2 = $(hash);
			var position2 = target2.offset().top - headerHight;
			$("html, body").animate({
				scrollTop: position2
			}, 800, "swing");
		}
	}
	if ($("body").hasClass("spn")) {
		SmoothScroll(50);
	} else {
		SmoothScroll(0);
	}
});






