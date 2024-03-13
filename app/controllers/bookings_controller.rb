class BookingsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to car_path(@car)
      booking_price = @car.price * (@booking.ending_date - @booking.starting_date) / (3600 * 24)
      @booking.update!(booking_amount: booking_price)
      flash[:alert] = "Tu as bien réservé pour un total de #{@booking.booking_amount} €"
     else
      render "cars/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date,:ending_date)
  end
end
