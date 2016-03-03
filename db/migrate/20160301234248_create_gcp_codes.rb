class CreateGcpCodes < ActiveRecord::Migration
  def change
    create_table :gcp_codes do |t|
    	t.string :gcp, null: false
    	t.string :company_name, null: false
    end
  end
end
