class Inventory < ActiveRecord::Base
	belongs_to :business
	has_many :category_scanners

	def format_date
		date.strftime("%m-%d-%Y")
	end
end