class UpdateTripDefaultItemsTable < ActiveRecord::Migration
  def change
  	change_column :trip_default_items, :checked, :boolean, default: false
  end
end
