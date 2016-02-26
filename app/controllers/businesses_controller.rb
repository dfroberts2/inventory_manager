class BusinessesController < ApplicationController
	def index
		@owner = Owner.find(params[:owner_id])
		@businesses = @owner.businesses
		@business = Business.new
		render layout: false if request.xhr?
	end

	def show
		@business = Business.find(params[:id])
		@inventory = Inventory.new
	end

	def create
		owner = Owner.find(params[:owner_id])
		business = owner.businesses.new(business_params)
		if business.save
			notice = "New Business Saved"
		else
			notice = "Failed To Save New Business"
		end
		redirect_to root_path, notice: notice
	end

	def business_params
		params.require(:business).permit(:name, :address, :city, :state, :phone)
	end
end