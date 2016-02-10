$(document).ready(function(){
	$(".owner-select").change(function(event){
		var ownerId = $(".owner-select option:selected").val()
		var url = "owners/" + ownerId + "/businesses"
		$.get(url, function(response){
		}).then(function(response){
			$(".business-links").html(response)
		}).fail(function(response){
			console.log("fail" + response)
		})
	});
});