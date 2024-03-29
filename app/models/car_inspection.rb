class CarInspection < ApplicationRecord
  validates :kilometraje, presence: true
  validates :state, presence: true
  validates :owner, presence: true

  belongs_to :car_expert
  belongs_to :car
  has_many :car_answers
  has_many :inspection_comments
  has_many :inspection_photos

  accepts_nested_attributes_for :car
  accepts_nested_attributes_for :car_answers
  accepts_nested_attributes_for :inspection_comments, reject_if: proc { |attributes| attributes['comment'].eql?("") }
  accepts_nested_attributes_for :inspection_photos, reject_if: proc { |attributes| attributes['image'].blank? }

  mount_uploader :photo_front, ImageUploader
  mount_uploader :photo_right, ImageUploader
  mount_uploader :photo_back, ImageUploader
  mount_uploader :photo_left, ImageUploader
  mount_uploader :photo_motor, ImageUploader
  mount_uploader :photo_inside, ImageUploader

  def next_step
    new_state = nil
    if self.completed_tabs.size.eql?(8)
      new_state = "completed"
    end
    new_state
  end

end
