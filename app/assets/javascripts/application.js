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

	if ($('#answer_answer').length != 0){
		var num = $('#answer_answer').val().length;
		var min = 140;
		var max = 1500;
		var i = max-num;
	
		count(i,num,min);
	}
	
	$('#answer_answer').keydown(function(e){
		var num = $('#answer_answer').val().length;
		var min = 140;
		var max = 1500;
		var i = max-num;
		count(i,num,min);
		if(i <= 0 && e.keyCode != 8){
			return false;
		}	
	});
	
	
	function count(i,num,min){
		$('#count').html(i);
		if(num < min){
	 		$('#answer_answer').parents("form").find("input[type=submit]").addClass('disabled').attr("disabled", true);
			$('#countalert').show();
		} else {
			$('#answer_answer').parents("form").find("input[type=submit]").removeClass('disabled').attr("disabled", false);
			$('#countalert').hide();
		}
		if(i <= 0){
			$('#count').css('color', 'red');
		} else {
			$('#count').css('color', 'black');
		}
	}

});

