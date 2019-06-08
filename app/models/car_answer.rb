class CarAnswer < ApplicationRecord
  belongs_to :car_instance

  # validates_presence_of :car_inspection_id, :content
end
