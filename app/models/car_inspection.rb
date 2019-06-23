class CarInspection < ApplicationRecord
  belongs_to :car_expert
  belongs_to :car
  has_many :car_answers
  has_many :inspection_comments
  has_many :inspection_photos

  accepts_nested_attributes_for :car
  accepts_nested_attributes_for :car_answers
  accepts_nested_attributes_for :inspection_comments, reject_if: proc { |attributes| attributes['comment'].eql?("") }
  accepts_nested_attributes_for :inspection_photos, reject_if: proc { |attributes| attributes['image'].blank? }

end
