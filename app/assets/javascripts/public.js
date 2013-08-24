function clear_text_area(cm){
	if(cm){
		var line_number = cm.lineCount - 1;
		cm.eachLine(function(i){
			cm.removeLine(line_number);
			line_number--;
		})
	}
}