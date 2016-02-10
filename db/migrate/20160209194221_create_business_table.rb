class CreateBusinessTable < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
    	t.string :name, null:false
    	t.string :address
    	t.string :city
    	t.string :state
    	t.string :phone
    	t.references :owner, null:false	
    	
    	t.timestamps null:false
    end
  end
end
