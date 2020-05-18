class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rentals, dependent: :destroy
  has_many :bikes
  has_many :rented_bikes, through: :rentals, source: :bike
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
