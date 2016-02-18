class InventoriesController < ApplicationController
	def index_by_year
		business = Business.find(params[:id])
		year = params[:year]
		@inventories = business.inventories_by_year(year)
		render layout: false if request.xhr?
	end

	def show
		@inventory = Inventory.find(params[:id])
	end

	def edit_margins
		@inventory = Inventory.find(params[:id])
	end

	def update_margins
	end
end