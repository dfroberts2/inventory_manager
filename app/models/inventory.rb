class Inventory < ActiveRecord::Base
	belongs_to :business

	def format_date
		date.strftime("%m-%d-%Y")
	end
end