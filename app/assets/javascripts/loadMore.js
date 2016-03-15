$(document).ready(function(){
	$('.load-more-cat').click(function(event){
		event.preventDefault();
		var itemCount = $('.edit-group').length;
		var url = $("form[id=edit-scanner-form]")[0].action + '/load_edit_items';
		$.ajax({
			url: url,
			method: 'get',
			data: {itemCount: itemCount},
			dataType: 'json'
		}).then(function(response){
			response.items.forEach(function(item){
				var append = "<div class='row form-group edit-group'><div class='col-md-3 col-xs-3'><input class='form-control' type='text' value='" + item.category + "' name='category_scanner[category_items_attributes][" + itemCount + "][category_name]' id='category_scanner_category_items_attributes_" + itemCount + "_category_name' /></div><div class='col-md-3 col-xs-3'><input class='form-control' type='text' value='" + item.quantity + "' name='category_scanner[category_items_attributes][" + itemCount + "][quantity]' id='category_scanner_category_items_attributes_" + itemCount + "_quantity' /></div><div class='col-md-3 col-xs-3'><input class='form-control' type='text' value='" + item.retail + "' name='category_scanner[category_items_attributes][" + itemCount + "][retail_price]' id='category_scanner_category_items_attributes_" + itemCount + "_retail_price' /></div><div class='col-md-3 col-xs-3'><input name='category_scanner[category_items_attributes][" + itemCount + "][_destroy]' type='hidden' value='0' /><input type='checkbox' value='1' name='category_scanner[category_items_attributes][" + itemCount + "][_destroy]' id='category_scanner_category_items_attributes_" + itemCount + "__destroy' /><label for='category_scanner__destroy'>Delete Item?</label></div></div><input type='hidden' value='" + item.id + "' name='category_scanner[category_items_attributes][" + itemCount + "][id]' id='category_scanner_category_items_attributes_" + itemCount + "_id' />";
				$(append).insertBefore('.load-row');
				itemCount++;
				hideLoadButton(itemCount);
			})
		}).fail(function(response){
			console.log(response);
		})
	});

	$('.load-more-upc').click(function(event){
		event.preventDefault();
		var url = $("form[id=edit-scanner-form]")[0].action + '/load_edit_items';
		if ($(event.target).hasClass('load-mobile')) {
			var itemCount = $('.mobile-edit-group').length;
			$.ajax({
				url: url,
				method: 'get',
				data: {itemCount: itemCount},
				dataType: 'json'
			}).then(function(response){
				response.items.forEach(function(item){
					var append = "<div class='hidden-lg hidden-md mobile-edit-group'><div class='row form-group'><div class='col-xs-4'><p>" + item.upc + "</p></div><div class='col-xs-4'><p>" + item.brand +"</p></div><div class='col-xs-4'><p>"+ item.product_name + "</p></div></div><div class='row form-group update-item-bottom-row'><div class='col-xs-4'><input class='form-control' type='text' value='" + item.quantity + "' name='upc_scanner[upc_items_attributes][" + itemCount + "][quantity]' id='upc_scanner_upc_items_attributes_" + itemCount + "_quantity' /></div><div class='col-xs-4'><input class='form-control' type='text' value='" + item.retail_price + "' name='upc_scanner[upc_items_attributes][" + itemCount + "][retail_price]' id='upc_scanner_upc_items_attributes_" + itemCount + "_retail_price' /></div><div class='col-xs-4'><input name='upc_scanner[upc_items_attributes][" + itemCount + "][_destroy]' type='hidden' value='0' /><input type='checkbox' value='1' name='upc_scanner[upc_items_attributes][" + itemCount + "][_destroy]' id='upc_scanner_upc_items_attributes_" + itemCount + "__destroy' /><label for='upc_scanner__destroy'>Delete Item?</label></div></div></div><input type='hidden' value='" + item.id + "' name='upc_scanner[upc_items_attributes][" + itemCount + "][id]' id='upc_scanner_upc_items_attributes_" + itemCount + "_id' />";
					$(append).insertBefore($('.load-mobile').parent());
					itemCount++;
					hideLoadButton(itemCount);
				})
			}).fail(function(response){
				console.log(response);
			})
		} else {
			var itemCount = $('.desktop-edit-group').length;
			$.ajax({
				url: url,
				method: 'get',
				data: {itemCount: itemCount},
				dataType: 'json'
			}).then(function(response){
				response.items.forEach(function(item){
					var append = "<div class='hidden-xs desktop-edit-group'><div class='row form-group'><div class='col-md-2'><p>" + item.upc + "</p></div><div class='col-md-2'><p>" + item.brand +"</p></div><div class='col-md-2'><p>"+ item.product_name + "</p></div><div class='col-md-2'><input class='form-control' type='text' value='" + item.quantity + "' name='upc_scanner[upc_items_attributes][" + itemCount + "][quantity]' id='upc_scanner_upc_items_attributes_" + itemCount + "_quantity' /></div><div class='col-md-2'><input class='form-control' type='text' value='" + item.retail_price + "' name='upc_scanner[upc_items_attributes][" + itemCount + "][retail_price]' id='upc_scanner_upc_items_attributes_" + itemCount + "_retail_price' /></div><div class='col-md-2'><input name='upc_scanner[upc_items_attributes][" + itemCount + "][_destroy]' type='hidden' value='0' /><input type='checkbox' value='1' name='upc_scanner[upc_items_attributes][" + itemCount + "][_destroy]' id='upc_scanner_upc_items_attributes_" + itemCount + "__destroy' /><label for='upc_scanner__destroy'>Delete Item?</label></div></div></div><input type='hidden' value='" + item.id + "' name='upc_scanner[upc_items_attributes][" + itemCount + "][id]' id='upc_scanner_upc_items_attributes_" + itemCount + "_id' />";
					$(append).insertBefore($('.load-desktop').parent());
					itemCount++;
					hideLoadButton(itemCount);
				})
			}).fail(function(response){
				console.log(response);
			})
		}
	});
	function hideLoadButton(itemCount) {
		if (parseInt($('#scanner-count').html()) ==  itemCount) {
			$('.load-row').hide()
		}
	};
});