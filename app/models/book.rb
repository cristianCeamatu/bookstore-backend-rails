class Book < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2, maximum: 40 }

  validates :author, presence: true, length: { minimum: 2, maximum: 40 }
  
  validates :category, presence: true, length: { minimum: 2, maximum: 40 }

  validates :current_chapter, allow_blank: true, length: { minimum: 1, maximum: 3 }

  validates :percent, presence: true, length: { minimum: 1, maximum: 3 }
end
