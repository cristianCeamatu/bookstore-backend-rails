class ChangePercentAndChapterFromBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :percent, :string
    change_column :books, :current_chapter, :string
  end
end
