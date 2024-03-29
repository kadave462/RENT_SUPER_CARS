class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :cars
  validates :email, presence: true
  validates :first_name, presence: true
  validates :username, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
end
