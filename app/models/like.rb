class Like < ApplicationRecord
  belongs_to :user
  belongs_to :account_book, counter_cache: :likes_count
  validates :user_id, uniqueness: { scope: :account_book_id }
end
