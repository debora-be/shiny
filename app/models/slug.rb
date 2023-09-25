class Slug < ApplicationRecord
  has_one :book  

  validates :slug, presence: true
end
