class BikesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create

  #   if @bike.save
  #     redirect_to, bike_path
  end

  def bike_params
    params.require(:bike).permit(:name, :color, :size, :price, :equipment, :location, photos: [], :user_id)
  end

end
