class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account_book, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :account_book_id], unique: true
    end
  end
end
