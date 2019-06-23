class Car < ApplicationRecord
  belongs_to :car_type
  has_many :car_inspections
  has_many :car_processes
end
