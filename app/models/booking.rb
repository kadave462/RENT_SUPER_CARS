class Booking < ApplicationRecord
  belongs_to :cars
  belongs_to :users
end
