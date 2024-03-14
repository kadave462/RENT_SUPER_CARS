class BookingsController < ApplicationController
  before_action :set_car, only: %i[new create]

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    @booking_eligibility = (@booking.ending_date - @booking.starting_date) / (3600 * 24)
    if @booking_eligibility > 1
      if @booking.save
        redirect_to car_path(@car)
        @booking.update!(booking_amount: @car.price * (@booking.ending_date - @booking.starting_date) / (3600 * 24))
        flash[:alert] = "Tu as bien réservé pour un total de #{@booking.booking_amount} €"
      else
        render "cars/show", status: :unprocessable_entity
      end
    else
      render "cars/show", status: :unprocessable_entity
    end
  end
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to cars_path
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
