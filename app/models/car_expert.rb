class CarExpert < User
  belongs_to :concessionaire
  has_many :car_inspections
end
