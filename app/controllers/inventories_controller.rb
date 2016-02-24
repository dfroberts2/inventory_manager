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
		params[:inventory][:categories_attributes].each do |num, attributes|
			update_category = Category.find(attributes[:id])
			update_category.update_attributes(margin_value: attributes[:margin_value])			
		end
		redirect_to inventory_path(inventory), notice: "Updated Margin Values"
	end

	def update_margins_previous
		inventory = Inventory.find(params[:id])
		inventory.update_margins_to_previous_inventory
		redirect_to inventory_path(inventory), notice: "Updated Margin Values"
	end

	def trans_report
		@inventory = Inventory.find(params[:id])
	end

	def dept_report
		@inventory = Inventory.find(params[:id])
	end
end