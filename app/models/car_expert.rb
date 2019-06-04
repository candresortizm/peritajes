class CarExpert < User
  belongs_to :brand
  has_many :car_inspections
end
