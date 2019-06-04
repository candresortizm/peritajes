class Document < ApplicationRecord
  belong_to :document_type
  belong_to :car
end
