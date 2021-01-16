class ExpenseItem < ApplicationRecord
  has_many :expenses
  has_many :account_books, through: :expenses
  
  validates :name, presence: true, length: { in: 1..16 }
end
