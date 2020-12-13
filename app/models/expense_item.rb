class ExpenseItem < ApplicationRecord
  validates :name, presense: true, length: { in: 1..16 }
end
