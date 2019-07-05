class CarAnswer < ApplicationRecord
  belongs_to :car_inspection
  belongs_to :question
end
