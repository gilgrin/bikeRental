class Bike < ApplicationRecord
  BIKE_CATEGORIES = ['Road Bike', 'Touring Bike', 'Mountain Bike', 'Electric Bike', 'City Bike', 'BMX Bike', 'Tandem Bike', 'Other']
  has_many_attached :photos
  belongs_to :user
  has_many :rentals

  validates :name, :category, :price, :location, :user_id, presence: true
  validates :category, inclusion: { in: BIKE_CATEGORIES }
end
