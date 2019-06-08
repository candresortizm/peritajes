class CarInspection < ApplicationRecord
  belongs_to :car_expert
  belongs_to :car
  has_many :car_answers
  has_many :inspection_comments

  accepts_nested_attributes_for :car, :car_answers, :inspection_comments

  def car_attributes=(attributes)
    binding.pry
    if attributes[:id].present?
      self.car = Car.find(attributes[:id])
    end
    super
  end
end
