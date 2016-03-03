class CreateUpcItems < ActiveRecord::Migration
  def change
    create_table :upc_items do |t|
    	t.references :upc_scanner, null: false
    	t.string :upc, null: false
    	t.float :quantity, null: false
    	t.float :retail_price, null: false

    	t.timestamps null: false
    end
  end
end
