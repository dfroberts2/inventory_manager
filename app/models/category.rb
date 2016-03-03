class Category < ActiveRecord::Base
	belongs_to :inventory
	has_many :category_items

	def self.full_name(category)
		category_key = {
		"cdy": "Candy",
		"snk": "Snack Foods",
		"gro": "Grocery",
		"bev b": "Beer & Wine",
		"bev s": "Soft Drinks",
		"bev j": "Juice, Water, Tea",
		"bak": "Prepackaged Bakery",
		"aut": "Auto Accesories & Motor Oil",
		"tob": "Tobacco",
		"dry": "Dairy",
		"ppd": "Prepackaged Deli",
		"pub": "Publications",
		"frz": "Frozen Goods",
		"pro": "Propane",
		"turkey": "Turkey Products",
		"pork": "Pork Products",
		"beef": "Beef Products",
		"cheese": "Cheese Products"
		}
		if category_key[category.category_name.to_sym] == nil
			category.category_name.capitalize + " Products"
		else
			category_key[category.category_name.to_sym]
		end
	end

	def sum_retail_prices
		category_items.map{ |item| item.retail_price*item.quantity}.inject(:+)
	end

	def sum_cost_prices
		sum_retail_prices * (1 - margin_value)
	end

	def allocation_percent
		100 * sum_retail_prices / inventory.cat_total_retail_value
	end

	def margin_percent
		margin_value * 100
	end

	def previous_inventory_same_category
		last_inventory = inventory.business.previous_inventory(inventory)
		Category.find_by(category_name: category_name, inventory: last_inventory)
	end
end