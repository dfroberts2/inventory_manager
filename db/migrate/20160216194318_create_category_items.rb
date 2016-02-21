class CreateCategoryItems < ActiveRecord::Migration
  def change
    create_table :category_items do |t|
    	t.references :category_scanner, null: false
    	t.string :category, null: false
    	t.float :quantity, null: false
    	t.float :retail_price, null: false
    	t.float :cost
    	t.float :margin

    	t.timestamps null: false
    end
  end
end
