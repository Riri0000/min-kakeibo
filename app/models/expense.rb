class Expense < ApplicationRecord
  belongs_to :account_book
  belongs_to :expense_item

  validates :expenditure, presence: true, numericality: { only_integer: true, greater_than: 1, less_than: 99_999_999 }
  validates :note, length: { maximum: 10 }
end
