require 'csv'
namespace :import_gcp_csv do
	task :create_gcps => :environment do
		CSV.foreach(Rails.root.to_s+"/../gcp_company_name.csv", headers: :true) do |row|
			GcpCode.create!(gcp: row[0], company_name: row[1])
		end
	end
end