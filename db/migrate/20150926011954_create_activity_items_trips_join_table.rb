class CreateActivityItemsTripsJoinTable < ActiveRecord::Migration
  def change
    	create_join_table :trips, :activity_items do |t|
      # t.index [:trip_id, :activity_item_id]
      # t.index [:activity_item_id, :trip_id]
    end
  end
end

