class Expense < ApplicationRecord
  belongs_to :account_book
  belongs_to :expense_item

  validates :expenditure, presence: true, numericality: { only_integer: true, less_than: 99_999_999 }
end
