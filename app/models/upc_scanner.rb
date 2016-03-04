class UpcScanner < ActiveRecord::Base
	belongs_to :inventory
	has_many :upc_items, dependent: :destroy
	accepts_nested_attributes_for :upc_items, allow_destroy: true

	def self.csv_or_txt(file)
		File.extname(file.original_filename) == ".csv" || File.extname(file.original_filename) == ".txt"
	end

	def self.clear_and_import(file, scanner)
		scanner.upc_items.each {|item| item.destroy}
		CSV.foreach(file.path) do |row|
			brand = Brand.find_or_create_by(brand_name: Brand.match_upc_to_gcp(row[0]), inventory: scanner.inventory)
			scanner.upc_items.create(product_name: UpcItem.match_upc_to_item(row[0]), brand: brand, quantity: row[1], retail_price: row[2], upc: row[0])
		end
	end


end