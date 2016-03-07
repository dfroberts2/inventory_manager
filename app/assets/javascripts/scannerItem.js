$(document).ready(function(){
	$(".new-cat-item-mobile").submit(function(event){
		var itemCount = $('.edit-group').length;
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
				var append = "<div class='row form-group edit-group'><div class='col-md-3 col-xs-3'><input class='form-control' type='text' value='" + response.category + "' name='category_scanner[category_items_attributes][" + itemCount + "][category_name]' id='category_scanner_category_items_attributes_" + itemCount + "_category_name' /></div><div class='col-md-3 col-xs-3'><input class='form-control' type='text' value='" + response.quantity + "' name='category_scanner[category_items_attributes][" + itemCount + "][quantity]' id='category_scanner_category_items_attributes_" + itemCount + "_quantity' /></div><div class='col-md-3 col-xs-3'><input class='form-control' type='text' value='" + response.retail + "' name='category_scanner[category_items_attributes][" + itemCount + "][retail_price]' id='category_scanner_category_items_attributes_" + itemCount + "_retail_price' /></div><div class='col-md-3 col-xs-3'><input name='category_scanner[category_items_attributes][" + itemCount + "][_destroy]' type='hidden' value='0' /><input type='checkbox' value='1' name='category_scanner[category_items_attributes][" + itemCount + "][_destroy]' id='category_scanner_category_items_attributes_" + itemCount + "__destroy' /><label for='category_scanner__destroy'>Delete Item?</label></div></div><input type='hidden' value='" + response.id + "' name='category_scanner[category_items_attributes][" + itemCount + "][id]' id='category_scanner_category_items_attributes_" + itemCount + "_id' />";
				$(append).insertAfter(".edit_category_scanner input[name=authenticity_token]");
				$(".clearable").each(function(){
					$(this).val("")
				});
			}
		}).fail(function(response){
			console.log("fail: " + response)
		})
	});

	$(".new-upc-item-mobile").submit(function(event){
		var itemCount = $('.edit-group').length;
		event.preventDefault();
		$.ajax({
			url: event.target.action,
			method: event.target.method,
			data: {upc_item: {
				upc: $(".upc-input").val(),
				quantity: $(".upc-item-quantity").val(),
				retail_price: $(".upc-item-retail").val(),
			}},
			dataType: 'json'
		}).then(function(response){
			if (response.notice != undefined){
				$("#flash-container").html(response.notice);
			} else {
				var append = "<div class='hidden-lg hidden-md edit-group'><div class='row form-group'><div class='col-xs-4'><p>" + response.upc + "</p></div><div class='col-xs-4'><p>" + response.brand +"</p></div><div class='col-xs-4'><p>"+ response.product_name + "</p></div></div><div class='row form-group update-item-bottom-row'><div class='col-xs-4'><input class='form-control' type='text' value='" + response.quantity + "' name='upc_scanner[upc_items_attributes][" + itemCount + "][quantity]' id='upc_scanner_upc_items_attributes_" + itemCount + "_quantity' /></div><div class='col-xs-4'><input class='form-control' type='text' value='" + response.retail_price + "' name='upc_scanner[upc_items_attributes][" + itemCount + "][retail_price]' id='upc_scanner_upc_items_attributes_" + itemCount + "_retail_price' /></div><div class='col-xs-4'><input name='upc_scanner[upc_items_attributes][" + itemCount + "][_destroy]' type='hidden' value='0' /><input type='checkbox' value='1' name='upc_scanner[upc_items_attributes][" + itemCount + "][_destroy]' id='upc_scanner_upc_items_attributes_" + itemCount + "__destroy' /><label for='upc_scanner__destroy'>Delete Item?</label></div></div></div><input type='hidden' value='" + response.id + "' name='upc_scanner[upc_items_attributes][" + itemCount + "][id]' id='upc_scanner_upc_items_attributes_" + itemCount + "_id' />";
				$(append).insertAfter(".edit_upc_scanner input[name=authenticity_token]");
				$(".clearable").each(function(){
					$(this).val("")
				});
			}
		}).fail(function(response){
			console.log("fail: " + response)
		})
	});
})