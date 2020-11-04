class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, limit: 40, null: false
      t.string :author, limit: 40, null: false
      t.string :percent, null: false
      t.string :current_chapter
      t.string :category, null: false

      t.timestamps
    end
  end
end
