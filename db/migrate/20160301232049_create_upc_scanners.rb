class CreateUpcScanners < ActiveRecord::Migration
  def change
    create_table :upc_scanners do |t|
    	t.references :inventory, null: false

    	t.timestamps null: false
    end
  end
end
