class Comment < ApplicationRecord
  belongs_to :book

  validates :text, presence: true, length: { minimum: 2 }
end
