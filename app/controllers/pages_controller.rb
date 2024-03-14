class PagesController < ApplicationController
  def home
  end

  def account
    if user_signed_in?
      @pending_bookings = []
      @user_bookings = current_user.bookings
      user_cars = current_user.cars
      user_cars.each do |car|
        car_bookings = Booking.where(car_id: car.id)
        car_bookings.each do |booking|
          @pending_bookings << booking
        end
      end
    else
      redirect_to user_session_path
    end
  end
end
