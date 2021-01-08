class AddColumnToAccountBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :account_books, :likes_count, :integer
  end
end
