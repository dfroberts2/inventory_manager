class OwnerController < ApplicationController
	def index
		@owners = Owner.all 
	end
end