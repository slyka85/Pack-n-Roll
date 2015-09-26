class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = Trip.where(:user_id == current_user.id)
  end

  def update_default_items
    @trip = Trip.find(params[:id])
    @trip.update_attributes!(trip_default_items_attributes: params[:trip][:trip_default_items])
    redirect_to @trip
  end

  def create
    binding.pry
    @trip = Trip.new(params[:trip])
    @trip.user_id = current_user.id
    @trip.destination = params[:destination]
    @trip.start_date = params[:start_date]
    @trip.end_date = params[:end_date]
    @trip.id = params[:id]
    trip_id = params[:id]
    @trip.save
    binding.pry
    @activity_ids = params["activity_ids"].map { |aid| aid}
    @activity_ids.each do |aid|
      binding.pry
       @activity = ActivityItem.find_by_id(aid)
       @activity.trip_id = Trip.find_by_id(@trip.id).id
       @trip.activity_item_id = @activity.id
       @activity.save
       @trip.save
     end

    if @trip.save
      redirect_to(@trip)
    else
      flash[:alert] = 'Please fill out all the fields to proceed'
      redirect_to root_path
    end
  end

  def activity_items_trip
  end

  def show
    @params1 = params
    @params2 = params[:default_trips]
    @default_item_list = DefaultItem.new(params[:default_item])

    @trip = Trip.find(params[:id])
    trip_id = params[:id]
    @default_item = DefaultItem.find(params[:id])
    @default_clothes_items = DefaultItem.where(category: 'Clothes')
    @all_default_items = DefaultItem.all
    di_id = []
    di_name = []

    @all_default_items.each do |di|
      di_id.push(di.id)
      di_name.push(di.item)
    end

    default_item_id = @default_item.id

    @default_paperwork_items = DefaultItem.where(category: 'Travel Paperwork')
    @default_toiletries_items = DefaultItem.where(category: 'Toiletries')
    @default_electronics_items = DefaultItem.where(category: 'Electronics')
    @default_carryon_items = DefaultItem.where(category: 'Carry-on')
    @default_misc_items = DefaultItem.where(category: 'Miscellaneous')

    @trip.default_items.pluck(:category).uniq.each do |category|
      puts category
      @trip.default_items.where(category: category).each do |default_item|
        puts default_item.item
      end
    end

    @trip.trip_default_items.last.default_item.category
  end

  def create_default_items_trip
    @trip = Trip.find_by_id(params[:id])
    @trip.id = params[:id]
    trip_id = params[:id]
    item_ids = params[:item_ids]
    if item_ids
      item_ids.each do |iid|
        DefaultItemsTrips.find_or_create_by(trip_id: params[:id], default_item_id: iid)
      end
    end
    redirect_to saved_items_trip_path
    end

  def saved_items_trip
    @saved_items_trip = Trip.find(params[:id])
    @saved_items = @saved_items_trip.default_items.order('id ASC')
    @saved_toiletries = @saved_items_trip.default_items.where(category: 'Toiletries')
    @saved_clothes = @saved_items_trip.default_items.where(category: 'Clothes')
    @saved_paperwork = @saved_items_trip.default_items.where(category: 'Travel Paperwork')
    @saved_electronics = @saved_items_trip.default_items.where(category: 'Electronics')
    @saved_carry_on = @saved_items_trip.default_items.where(category: 'Carry-on')
    @saved_misc = @saved_items_trip.default_items.where(category: 'Miscellaneous')
  end

  def delete_saved_items_trip
    @saved_items_trip = Trip.find(params[:id])
    @saved_items_trip.default_items.clear
  end

  def packed
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(params[:trip].permit(:destination, :start_date, :end_date, :user_id))
      redirect_to(@trip)
    else
      render :edit
    end
  end

  def destroy
    # binding.pry
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path

  end

  def delete_droppable_trip
    # binding.pry
     @trip = Trip.find(params[:id])
    @trip.destroy
    render nothing: true
  end

  private

  def default_trip_params
    params.require(:default_items_trips).permit(:id, :trip_id, :user_id, :destination, id: [], default_item_ids: [], default_items: [], item_ids: [], trip_ids: [])
  end
end
