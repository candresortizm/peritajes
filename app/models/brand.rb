class Brand < ApplicationRecord
  validates :name, presence: true

  has_many :brand_admins
  has_many :car_experts
  has_many :dispatchers

  accepts_nested_attributes_for :brand_admins
end
