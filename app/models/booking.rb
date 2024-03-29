class Booking < ApplicationRecord

  belongs_to :car
  belongs_to :user

  validates :starting_date, presence: true
  validates :ending_date, presence: true
end
