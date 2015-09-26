class AddCategoryToDefaultItem < ActiveRecord::Migration
  def change
    add_column :default_items, :category, :string
  end
end
