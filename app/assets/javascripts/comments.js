$(document).ready(function(){

	$('.view_full_comment').on('click', function(e){
	  var parent = $(this).parents('div.well');
	  parent.find("div.on").toggle();
	  parent.find("div.off").toggle();
	  e.preventDefault(); e.stopPropagation();
	});


});