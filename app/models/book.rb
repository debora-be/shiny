class Book < ApplicationRecord
  belongs_to :author

  validates :title, uniqueness: true
end
