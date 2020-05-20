class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)
    @bike = Bike.find(params[:bike_id])
    @rental.bike = @bike
    @rental.user = current_user
    if @rental.save
      redirect_to dashboard_path, notice: 'Rental was successfully created.'
    else
      render "bikes/show"
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:date)
  end
end
