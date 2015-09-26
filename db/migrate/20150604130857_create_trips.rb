class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    	t.integer :user_id
    	t.string :destination
      t.date :start_date
      t.date :end_date
    end
  end
end
