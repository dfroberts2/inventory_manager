class  CategoryItemsController < ApplicationController
	def create
		scanner = CategoryScanner.find(params[:category_scanner_id])
		item = scanner.category_items.new(item_params)
		item.category = Category.find_or_create_by(inventory: scanner.inventory, category_name: params[:category_item][:category])
		if item.save
			notice = "Item added successfully."
			render json: {category: item.category_name, quantity: item.quantity, retail: item.retail_price, id: item.id}.to_json if request.xhr?
		else
			notice = "Couldn't add item."
			render json: {notice: notice}.to_json
		end
		if !request.xhr?
			redirect_to edit_category_scanner_path(scanner), notice: notice
		end
	end

	def item_params
		params.require(:category_item).permit(:quantity, :retail_price)
	end
end