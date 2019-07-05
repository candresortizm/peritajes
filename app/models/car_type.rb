class CarType < ApplicationRecord
  validates :name, presence: true
  has_many :cars
end
