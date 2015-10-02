class ActivityItem < ActiveRecord::Base
	has_many :tactivity_items_trips
	has_many :trips, through: :activity_items_trips
end
