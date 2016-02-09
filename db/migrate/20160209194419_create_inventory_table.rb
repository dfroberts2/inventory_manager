class CreateInventoryTable < ActiveRecord::Migration
  def change
    create_table :inventory do |t|
    	t.datetime :date, null:false
    	t.references :business, null: false

    	t.timestamps null: false
    end
  end
end
