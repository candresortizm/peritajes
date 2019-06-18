class InspectionPhoto < ApplicationRecord
  belongs_to :car_inspection

  mount_uploader :image, ImageUploader
end
