

var experience_count = 0;
var research_count = 0;
var reference_count = 0; 

 $(document).ready(function(){
	
	$("#materias_selector a").click(function() {
		$(this).toggleClass("selected");
		return false;
	});

		if ($("#editor").size() > 0) {
			window.onbeforeunload = function () {
				return "CUIDADO! ¿Estás segura de que quieres salir SIN GUARDAR? Pulsa CANCELAR si quieres conservar los cambios";
			}
	}
	
});
 
var submitForm = function() {
	window.onbeforeunload = null;
	var selectedString = "";
	$("#materias_selector a.selected").each(function() {
		selectedString += this.id;
	});
	$("#selected").val(selectedString);
	$("#editor").submit()
}

var addExperience = function() {
	addRow("experience", experience_count	++);
}

var addResearch = function () {
	addRow("research", research_count++); 
}

var addReference = function () {
	addRow("reference", reference_count++); 
}

var removeRow = function(rowId) {
	if (window.confirm("estas seguro/a de que quieres borrar esta fila de datos?")) {
		$("#" + rowId).remove();
	}
}

var addRow = function(bloc, count) {
	var name = bloc + count;
	
	row = '<tr id="' + name + '_row">';
	for (index = 1; index < 5; index++) {
	row += '<td><input type="text" name="value' + index +'[]" /></td>'
	}
	row += '<td><a href="javascript: removeRow(\'' + name + '_row\');"><img src="/images/list_remove.gif" /></a>';
	row += '<input type="hidden" name="etype[]" value="' + bloc + '" />';
	row += "</td></tr>"
	
	$("#" + bloc).append(row);
}



