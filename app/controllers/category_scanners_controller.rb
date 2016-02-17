class  CategoryScannersController < ApplicationController
	def create
		inventory = Inventory.find(params[:inventory_id])
		inventory.category_scanners.create
		redirect_to inventory_path(inventory)
	end

	def import
		binding.pry
		scanner = CategoryScanner.find(params[:scanner_id])
		CategoryScanner.check_csv(params[:file])
		CategoryScanner.clear_and_import(params[:file], scanner)
		redirect_to inventory_path(scanner.inventory)
	end
end