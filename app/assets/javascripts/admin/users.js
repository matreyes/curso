$(document).ready(function(){

  $('#mail-modal').modal({
    keyboard: true
  });

  $('a.send_email').click(function(e){
    $('#mail-modal').modal('show');
    $('#subject').focus();
    e.preventDefault(); e.stopPropagation();
  });
	
});