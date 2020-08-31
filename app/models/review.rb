class Review < ApplicationRecord
  belongs_to :cocktail
  validates_presence_of :title, :user, :content, :rating
  validates :user, uniqueness: true
  validates :user, length: { minimum: 2 }
  validates :content, length: { minimum: 20 }
  validates :content, length: { maximum: 500 }
  validates :title, length: { maximum: 100 }
  validates :title, length: { minimum: 3 }
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false }
end
