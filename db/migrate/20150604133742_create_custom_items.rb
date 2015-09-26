class CreateCustomItems < ActiveRecord::Migration
  def change
    create_table :custom_items do |t|
    	t.string :item
    end
  end
end
