class Book < ApplicationRecord
  belongs_to :slug  

  validates :title, uniqueness: true
  validates :uri, presence: true
end
