class Expense < ApplicationRecord
  belongs_to :account_book
  belongs_to :expense_item
end
