class CreateCustomTrips < ActiveRecord::Migration
  def change
    create_table :custom_trips do |t|
    	t.integer :trip_id
    	t.integer :custom_item_id
    end
  end
end
