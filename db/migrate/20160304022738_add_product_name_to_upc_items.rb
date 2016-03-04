class AddProductNameToUpcItems < ActiveRecord::Migration
  def change
  	add_column :upc_items, :product_name, :string, null: false
  end
end
