class Bike < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :rentals

  validates :name, :category, :price, :location, :user_id, presence: true
end
