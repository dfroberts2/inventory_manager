$(document).ready(function(){
	$(".new-cat-item-mobile").submit(function(event){
		event.preventDefault();
		$.ajax({
			url: event.target.action,
			method: event.target.method,
			data: {category_item: {
				category: $(".cat-item-cat").val(),
				quantity: $(".cat-item-quantity").val(),
				retail_price: $(".cat-item-retail").val(),
			}},
			dataType: 'json'
		}).then(function(response){
			if (response.notice != undefined){
				$("#flash-container").html(response.notice);
			} else {
				var append = "<div class='row form-group'><div class='col-md-3 col-xs-3'><input class='form-control' type='text' value='" + response.category + "' name='category_scanner[category_items_attributes][0][category_name]' id='category_scanner_category_items_attributes_0_category_name' /></div><div class='col-md-3 col-xs-3'><input class='form-control' type='text' value='" + response.quantity + "' name='category_scanner[category_items_attributes][0][quantity]' id='category_scanner_category_items_attributes_0_quantity' /></div><div class='col-md-3 col-xs-3'><input class='form-control' type='text' value='" + response.retail + "' name='category_scanner[category_items_attributes][0][retail_price]' id='category_scanner_category_items_attributes_0_retail_price' /></div><div class='col-md-3 col-xs-3'><input name='category_scanner[category_items_attributes][0][_destroy]' type='hidden' value='0' /><input type='checkbox' value='1' name='category_scanner[category_items_attributes][0][_destroy]' id='category_scanner_category_items_attributes_0__destroy' /><label for='category_scanner__destroy'>Delete Item?</label></div></div><input type='hidden' value='" + response.id + "' name='category_scanner[category_items_attributes][0][id]' id='category_scanner_category_items_attributes_0_id' />";
				$(append).insertAfter(".edit_category_scanner input[name=authenticity_token]");
				$(".clearable").each(function(){
					$(this).val("")
				});
			}
		}).fail(function(response){
			console.log("fail: " + response)
		})
	});
})