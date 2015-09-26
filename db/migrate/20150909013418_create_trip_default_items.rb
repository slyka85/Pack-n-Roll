class CreateTripDefaultItems < ActiveRecord::Migration
  def change
    create_table :trip_default_items do |t|
      t.references :trip
      t.references :default_item
      t.boolean :checked, default: true

      t.timestamps null: false
    end
  end
end
