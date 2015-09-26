class CreateTripsDefaultItemsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :trips, :default_items do |t|
      # t.index [:trip_id, :default_item_id]
      # t.index [:default_item_id, :trip_id]
    end
  end
end
