class CreateCategoryScanners < ActiveRecord::Migration
  def change
    create_table :category_scanners do |t|
    	t.references :inventory, null: false

    	t.timestamps null: false
    end
  end
end
