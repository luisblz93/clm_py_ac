$(document).ready(function(){

	$('#geocomplete').geocomplete({
	map: ".map_canvas",
	details: "form ul",
	detailsAttribute: "data-geo"
	});

	/*$("#find").click(function(){
		$("#geocomplete").trigger("geocode");
	});*/
});