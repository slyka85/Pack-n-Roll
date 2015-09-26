module Api
	class DefaultItemsController < ApplicationController
		def index
			@my_default_items = DefaultItem.all
			render json: @my_default_items
		end
	end
end