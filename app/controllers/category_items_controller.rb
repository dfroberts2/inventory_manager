class  CategoryItemsController < ApplicationController
	def create
		scanner = CategoryScanner.find(params[:category_scanner_id])
		item = scanner.category_items.new(item_params)
		if item.save
			redirect_to edit_category_scanner_path(scanner), notice: "Item added successfully."
		else
			redirect_to edit_category_scanner_path(scanner), notice: "Couldn't add item."
		end
	end

	def item_params
		params.require(:category_item).permit(:category, :quantity, :retail_price, :cost, :margin)
	end
end