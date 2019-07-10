class Car < ApplicationRecord
  validates :model, presence: true
  validates :year, presence: true
  validates :plate, presence: true, uniqueness: true
  validates :vin, presence: true, uniqueness: true
  validates :color, presence: true

  belongs_to :car_type
  belongs_to :car_brand
  has_many :car_inspections
  has_many :car_processes
end
