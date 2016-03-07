class CategoryItem < ActiveRecord::Base
	belongs_to :category_scanner
	belongs_to :category
	delegate :margin_value, :category_name, to: :category

	validates :quantity, presence: true
	validates :retail_price, presence: true
	validates :category_id, presence: true

	def json_cat_item
		{category: category_name, quantity: quantity, retail: retail_price, id: id}
	end
end