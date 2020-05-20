class BikesController < ApplicationController

  def index
    if params[:query].present?
      @bikes = Bike.search_by_location_and_category_and_price(params[:query])
    else
      @bikes = Bike.all
    end
  end

  def show
    @bike = Bike.find(params[:id])
    @rental = Rental.new
    @rental.user = current_user
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to @bike, notice: 'Bike was successfully created.'
    else
      render :new
    end
  end

private

  def bike_params
    params.require(:bike).permit(:name, :color, :size, :category, :price, :equipment, :location, photos: [])
  end
end
