class Booking < ApplicationRecord
  belongs_to :cars
  belongs_to :users
  validates :status, presence: true
  validates :bookings, presence: true
  validates :starting_date, presence: true
  validates :ending_date, presence: true
end
