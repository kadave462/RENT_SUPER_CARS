class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def show
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:car_model, :car_brand, :price, :horse_power)
  end
end
