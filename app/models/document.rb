class Document < ApplicationRecord
  belongs_to :document_type
  belongs_to :car
end
