require 'csv'
namespace :import_upc_csv do
	task :create_upcs => :environment do
		CSV.foreach(Rails.root.to_s+"/../gtin_product_name_category.csv") do |row|
			UpcCode.create!(upc: row[0], product_name: row[1])
		end
	end
end