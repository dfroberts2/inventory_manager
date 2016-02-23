class Inventory < ActiveRecord::Base
	belongs_to :business
	has_many :category_scanners
	has_many :categories
	has_many :category_items, through: :category_scanners
	accepts_nested_attributes_for :categories, allow_destroy: true

	def format_date
		date.strftime("%m-%d-%Y")
	end

	def total_retail_value
		category_items.map {|item| item.retail_price}.inject(:+)
	end

	def total_cost_value
		categories.map {|category| category.sum_cost_prices}.inject(:+)
	end

	def clear_empty_categories
		categories.each do |category|
			category.destroy if category.category_items.empty?
		end
	end

	def categories_alphabetically
		categories.sort_by{ |category| category.category_name}
	end

	def current_and_previous_categories
		categories_alphabetically.zip(business.previous_inventory(self).categories_alphabetically)
	end
end