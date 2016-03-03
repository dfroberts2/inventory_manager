$(document).ready(function(){
	if ($(".category").length) {
		if ($(".cat-rep-border").height() > $(".cat-scan-border").height())  {
			$(".cat-rep-border").css("border-left", "solid 2px #d8d8d8")
		} else {
			$(".cat-scan-border").css("border-right", "solid 2px #d8d8d8")
		}

		if ($(".upc-rep-border").height() > $(".upc-scan-border").height())  {
			$(".upc-rep-border").css("border-left", "solid 2px #d8d8d8")
		} else {
			$(".upc-scan-border").css("border-right", "solid 2px #d8d8d8")
		}
	}
})