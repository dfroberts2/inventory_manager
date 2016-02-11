class BusinessesController < ApplicationController
	def index
		owner = Owner.find(params[:owner_id])
		@businesses = owner.businesses
		render layout: false if request.xhr?
	end

	def show
		@business = Business.find(params[:id])
	end
end