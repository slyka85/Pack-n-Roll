class AddTripIdToActivityItems < ActiveRecord::Migration
  def change
    add_column :activity_items, :trip_id, :integer
  end
end
