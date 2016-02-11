class Business < ActiveRecord::Base
	has_many :inventories
	belongs_to :owner

	def inventory_years
		inventories.map {|inventory| inventory.date.year}.uniq
	end
end