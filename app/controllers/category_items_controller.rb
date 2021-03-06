class  CategoryItemsController < ApplicationController
	def create
		scanner = CategoryScanner.find(params[:category_scanner_id])
		item = scanner.category_items.new(item_params)
		item.category = Category.find_or_create_by(inventory: scanner.inventory, category_name: params[:category_item][:category])
		if item.save
			notice = "Item added successfully."
			if !request.xhr?
				redirect_to edit_category_scanner_path(scanner), notice: notice
			else
				render json: item.json_cat_item.to_json if request.xhr?
			end
		else
			notice = "Couldn't add item."
			if !request.xhr?
				redirect_to edit_category_scanner_path(scanner), notice: notice
			else
				render json: {notice: notice}.to_json
			end
		end
	end

	def item_params
		params.require(:category_item).permit(:quantity, :retail_price)
	end
end