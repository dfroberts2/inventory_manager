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

	def category_margin(category)
		all_items_in_category(category).first.margin
	end

	def sum_category_retail_prices(category)
		all_items_in_category(category).map{ |item| item.retail_price}.inject(:+)
	end

	def category_allocation(category)
		sum_category_retail_prices(category).to_f/total_retail_value.to_f
	end

	def total_retail_value
		all_items.map {|item| item.retail_price}.inject(:+)
	end

	def sum_category_cost_prices(category)
		sum_category_retail_prices(category).to_f * (1 - category_margin(category).to_f)
	end
end