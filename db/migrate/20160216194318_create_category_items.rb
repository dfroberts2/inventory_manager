class CreateCategoryItems < ActiveRecord::Migration
  def change
    create_table :category_items do |t|
    	t.references :category_scanner, null: false
    	t.string :category, null: false
    	t.integer :quantity, null: false
    	t.integer :retail_price, null: false
    	t.integer :cost
    	t.decimal :margin

    	t.timestamps null: false
    end
  end
end
