class Trip < ActiveRecord::Base

	validates_presence_of :destination, :start_date, :end_date
	has_many :trip_default_items
	has_many :activity_items_trips
	has_many :activity_items, through: :activity_items_trips
	has_many :default_items, through: :trip_default_items
	belongs_to :user
	after_create :populate_default_items

	def populate_default_items
		DefaultItem.ids.each do |id|
			trip_default_items.create!(default_item_id: id)
		end
	end
	accepts_nested_attributes_for :trip_default_items
	accepts_nested_attributes_for :activity_items_trips

end