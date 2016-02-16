class  CategoryScannersController < ApplicationController
	def create
		inventory = Inventory.find(params[:inventory_id])
		inventory.category_scanners.create
		redirect_to inventory_path(inventory)
	end
end