// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){
	$("body").click(function(){
		$("#flash_messages").fadeOut();
	});
	$('.view_full_comment').on('click', function(e){
	  var parent = $(this).parents('div.well');
	  parent.find("div.on").toggle();
	  parent.find("div.off").toggle();
	  e.preventDefault(); e.stopPropagation();
	});
	if($('#answer_answer').val().length < 200){
		$('#answer_answer').parents("form").find("input[type=submit]").addClass('disabled');
	}
	$('#answer_answer').keyup(function(e){
		if($('#answer_answer').val().length > 200){
			$(this).parents("form").find("input[type=submit]").removeClass('disabled');
		}
		if($('#answer_answer').val().length < 200){
			$(this).parents("form").find("input[type=submit]").addClass('disabled');
		}
		var cl = 2000 - $(this).val().length;
		$(this).parents("form").find("span").html(cl + " caracteres");
		if(cl <= 0){
			$(this).parents("form").find("span").css('color', 'red');
		} else {
			$(this).parents("form").find("span").css('color', 'black');
		}
	});
	$('#answer_answer').keydown(function(e){
		var cl = 2000 - $(this).val().length;
		if(cl <= 0){
			if(e.keyCode != 8)
				return false;
		}
	});

});

