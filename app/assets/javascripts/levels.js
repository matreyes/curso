
$(document).ready(function(){

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