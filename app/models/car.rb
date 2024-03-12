class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :car_model, presence: true
  validates :car_brand, presence: true
  validates :price, presence: true
  validates :horse_power, presence: true
end
