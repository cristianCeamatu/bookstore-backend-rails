class AddPercentToBooks < ActiveRecord::Migration[6.0]

  def change

    add_column :books, :percent, :integer

  end

end

