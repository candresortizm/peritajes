class Concessionaire < ApplicationRecord
  validates :name, presence: true
  validates :nit, presence: true, uniqueness: true

  has_many :concessionaire_admins
  has_many :car_experts
  has_many :dispatchers

  accepts_nested_attributes_for :concessionaire_admins
end
