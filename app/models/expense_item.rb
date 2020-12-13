class ExpenseItem < ApplicationRecord
  has_many :expenses

  validates :name, presense: true, length: { in: 1..16 }
end
