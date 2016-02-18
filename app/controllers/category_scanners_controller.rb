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
			redirect_to inventory_path(scanner.inventory)
		end
	end

	def edit
		@scanner = CategoryScanner.find(params[:id])
		@item = CategoryItem.new
	end

	def update
		scanner = CategoryScanner.find(params[:id])
		params[:category_scanner][:category_items_attributes].each do |num, attributes|
			update_item = CategoryItem.find(attributes[:id])
			if attributes[:_destroy] == "1"
				update_item.destroy
			else
				update_item.update_attributes(category: attributes[:category], quantity: attributes[:quantity], retail_price: attributes[:retail_price], cost: attributes[:cost], margin: attributes[:margin])
			end
		end
		# if scanner.update_attributes(params[:category_scanner], permit[:user_attribute])
		# 	redirect_to inventory_path(scanner.inventory), notice: "Updated Scanner Data"
		# else
		# 	redirect_to inventory_path(scanner.inventory), notice: "Couldn't Update"
		# end
		redirect_to edit_category_scanner_path(scanner)
	end

	def destroy
		scanner = CategoryScanner.find(params[:id])
		scanner.destroy
		redirect_to inventory_path(scanner.inventory)
	end
end