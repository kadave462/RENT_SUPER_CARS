class PagesController < ApplicationController
  def home
  end

  def account
    if user_signed_in?
      @bookings = Booking.where(user_id: current_user.id)
    else
      redirect_to user_session_path
    end
  end
end
