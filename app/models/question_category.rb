class QuestionCategory < ApplicationRecord
  validates :name, presence: true
  validates :order_category, presence: true
  has_many :questions
  has_many :inspection_comments
end
