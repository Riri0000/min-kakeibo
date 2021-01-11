class ChangeIntegerLimitInExpense < ActiveRecord::Migration[6.0]
  def change
    change_column :expenses, :expenditure, :integer, limit: 5
  end
end
