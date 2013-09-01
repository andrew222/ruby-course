function create_cookie(name, value, days){
	var date, expires;
	if(days){
		date = new Date();
		date.setTime(date.getTime() + (days*24*60*60*1000));
		expires = "; expires=" + date.toGMTString();
	}else{
		expires = ""
	}
	document.cookie = name +"=" + value + expires + "; path=/"
}

function read_cookie(name){
	var cookie, cookies;
	cookies = document.cookie.split(";");
	for(var i = 0; i < cookies.length; i++ ){
		cookie = cookies[i].trim().split("=");
		if(cookie[0] == name){
			return cookie[1];
		}
	}
	return "";
}

$(document).ready(function(){
	var popup_options = {
	  id: "shortcut_keys_tips",
	  steps: [
	    {
	      title: "Shortcut Keys",
	      content: "Alt-L: Clear the textarea<br />Ctrl-Z: Undo<br />Ctrl-Shift-Z: Redo<br />Arrow Down: Next command<br />Arrow UP: Previous command",
	      target: $(".shortcut_keys_tips")[0],
	      placement: "top",
	      xOffset: "-270",
	      arrowOffset: "270"
	    }
	  ]
	};
	$(".shortcut_keys_tips").bind("click", function(){
		hopscotch.startTour(popup_options);
	})
})