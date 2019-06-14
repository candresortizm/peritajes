class Car < ApplicationRecord
  belongs_to :car_type
  has_many :car_inspections, inverse_of: :car
  has_many :car_processes
end
