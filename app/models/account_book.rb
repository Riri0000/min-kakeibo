class AccountBook < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy
  has_many :expense_items, through: :expenses
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :expenses, allow_destroy: true, reject_if: proc { |attributes| attributes['expenditure'].nil? }

  validates :date, presence: true
  validate :date_cannot_be_in_the_future

  # N+1対策 家計簿毎の支出合計(動くけど、ransackとMySQLエラーで怒られる)
  # scope :sum_per_id, -> { joins(:expenses).select("account_books.*, SUM(expenses.expenditure) as sum_ab").group(:id) }
  # N+1対策 費目毎の支出合計（ドーナツグラフ描写部分）
  # scope :sum_per_item, -> { joins(:expense_items)
  #                           .select("account_books.*, SUM(expenses.expenditure) as expenditure_of_item")
  #                           .group("account_books.id, expense_items.name")
  #                           .order('expenditure_of_item desc') }

  # 家計簿は未来日付はNG
  def date_cannot_be_in_the_future
    return unless date.future?

    errors.add(:date, :invalid_date)
  end
end
