class CarProcess < ApplicationRecord
  belongs_to :car
  belongs_to :dispatcher
  has_many :car_documents

  accepts_nested_attributes_for :car
  accepts_nested_attributes_for :car_documents
  # accepts_nested_attributes_for :documents, reject_if: proc { |attributes| attributes['document'].blank? && attributes['comment'].eql?("") }
end
