class Rental < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validates :bike_id, :user_id, :date, presence: true
end
