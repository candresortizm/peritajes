class Question < ApplicationRecord
  belongs_to :question_category
  has_many :car_answers
end
