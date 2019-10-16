    var oldFixPng = DD_belatedPNG.fixPng;
    DD_belatedPNG.fixPng = function (el) {
        oldFixPng(el);
        if (el.vml && el.vml.image.fill.getAttribute("src").match(/_off\./)) {
            el.vml.image.shape.attachEvent('onmouseenter', function() {
                var image = el.vml.image.fill;
                image.setAttribute("src", image.getAttribute("src").replace("_off.", "_on."));
            });
            el.vml.image.shape.attachEvent('onmouseleave', function() {
                var image = el.vml.image.fill;
                image.setAttribute("src", image.getAttribute("src").replace("_on.", "_off."));
            });
        }
    };
    DD_belatedPNG.fix('img');