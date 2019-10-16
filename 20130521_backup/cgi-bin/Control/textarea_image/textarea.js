// HTML 
// <TEXTAREA name="areaName" id="areaName" onfocus="get_pos(this.name);" onmouseup="get_pos(this.name);" onkeyup="get_pos(this.name);"></TEXTAREA>
// <SCRIPT type="JavaScript" src="textarea.js"></SCRIPT>
// 
var sel_length, end_length = 0, start_length = 0;
var bl = 0;
var el = null;
if (String("jadge")) {
    bl = 3;
}
else if (document.getElementById) {
    bl = 4;
}
var isGecko = false;
if (navigator) {
    if (navigator.userAgent) {
        if (navigator.userAgent.indexOf("Gecko/") !=  - 1) {
            isGecko = true;
        }
    }
}
// if( document.getElementById("cmd").setSelectionRange ){
//   bl=2;
// } else if( document.selection.createRange ){
//   bl=1;
// }
function get_pos(d) {
    if (d)el = d;
    var ret = 0;
    if (bl == 3) {
        var ln = new String(d.value);
        start_length = ln.length;
        end_length = start_length;
        sel_length = 0;
    }
    //alert("s=[" + start_length + "], l=[" + sel_length + "], e=[" + end_length + "]");
}

function tag(v) {
    if (!document.selection)return;
    var str = document.selection.createRange().text;
    if (!str)return;
    if (v == 'F') {
        document.selection.createRange().text = '<FONT COLOR="#">' + str + '</FONT>';
    }
    else  {
        document.selection.createRange().text = '<' + v + '>' + str + '</' + v + '>';
    }
}
function tag_size(v) {
    if (!document.selection)return;
    var str = document.selection.createRange().text;
    if (!str)return;
    document.selection.createRange().text = '<FONT SIZE="' + v + '">' + str + '</FONT>';
}
function linkPrompt() {
    if (!document.selection)return;
    var str = document.selection.createRange().text;
    if (!str)return;
    var default_url = "http://";
    regex = "^s?https?://[-_.!~*'()a-zA-Z0-9;/?:\@&=+$,\%#\]+\$";
    var cbText = clipboardData.getData("Text");
    if (cbText && cbText.match(regex))default_url = cbText;
    var my_link = prompt('URL: ', default_url);
    if (my_link != null)document.selection.createRange().text = '<a href="' + my_link + '" target="_blank">' + str + '</a>';
}
function increaseNotesHeight(thisTextarea, add) {
    if (thisTextarea) {
        newHeight = parseInt(thisTextarea.style.height) + add;
        thisTextarea.style.height = newHeight + "px";
    }
}
function decreaseNotesHeight(thisTextarea, subtract) {
    if (thisTextarea) {
        if ((parseInt(thisTextarea.style.height) - subtract) > 30) {
            newHeight = parseInt(thisTextarea.style.height) - subtract;
            thisTextarea.style.height = newHeight + "px";
        }
        else  {
            newHeight = 30;
            thisTextarea.style.height = "30px";
        }
    }
}
function insertStr(e, str) {
    if (document.selection) {
        e.focus();
        var r = document.selection.createRange();
        r.text = str;
        e.focus();
    }
    else if (isGecko) {
        var start = e.selectionStart;
        var head = e.value.substring(0, start);
        var foot = e.value.substring(start, e.textLength);
        e.value = head + str + foot;
    }
    else  {
        e.value = e.value + str;
    }
}

function insertbr(e) {
var code = event.keyCode;
    if (code == 13) {
        insertStr(e,'<BR>');
    }
}

