class DefaultItem < ActiveRecord::Base
	# has_and_belongs_to_many :trips
	has_many :trip_default_items
	has_many :trips, through: :trip_default_items
	# has_many :default_trips
	# has_many :trips, through: :default_trips
end