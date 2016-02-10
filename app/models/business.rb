class Business < ActiveRecord::Base
	has_many :inventories
	belongs_to :owner
end