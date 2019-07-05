class CarDocument < ApplicationRecord
  validates :state, presence: true
  validates :document, presence: true
  
  belongs_to :document_type
  belongs_to :car_process

  mount_uploader :document, CarDocumentUploader
end
