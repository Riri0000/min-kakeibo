class Like < ApplicationRecord
  belongs_to :user
  belongs_to :account_book
  validates :user_id, uniqueness: { scope: :account_book_id }
end
