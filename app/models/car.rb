class Car < ApplicationRecord
  belong_to :car_type
  has_many :car_inspections
  has_many :car_processes
end
