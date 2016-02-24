class Business < ActiveRecord::Base
	has_many :inventories
	belongs_to :owner

	def inventory_years
		inventories.map {|inventory| inventory.date.year}.uniq
	end

	def inventories_by_year(year)
		inventories.select {|inventory| inventory.date.year == year.to_i}
	end

	def chronological_inventories
		inventories.sort_by {|inventory| inventory.date}
	end

	def previous_inventory(inventory)
		inventory_index = chronological_inventories.index(inventory)
		if inventory_index != 0
			chronological_inventories[inventory_index - 1]
		else
			nil
		end
	end

	def all_reports_up_to(inventory)
		chronological_inventories[0..chronological_inventories.index(inventory)]
	end
end