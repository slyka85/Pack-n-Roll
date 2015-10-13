class ActivitiesController < ApplicationController
  def new
    @trip = current_user.trips.find(params[:trip_id])
  end

  def create
    @trip = current_user.trips.find(params[:trip_id])

    params[:activities].each do |activity|
      @trip.activities.create!(name: activity)
    end

    redirect_to @trip
  end
end
