class CustomItem < ActiveRecord::Base
	has_many :custom_trips
	has_many :trips, :through => :custom_trips
end