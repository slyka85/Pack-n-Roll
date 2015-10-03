class AddCurrentLocationToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :current_location, :string
  end
end
