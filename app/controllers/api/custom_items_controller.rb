module Api
	class CustomItemsController < ApplicationController
			def index
			custom_items = CustomItem.all
			render json: custom_items
		end
	end
end