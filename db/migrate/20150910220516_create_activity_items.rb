class CreateActivityItems < ActiveRecord::Migration
  def change
    create_table :activity_items do |t|
      t.string :item_name
      t.string :activity_name

      t.timestamps null: false
    end
  end
end
