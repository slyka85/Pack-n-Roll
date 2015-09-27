class CalendarController < ApplicationController
  before_action :authenticate_user!
  def index
    @trips = Trip.where(:user_id == current_user.id)
    @trips_by_date = @trips.group_by{|x| x.start_date.to_date} 
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

    def show
        @trip = Trip.find(params[:id])
        end

    def new 
    @trip = Trip.new
    end

    def create
      @trip = Trip.new
      @trip.user_id = current_user.id
      @trip.destination = params[:destination]
      @trip.start_date = params[:start_date]
      @trip.end_date = params[:end_date]
      @trip.id = params[:id]

      if @trip.save
        redirect_to(@trip)
      else 
        render :new
      end
    end


  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(params[:trip].permit(:destination,:start_date, :end_date, :user_id))
      redirect_to trips_path
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end
end
