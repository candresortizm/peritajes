class InspectionPhoto < ApplicationRecord
  validates :image, presence: true
  belongs_to :car_inspection

  mount_uploader :image, ImageUploader
end
