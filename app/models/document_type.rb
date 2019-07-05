class DocumentType < ApplicationRecord
  validates :name, presence: true
  validates :key, presence: true, uniqueness: true
  validates :process_type, presence: true

  has_many :car_documents
end
