class CategoryScanner < ActiveRecord::Base
	belongs_to :inventory
	has_many :category_items, dependent: :destroy
	accepts_nested_attributes_for :category_items, allow_destroy: true

	def self.clear_and_import(file, scanner)
		scanner.category_items.each {|item| item.destroy}
		CSV.foreach(file.path) do |row|
			scanner.category_items.create(category: row[0], quantity: row[1], retail_price: row[2])
		end
	end

	def self.csv_or_txt(file)
		File.extname(file.original_filename) == ".csv" || File.extname(file.original_filename) == ".txt"
	end
end