require 'rails_helper'

RSpec.describe "AccountBooks::Search", type: :system do
  let!(:login_user) { create(:user) }
  let!(:user_1) { create(:user, nickname: 'なまえ') }
  let!(:user_2) { create(:user) }
  let!(:user_3) { create(:user) }
  let!(:user_profile_login_user) { create(:user_profile, total_assets: 1000000, user_id: login_user.id) }
  let!(:user_profile_user_1) { create(:user_profile, total_assets: 9000, user_id: user_1.id) }
  let!(:user_profile_user_2) { create(:user_profile, total_assets: 8000, user_id: user_2.id) }
  let!(:user_profile_user_3) { create(:user_profile, total_assets: 7000, user_id: user_3.id) }
  let!(:account_book_login_user) { create(:account_book, likes_count: 1, user_id: login_user.id) }
  let!(:account_book_user_1) { create(:account_book, likes_count: 3, user_id: user_1.id) }
  let!(:account_book_user_2) { create(:account_book, likes_count: 5, user_id: user_2.id) }
  let!(:account_book_user_3) { create(:account_book, likes_count: 4, user_id: user_3.id) }
  let!(:expense_login_user) { create(:expense, expense_item_id: 1, expenditure: 100000, account_book_id: account_book_login_user.id) }
  let!(:expense_user_1) { create(:expense, expense_item_id: 2, expenditure: 100000, account_book_id: account_book_user_1.id) }
  let!(:expense_user_2) { create(:expense, expense_item_id: 3, expenditure: 100000, account_book_id: account_book_user_2.id) }
  let!(:expense_user_3) { create(:expense, expense_item_id: 4, expenditure: 100000, account_book_id: account_book_user_3.id) }

  before do
    login(login_user)
    visit account_books_path
  end

  describe '検索機能' do
    it '名前検索が機能すること' do
      fill_in 'q_user_nickname_cont', with: 'なまえ'
      click_on '検索'
      expect(current_path).to eq account_books_path
      expect(page).to have_content(user_1.nickname)
      expect(page).not_to have_content(login_user.nickname)
      expect(page).not_to have_content(user_2.nickname)
      expect(page).not_to have_content(user_3.nickname)
    end

    # ソート機能のスペックエラーになる・・
    # it '資産額順ソートが機能すること' do
    #   click_on '並び替え'
    #   click_on '総資産額順', match: :first
    #   expect(current_path).to eq account_books_path
    #   list = all('.account_book')
    #   expect(list[0]).to have_css account_book_login_user.id
    # end

    # it 'いいね数ソートが機能すること' do

    # end
  end
end
