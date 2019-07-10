class Dispatcher < User
  belongs_to :concessionaire
  has_many :car_processes
end
