class ActivityItem < ActiveRecord::Base
	has_many :trip_activity_items
	has_many :trips, through: :trip_activity_items
end
