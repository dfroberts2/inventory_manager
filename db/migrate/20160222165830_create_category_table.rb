class CreateCategoryTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :category_name, null: false
    	t.float :margin_value
    	t.references :inventory, null: false
    end
  end
end
