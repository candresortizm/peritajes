class CarProcess < ApplicationRecord
  belong_to :car
  belong_to :dispatcher
end
