class CarProcess < ApplicationRecord
  belongs_to :car
  belongs_to :dispatcher

  accepts_nested_attributes_for :car
end
