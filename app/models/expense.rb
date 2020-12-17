class Expense < ApplicationRecord
  belongs_to :account_book
  belongs_to :expense_item

  validates :expenditure, presence: true, numericality: { only_integer: true, greater_than: 1, less_than: 99_999_999 }
  validates :note, length: { maximum: 10 }

  # 支出額合計をグループ化し、降順に
  scope :order_by_expense_item_group, -> { includes(:expense_item).group(:name).order('sum_expenditure DESC').sum(:expenditure)}
end
