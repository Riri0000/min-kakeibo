class AddNewColumnToAccountBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :account_books, :monthly_income, :integer, limit: 5
  end
end
