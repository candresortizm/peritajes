class Brand < ApplicationRecord
  has_many :brand_admins
  has_many :car_experts
  has_many :dispatchers
end
