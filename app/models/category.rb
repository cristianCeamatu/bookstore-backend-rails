# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :book_categories, dependent: :destroy, foreign_key: 'category_id'
  has_many :books, through: :book_categories

  validates :title, presence: true, length: { minimum: 2, maximum: 40 }
end
