# frozen_string_literal: true

class BookCategory < ApplicationRecord
  belongs_to :book
  belongs_to :category

  validates :book_id, presence: true
  validates :category_id, presence: true
end
