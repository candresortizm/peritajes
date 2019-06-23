class CarDocument < ApplicationRecord
  belongs_to :document_type
  belongs_to :car_process

  mount_uploader :document, CarDocumentUploader
end
