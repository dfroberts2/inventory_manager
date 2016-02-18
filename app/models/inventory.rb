class Inventory < ActiveRecord::Base
	belongs_to :business
	has_many :category_scanners

	def format_date
		date.strftime("%m-%d-%Y")
	end

	def all_category_items
		category_scanners.map{|scanner| scanner.category_items}.inject(:+)
	end

	def all_categories
		all_category_items.map{|item| item.category}.uniq
	end
end