class Question < ApplicationRecord
  validates :text_query, presence: true
  validates :question_type, presence: true
  validates :points, presence: true
  validates :order_question, presence: true
  validates :key, presence: true, uniqueness: true
  
  belongs_to :question_category
  has_many :car_answers
end
