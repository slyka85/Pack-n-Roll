class CreateDefaultItems < ActiveRecord::Migration
  def change
    create_table :default_items do |t|
    	t.string :item
    end
  end
end
