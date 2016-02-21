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
		inventory = Inventory.find(params[:id])
		params[:inventory][:categories].each do |category, margin|
			inventory.all_items_in_category(category).each do |item|
				item.update_attributes(margin: margin)
			end
		end
		redirect_to inventory_path(inventory), notice: "Updated Margin Values"
	end
	def trans_report
		@inventory = Inventory.find(params[:id])
	end
end