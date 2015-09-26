class AddActivityIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :activity_item_id, :integer
  end
end
