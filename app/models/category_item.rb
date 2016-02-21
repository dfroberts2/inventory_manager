class CategoryItem < ActiveRecord::Base
	belongs_to :category_scanner

	def self.category_full_name(category)
		key = {
		"cdy": "Candy",
		"snk": "Snack Foods",
		"gro": "Grocery",
		"bev b": "Beer & Wine",
		"bev s": "Soft Drinks",
		"bev j": "Juice,Water, Tea",
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
		if key[category.to_sym] == nil
			category.capitalize + " Products"
		else
			key[category.to_sym]
		end
	end
end