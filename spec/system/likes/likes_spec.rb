require 'rails_helper'

RSpec.describe "Likes", type: :system do
  let!(:user) { create(:user) }
  let!(:user_profile) { create(:user_profile, user_id: user.id) }
  let!(:account_book) { create(:account_book, user_id: user.id) }
  let!(:expense) { create(:expense, expense_item_id: 1, expenditure: 100000, account_book_id: account_book.id) }

  before do
    login(user)
    visit account_books_path
  end

  it 'いいねができること', js: true do
    find('.far').click
    expect(page).to have_css '.fas'
    expect(page).to have_css("#js-like-btn-for-#{account_book.id}[data-method='delete']")
  end

  it 'いいねを外せること', js: true do
    find('.far').click
    find('.fas').click
    expect(page).to have_css '.far'
    expect(page).to have_css("#js-like-btn-for-#{account_book.id}[data-method='post']")
  end
end
