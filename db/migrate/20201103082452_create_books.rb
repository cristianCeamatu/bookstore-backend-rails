class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, limit: 40, null: false
      t.string :author, limit: 40, null: false
      t.integer :percent
      t.integer :current_chapter

      t.timestamps
    end
  end
end
