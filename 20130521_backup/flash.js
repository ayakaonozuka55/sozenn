// JavaScript Document
// embed.js

var MM_contentVersion = 6;
var plugin = (navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"]) ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
if ( plugin ) {
		var words = navigator.plugins["Shockwave Flash"].description.split(" ");
	    for (var i = 0; i < words.length; ++i)
	    {
		if (isNaN(parseInt(words[i])))
		continue;
		var MM_PluginVersion = words[i]; 
	    }
	var MM_FlashCanPlay = MM_PluginVersion >= MM_contentVersion;
}
else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0 
   && (navigator.appVersion.indexOf("Win") != -1)) {
	document.write('<SCR' + 'IPT LANGUAGE=VBScript\> \n'); //FS hide this from IE4.5 Mac by splitting the tag
	document.write('on error resume next \n');
	document.write('MM_FlashCanPlay = ( IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash." & MM_contentVersion)))\n');
	document.write('</SCR' + 'IPT\> \n');
}
if ( MM_FlashCanPlay ) {
	document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"');
	document.write('  codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0"');
	document.write('  width="750" height="333" id="flash" align="middle">');
	document.write(' <param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="img_top/flash.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />'); 
	document.write(' <embed src="img_top/flash.swf" quality="high" bgcolor="#ffffff" width="750" height="333" name="flash" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
	document.write(' </object>');
} else{
	document.write('<img src="img_top/mainimg.jpg" width="738" height="200" alt="Happy Scenery" border="0">');
	}
