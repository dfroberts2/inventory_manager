class Inventory < ActiveRecord::Base
	belongs_to :business
	has_many :category_scanners

	def format_date
		date.strftime("%m-%d-%Y")
	end

	def all_items
		category_scanners.map{|scanner| scanner.category_items}.inject(:+)
	end

	def all_categories
		all_items.map{|item| item.category}.uniq
	end

	def all_items_in_category(category)
		all_items.select{|item| item.category == category}
	end
end