class CreateAccountBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :account_books do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
