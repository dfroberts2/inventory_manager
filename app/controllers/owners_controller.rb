class OwnersController < ApplicationController
	def index
		@owners = Owner.all
		@owner = Owner.new
	end

	def create
		owner = Owner.new(name: params[:owner][:name])
		if owner.save
			notice = "New Owner Saved"
		else
			notice = "Failed to Save"
		end
		redirect_to root_path, notice: notice
	end
end