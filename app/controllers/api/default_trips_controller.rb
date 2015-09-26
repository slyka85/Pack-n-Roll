module Api
  class DefaultTripsController < ApplicationController
    def index
      default_trips = DefaultTrip.all
      render json: default_trips
    end

    def show
        @default_trip = DefaultTrip.find(params[:id])
    end

    def joinMethod
      # stuff = DefaultTrip.joins(:trip).where(trip_id: 2).first.default_item
      stuff = DefaultTrip.joins(:trip).where(trip_id: params[:trip_id])
      render json: stuff.to_json
      #something = DefaultTrip.joins(:trip).where(trip_id: params[:trip_id])
      # render json: stuff.to_json(  include: {
      #     default_item: {only: [:item]},
      #   })
    end

    def new 
    default_trip = DefaultTrip.new
    end

    def create
      @default_trip = DefaultTrip.new(default_trip_params)
      #@default_trip = DefaultTrip.new(:trip_id => @trip)
      #@default_trip.trip_id = trip.id 
      #trip = Trip.find(params[:id])
        #@default_trip.trip_id = Trip.find(params[:id])
        #@default_trip.default_item = DefaultItem.find(params[:default_item_id])
      @default_trip.save
      redirect_to(@default_trip)
      #render json: @default_trip
      #render json: @default_trip.to_json
    end

    def destroy
      default_trip = DefaultTrip.find(params[:id])
      default_trip.destroy
      render json: default_trip.to_json
    end

    private
      def default_trip_params
         #params.permit(:trip_id, :default_item_id)
          params.permit(:trip_id, [:item])
           #params[:trip].permit( {:default_item_ids => []})
           #puts @default_trip
         #params.permit(:trip_id, default_items_ids: [])
          #params.require(:default_trip).permit(:trip_id, :default_item_id)
          #params.permit({:trip_id => @trip})
      end

  end
end