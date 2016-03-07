class  CategoryScannersController < ApplicationController
	def create
		inventory = Inventory.find(params[:inventory_id])
		inventory.category_scanners.create
		redirect_to inventory_path(inventory)
	end

	def import
		scanner = CategoryScanner.find(params[:scanner_id])
		if !CategoryScanner.csv_or_txt(params[:file])
			redirect_to inventory_path(scanner.inventory), notice: "Please upload a .txt or .csv file"
		else
			CategoryScanner.clear_and_import(params[:file], scanner)
			scanner.inventory.clear_empty_categories
			redirect_to inventory_path(scanner.inventory)
		end
	end

	def edit
		@scanner = CategoryScanner.find(params[:id])
		@items = @scanner.category_items.order('updated_at DESC')[0..19]
		@item = CategoryItem.new
	end

	def load_edit_items
		scanner = CategoryScanner.find(params[:id])
		count = params[:itemCount].to_i
		loaded_items = scanner.category_items.order('updated_at DESC')[count..count + 49].map{|item| item.json_cat_item}
		render json: {items: loaded_items}.to_json
	end

	def update
		scanner = CategoryScanner.find(params[:id])
		params[:category_scanner][:category_items_attributes].each do |num, attributes|
			update_item = CategoryItem.find(attributes[:id])
			if attributes[:_destroy] == "1"
				update_item.destroy
			else
				update_item.category = Category.find_or_create_by(inventory: scanner.inventory, category_name: attributes[:category_name])
				update_item.update_attributes(quantity: attributes[:quantity], retail_price: attributes[:retail_price])
			end
		end
		# if scanner.update_attributes(params[:category_scanner], permit[:user_attribute])
		# 	redirect_to inventory_path(scanner.inventory), notice: "Updated Scanner Data"
		# else
		# 	redirect_to inventory_path(scanner.inventory), notice: "Couldn't Update"
		# end
		scanner.inventory.clear_empty_categories
		redirect_to edit_category_scanner_path(scanner)
	end

	def destroy
		scanner = CategoryScanner.find(params[:id])
		scanner.destroy
		redirect_to inventory_path(scanner.inventory)
	end
end