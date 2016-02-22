class  CategoryItemsController < ApplicationController
	def create
		scanner = CategoryScanner.find(params[:category_scanner_id])
		item = scanner.category_items.new(item_params)
		item.category = Category.find_or_create_by(inventory: scanner.inventory, category_name: params[:category_item][:category])
		if item.save
			redirect_to edit_category_scanner_path(scanner), notice: "Item added successfully."
		else
			redirect_to edit_category_scanner_path(scanner), notice: "Couldn't add item."
		end
	end

	def item_params
		params.require(:category_item).permit(:quantity, :retail_price)
	end
end