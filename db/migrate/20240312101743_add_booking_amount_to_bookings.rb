class AddBookingAmountToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :booking_amount, :integer
  end
end
