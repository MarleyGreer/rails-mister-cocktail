class Ingredient < ApplicationRecord
  has_many :doses
  validates_presence_of :name
  validates :name, uniqueness: true
end
