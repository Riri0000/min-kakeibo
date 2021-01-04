require 'rails_helper'

RSpec.describe AccountBook, type: :model do
  it '有効なファクトリを持つこと' do
    expect(build(:account_book)).to be_valid
  end

  it '日付が選択されていれば、正常に登録できる' do
    account_book = build(:account_book)
    account_book.valid?
    expect(account_book.errors).to be_empty
  end

  xit '日付が未来の場合、登録に失敗すること' do
    account_book = create(:account_book)
    account_book.date = Date.future
    account_book.valid?
    expect(account_book.errors[:date]).to include("")
  end
end
