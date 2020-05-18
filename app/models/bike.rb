class Bike < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :rentals

  validates :name, :type, :price, :location, :user_id, presence: true;
end
