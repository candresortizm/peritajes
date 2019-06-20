class CarProcess < ApplicationRecord
  belongs_to :car
  belongs_to :dispatcher
end
