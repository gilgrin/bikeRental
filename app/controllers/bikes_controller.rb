class BikesController < ApplicationController

  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(:id)
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = @bike
    if @bike.save
      redirect_to, bike_path
    else
      render :new
  end

  def bike_params
    params.require(:bike).permit(:name, :color, :size, :category, :price, :equipment, :location, photos: [], :user_id)
  end

end
