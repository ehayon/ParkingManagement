$(document).ready(function() {
	
	_.delay(function() {
		$(document).find('.flash').slideUp('fast');
	}, 1500);

	$(document).on("click", ".flash", function() {
		$(this).slideUp('fast');
	});

});

