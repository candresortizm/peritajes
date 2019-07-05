class Car < ApplicationRecord
  validates :car_brand, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :plate, presence: true, uniqueness: true
  validates :vin, presence: true, uniqueness: true

  belongs_to :car_type
  has_many :car_inspections
  has_many :car_processes
end
