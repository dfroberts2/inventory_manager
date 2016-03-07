class UpcItem < ActiveRecord::Base
	belongs_to :upc_scanner
	belongs_to :brand
	delegate :brand_name, to: :brand

	validates :quantity, presence: true
	validates :retail_price, presence: true
	validates :brand_id, presence: true

	def self.match_upc_to_item(upc_code)
		upc_match = UpcCode.find_by(upc: upc_code)
		if upc_match
			upc_match.product_name
		else
			Brand.match_upc_to_gcp(upc_code) + " Item"
		end
	end

	def json_upc_item
		{upc: upc, brand: brand_name, product_name: product_name, quantity: quantity, retail_price: retail_price, id: id}
	end
end