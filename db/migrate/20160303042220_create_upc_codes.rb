class CreateUpcCodes < ActiveRecord::Migration
  def change
    create_table :upc_codes do |t|
    	t.string :upc, null: false
    	t.string :product_name
    end
  end
end
