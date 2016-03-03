class Brand < ActiveRecord::Base
	has_many :upc_items
	belongs_to :inventory

	def sum_retail_prices
		upc_items.map{ |item| item.retail_price*item.quantity}.inject(:+)
	end

	def allocation_percent
		100 * sum_retail_prices / inventory.upc_total_retail_value
	end

	def self.match_upc_to_gcp(upc_code)
		gcp_key = {"03897" => 6,
					"03891" =>  7,
					"03716" =>  7,
					"03714" =>  6,
					"03711" =>  7,
					"03328" =>  7,
					"03327" =>  7,
					"03326" =>  7,
					"03325" =>  7,
					"03321" =>  6,
					"0388" =>  6,
					"0387" =>  7,
					"0386" =>  6,
					"0385" =>  6,
					"0384" =>  6,
					"0383" =>  6,
					"0382" =>  6,
					"0381" =>  6,
					"0380" =>  6,
					"0378" =>  7,
					"0376" =>  7,
					"0375" =>  7,
					"0373" =>  7,
					"0372" =>  7,
					"0370" =>  7,
					"0339" =>  7,
					"0338" =>  7,
					"0337" =>  7,
					"0336" =>  7,
					"0335" =>  7,
					"0334" =>  7,
					"0333" =>  7,
					"0331" =>  7,
					"0330" =>  7,
					"089" =>  10,
					"088" =>  7,
					"087" =>  9,
					"086" =>  11,
					"085" =>  10,
					"084" =>  8,
					"083" =>  9,
					"082" =>  7,
					"081" =>  9,
					"080" =>  7,
					"039" =>  7,
					"036" =>  7,
					"035" =>  7,
					"034" =>  7,
					"032" =>  7,
					"031" =>  7,
					"030" =>  6,
					"019" =>  7,
					"018" =>  10,
					"011" =>  8,
					"07" =>  7,
					"06" =>  7,
					"05" =>  0,
					"04" =>  0,
					"02" =>  0,
					"00" =>  7,
					"2" =>  0}
		gcp_key.each do |key_prefix, gcp_length|
			if upc_code[0..key_prefix.length-1] == key_prefix
				gcp = GcpCode.find_by(gcp: upc_code[0..gcp_length-1])
				return gcp.company_name
			end
		end
	end
end