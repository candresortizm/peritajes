class CarInspection < ApplicationRecord
  belongs_to :car_expert
  belongs_to :car
end
