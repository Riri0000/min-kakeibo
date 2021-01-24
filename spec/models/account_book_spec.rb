require 'rails_helper'

RSpec.describe AccountBook, type: :model do
  it '有効なファクトリを持つこと' do
    expect(build(:account_book)).to be_valid
  end

  it '全ての値が正常だったら、登録できること' do
    account_book = build(:account_book)
    account_book.valid?
    expect(account_book.errors).to be_empty
  end

  it '日付が未来の場合、登録に失敗すること' do
    account_book = create(:account_book)
    account_book.date = 1.month.since
    account_book.valid?
    expect(account_book.errors[:date]).to include("は、現在〜過去を選択してください。")
  end

  it 'monthly_incomeが999_999_999以上のときは登録できないこと' do
    account_book = build(:account_book)
    account_book.monthly_income = 1_000_000_000
    account_book.valid?
    expect(account_book.errors[:monthly_income]).to include("は999999999より小さい値にしてください")
  end
end
