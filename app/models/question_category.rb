class QuestionCategory < ApplicationRecord
  has_many :questions
  has_many :inspection_comments
end
