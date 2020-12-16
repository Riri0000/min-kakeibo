class ExpenseItem < ApplicationRecord
  has_many :expenses

  validates :name, presence: true, length: { in: 1..16 }
end
