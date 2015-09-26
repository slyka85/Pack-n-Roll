class CreateDefaultTrips < ActiveRecord::Migration
  def change
    create_table :default_trips do |t|
    	t.integer :trip_id
    	t.integer :default_item_id
    end
  end
end
