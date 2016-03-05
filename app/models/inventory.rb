class Inventory < ActiveRecord::Base
	belongs_to :business
	has_many :category_scanners
	has_many :categories
	has_many :category_items, through: :category_scanners

	has_many :upc_scanners
	has_many :brands
	has_many :upc_items, through: :upc_scanners
	accepts_nested_attributes_for :categories, allow_destroy: true

	def format_date
		date.strftime("%m-%d-%Y")
	end

	def cat_total_retail_value
		categories.map {|category| category.sum_retail_prices}.inject(:+)
	end

	def cat_total_cost_value
		categories.map {|category| category.sum_cost_prices}.inject(:+)
	end

	def upc_total_retail_value
		brands.map {|brand| brand.sum_retail_prices}.inject(:+)
	end

	def clear_empty_categories
		categories.each do |category|
			category.destroy if category.category_items.empty?
		end
	end

	def clear_empty_brands
		brands.each do |brand|
			brand.destroy if brand.upc_items.empty?
		end
	end


	def categories_alphabetically
		categories.sort_by{ |category| Category.full_name(category) }
	end

	def update_margins_to_previous_inventory
		categories.each do |category|
			if category.previous_inventory_same_category != nil
				category.margin_value = category.previous_inventory_same_category.margin_value
			else
				category.margin_value = 0
			end
		category.save
		end
	end
end