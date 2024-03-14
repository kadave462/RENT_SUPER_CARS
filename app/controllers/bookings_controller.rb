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
    if @booking.save
      redirect_to car_path(@car)
      @booking.update!(booking_amount: @car.price * (@booking.ending_date - @booking.starting_date) / (3600 * 24))
      flash[:alert] = "Tu as bien réservé pour un total de #{@booking.booking_amount} €"
    else
      render "cars/show", status: :unprocessable_entity
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: true) if current_user.id == @booking.car.user_id
    redirect_to account_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: false) if current_user.id == @booking.car.user_id
    redirect_to account_path
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
