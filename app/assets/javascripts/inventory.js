$(document).ready(function(){
	if ($(".category").length) {
		if ($(".reports").height() > $(".scanner").height())  {
			$(".reports").css("border-left", "solid 2px #d8d8d8")
		} else {
			$(".scanner").css("border-right", "solid 2px #d8d8d8")
		}
	}
})