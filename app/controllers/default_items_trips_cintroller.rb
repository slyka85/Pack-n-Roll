class DefaultItemsTripsController < ApplicationController
		
		def new
			default_item_trip = DefaultItemTrip.new(default_trip_params)
		end

		def create
			end
    private

      def default_trip_params
  params.require(:default_items_trips).permit(:id, :trip_id, :user_id, :destination, :id => [], default_item_ids: [], default_items: [], item_ids: [])
end

end