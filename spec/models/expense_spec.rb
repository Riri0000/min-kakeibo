require 'rails_helper'

RSpec.describe Expense, type: :model do
  it '値が有効な場合、正常に登録できること' do
    expense = build(:expense)
    expect(expense).to be_valid
    expect(expense.errors).to be_empty
  end

  it '値が最大値を超えるとき、登録に失敗すること' do
    expense = create(:expense)
    expense.expenditure = 100_000_000
    expense.valid?
    expect(expense.errors[:expenditure]).to include("は99999999より小さい値にしてください")
  end
end
