class  UpcItemsController < ApplicationController
	def create
		scanner = UpcScanner.find(params[:upc_scanner_id])
		item = scanner.upc_items.new(item_params)
		item.brand = Brand.find_or_create_by(inventory: scanner.inventory, brand_name: Brand.match_upc_to_gcp(params[:upc_item][:upc]))
		item.product_name = UpcItem.match_upc_to_item(params[:upc_item][:upc])
		if item.save
			redirect_to edit_upc_scanner_path(scanner), notice: "Item added successfully."
		else
			redirect_to edit_upc_scanner_path(scanner), notice: "Couldn't add item."
		end
	end

	def item_params
		params.require(:upc_item).permit(:upc, :quantity, :retail_price)
	end
end