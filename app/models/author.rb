class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, uniqueness: true
end
