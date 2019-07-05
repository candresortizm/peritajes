class CarProcess < ApplicationRecord
  validates :state, presence: true
  validates :process_type, presence: true
  belongs_to :car
  belongs_to :dispatcher
  has_many :car_documents

  accepts_nested_attributes_for :car
  # accepts_nested_attributes_for :car_documents
  accepts_nested_attributes_for :car_documents, reject_if: proc { |attributes| attributes['document'].blank? }
end
