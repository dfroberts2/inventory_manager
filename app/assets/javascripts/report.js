$(document).ready(function(){
	$('.neg-pos-val').each(function(){
		if (parseFloat($(this).html()) < 0 ) {
			var val = $(this).html()
			debugger
			$(this).addClass("neg-val");
		}
	});
});