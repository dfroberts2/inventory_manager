$(document).ready(function(){
	$(".owner-select").change(function(event){
		var ownerId = $(".owner-select option:selected").val()
		var url = "owners/" + ownerId + "/businesses"
		$.get(url, function(response){
		}).then(function(response){
			$(".business-links").html(response)
			$('.new-business-button').click(function(event) {
				event.preventDefault();
				$('.new-business-form').toggle();
			});
		}).fail(function(response){
			console.log("fail" + response)
		})
	});

	$(".year-select").change(function(event){
		var year = $(".year-select option:selected").val()
		var url = document.URL + "/inventories/" + year
		$.get(url, function(response){
		}).then(function(response){
			$(".inventory-links").html(response)
		}).fail(function(response){
			console.log("fail" + response)
		})
	});
});