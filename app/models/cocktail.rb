class Cocktail < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many_attached :photos, dependent: :destroy
  validates_presence_of :name
  validates :photos, presence: { message: ": You must upload at least 1 Cocktail Image!" }
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }
  validates :name, length: { maximum: 40 }
  validates :description, length: { minimum: 40 }
  validates :description, length: { maximum: 500 }
end
