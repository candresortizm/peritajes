class InspectionComment < ApplicationRecord
  belongs_to :car_inspection
  belongs_to :question_category
end
