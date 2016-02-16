class CategoryScanner < ActiveRecord::Base
	belongs_to :inventory
	has_many :category_items
end