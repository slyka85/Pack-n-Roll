class ChangeDataTypeOfDates < ActiveRecord::Migration
  def change
  	change_column :trips, :start_date, :string
  	change_column :trips, :end_date, :string
  end
end
