class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
    	t.string :brand_name, null: false
    	t.references :inventory, null: false
    end
  end
end
