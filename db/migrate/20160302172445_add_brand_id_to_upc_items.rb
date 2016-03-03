class AddBrandIdToUpcItems < ActiveRecord::Migration
  def change
  	add_column :upc_items, :brand_id, :integer
  end
end
