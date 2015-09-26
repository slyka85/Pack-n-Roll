class CustomTrip < ActiveRecord::Base
	belongs_to :trip
	belongs_to :custom_item
end