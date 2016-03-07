class  UpcItemsController < ApplicationController
	def create
		scanner = UpcScanner.find(params[:upc_scanner_id])
		item = scanner.upc_items.new(item_params)
		item.brand = Brand.find_or_create_by(inventory: scanner.inventory, brand_name: Brand.match_upc_to_gcp(params[:upc_item][:upc]))
		item.product_name = UpcItem.match_upc_to_item(params[:upc_item][:upc])
		if item.save
			notice = "Item added successfully."
			if !request.xhr?
				redirect_to edit_upc_scanner_path(scanner), notice: notice
			else
				render json: item.json_upc_item.to_json
			end
		else
			notice = "Couldn't add item."
			if !request.xhr?
				redirect_to edit_upc_scanner_path(scanner), notice: "Couldn't add item."
			else
				render json: {notice: notice}.to_json
			end
		end
	end

	def item_params
		params.require(:upc_item).permit(:upc, :quantity, :retail_price)
	end
end