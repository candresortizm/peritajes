class Dispatcher < User
  belongs_to :brand
  has_many :car_processes
end
