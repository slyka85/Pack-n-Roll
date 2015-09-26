class TestPageController < ApplicationController
	def index
	end



	def trip_params
  params.require(:trip).permit(:trip_id, default_item_ids: [], default_items: [])
end
end