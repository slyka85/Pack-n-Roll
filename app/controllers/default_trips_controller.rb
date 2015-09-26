module Api
  class DefaultTripsController < ApplicationController
    def index
      default_trips = DefaultTrip.all
      render json: default_trips
    end

    def show
        @default_trip = DefaultTrip.find(params[:id])
        @default_trips = DefaultTrip.all
    end

    # def joinMethod
    #   # stuff = DefaultTrip.joins(:trip).where(trip_id: 2).first.default_item
    #   stuff = DefaultTrip.joins(:trip).where(trip_id: params[:trip_id])
    #   render json: stuff.to_json
    #   #something = DefaultTrip.joins(:trip).where(trip_id: params[:trip_id])
    #   # render json: stuff.to_json(  include: {
    #   #     default_item: {only: [:item]},
    #   #   })
    # end

    def new 
    default_trip = DefaultTrip.new(default_trip_params)
    end

    def create
      # binding.pry
      @default_trip = DefaultTrip.new(default_trip_params)
      @default_trip.save
      redirect_to(@default_trip)
    end

    def destroy
      default_trip = DefaultTrip.find(params[:id])
      default_trip.destroy
      render json: default_trip.to_json
    end

    private
      def default_trip_params
         params.permit(:trip_id, :default_item_id)
      end

  end
end