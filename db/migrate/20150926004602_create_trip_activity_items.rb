class CreateTripActivityItems < ActiveRecord::Migration
  def change
    create_table :trip_activity_items do |t|
    	t.references :trip
      t.references :activity_item
      t.boolean :checked, default: true
      t.timestamps null: false
    end
  end
end


