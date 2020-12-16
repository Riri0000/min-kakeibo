require 'rails_helper'

RSpec.describe AccountBook, type: :model do
  it '日付が選択されていれば、正常に登録できる' do
    account_book = build(:account_book)
    account_book.valid?
    expect(account_book.errors).to be_empty
  end

  it '日付が選択されていない場合、登録に失敗すること' do
    account_book = create(:account_book)
    account_book.date = nil
    account_book.valid?
    expect(account_book.errors[:date]).to include("を入力してください")
  end
end
