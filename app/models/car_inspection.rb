class CarInspection < ApplicationRecord
  belongs_to :car_expert
  belongs_to :car, inverse_of: :car_inspections
  has_many :car_answers
  has_many :inspection_comments

  accepts_nested_attributes_for :car, :car_answers, :inspection_comments

end
