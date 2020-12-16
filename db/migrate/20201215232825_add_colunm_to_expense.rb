class AddColunmToExpense < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :note, :string, limit: 10
  end
end
