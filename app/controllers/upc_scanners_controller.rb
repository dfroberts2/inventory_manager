class  UpcScannersController < ApplicationController
	def create
		inventory = Inventory.find(params[:inventory_id])
		inventory.upc_scanners.create
		redirect_to inventory_path(inventory)
	end

	def import
		scanner = UpcScanner.find(params[:scanner_id])
		if !UpcScanner.csv_or_txt(params[:file])
			redirect_to inventory_path(scanner.inventory), notice: "Please upload a .txt or .csv file"
		else
			UpcScanner.clear_and_import(params[:file], scanner)
			# scanner.inventory.clear_empty_categories
			redirect_to inventory_path(scanner.inventory)
		end
	end

	def edit
		@scanner = UpcScanner.find(params[:id])
		@item = UpcItem.new
	end

	def update
		scanner = UpcScanner.find(params[:id])
		params[:upc_scanner][:upc_items_attributes].each do |num, attributes|
			update_item = UpcItem.find(attributes[:id])
			if attributes[:_destroy] == "1"
				update_item.destroy
			else
				update_item.update_attributes(quantity: attributes[:quantity], retail_price: attributes[:retail_price])
			end
		end
		redirect_to edit_upc_scanner_path(scanner)
	end

	def destroy
		scanner = UpcScanner.find(params[:id])
		scanner.destroy
		redirect_to inventory_path(scanner.inventory)
	end
end