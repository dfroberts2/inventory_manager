class Business < ActiveRecord::Base
	has_many :inventories
	belongs_to :owner

	def inventory_years
		inventories.map {|inventory| inventory.date.year}.uniq
	end

	def inventories_by_year(year)
		inventories.select {|inventory| inventory.date.year == year.to_i}
	end
end