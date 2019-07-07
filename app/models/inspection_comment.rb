class InspectionComment < ApplicationRecord
  validates :comment, presence: true

  belongs_to :car_inspection
  belongs_to :question_category
end
