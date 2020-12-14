require 'rails_helper'

RSpec.describe ExpenseItem, type: :model do
  it '費目を登録できること' do
    expense_item = build(:expense_item)
    expect(expense_item).to be_valid
    expect(expense_item.errors).to be_empty
  end
end
