class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer :expenditure, null: false, limit: 4
      t.references :account_book, null: false, foreign_key: true
      t.references :expense_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
