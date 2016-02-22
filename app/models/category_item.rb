class CategoryItem < ActiveRecord::Base
	belongs_to :category_scanner
	belongs_to :category
	delegate :margin_value, :category_name, to: :category
end