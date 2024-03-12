class Booking < ApplicationRecord
  belongs_to :cars
  belongs_to :users
  validates :starting_date, presence: true
  validates :ending_date, presence: true
  validates :user_id, uniqueness: {scope: :car_id, message: "is already in the car"}
end
