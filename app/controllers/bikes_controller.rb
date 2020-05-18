class BikesController < ApplicationController

  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
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
