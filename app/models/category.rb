class Category < ApplicationRecord
  has_ancestry
  has_many :items
  validates :name, uniqueness: true
end
