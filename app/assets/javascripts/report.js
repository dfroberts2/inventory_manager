$(document).ready(function(){
	if ($('.neg-pos-val').length) {
		$('.neg-pos-val').each(function(){
			var stringAbsVal = Math.abs(parseFloat($(this).html())).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
			if (parseFloat($(this).html()) < 0 ) {
				$(this).parent().html("<span class='cost-sum neg-pos-val neg-val'>("+ stringAbsVal +")</span>")
			} else {
				$(this).parent().html("<span class='cost-sum neg-pos-val'>" + stringAbsVal + "</span")
			}
		});
	}
});