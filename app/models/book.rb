# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :book_categories, dependent: :destroy, foreign_key: 'book_id'
  has_many :categories, through: :book_categories

  validates :title, presence: true, length: { minimum: 2, maximum: 40 }
  validates :author, presence: true, length: { minimum: 2, maximum: 40 }
  validates :current_chapter, allow_blank: true, numericality: { only_integer: true }
  validates :percent, presence: true, numericality: { less_than_or_equal_to: 100, only_integer: true }

  def append_categories(categories)
    categories.each do |category|
      @category = Category.find_or_create_by!(title: category)

      book_categories.find_or_create_by!(category_id: @category.id)
    end
  end
end
