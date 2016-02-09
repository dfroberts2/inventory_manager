class CreateOwnerTable < ActiveRecord::Migration
  def change
    create_table :owner do |t|
    	t.string :name, null:false
    	
    	t.timestamps null:false
    end
  end
end
