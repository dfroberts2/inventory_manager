class UpcItem < ActiveRecord::Base
	belongs_to :upc_scanner
	belongs_to :brand
	delegate :brand_name, to: :brand
end