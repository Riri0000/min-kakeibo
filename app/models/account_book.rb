class AccountBook < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :expenses, reject_if: :all_blank, allow_destroy: true
  validates :date, presence: true
  validate :date_cannot_be_in_the_future

  # N+1対策 今後考える
  scope :order_by_expenses, -> { joins({ expenses: :expense_item }).includes({ expenses: :expense_item }).group(:name).order('sum_expenditure DESC').sum(:expenditure) }
  # scope :order_by_expense_item_group, -> { includes(:expense_item).group(:name).order('sum_expenditure DESC').sum(:expenditure) }

  # 家計簿は未来日付はNG
  def date_cannot_be_in_the_future
    return unless date.future?

    errors.add(:date, 'can not select future date')
  end
end
