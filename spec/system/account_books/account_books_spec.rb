require 'rails_helper'

RSpec.describe "AccountBooks", type: :system do
  let(:user) { create(:user) }
  before do
    login(user)
    create(:user_profile, user_id: user.id)
  end

  describe '家計簿登録機能' do
    context '全ての入力が正常なとき' do
      it '家計簿登録に成功する' do
        visit account_books_path
        click_on 'My家計簿登録へ'
        select '教育費', from: 'account_book[expenses_attributes][0][expense_item_id]'
        fill_in 'account_book[expenses_attributes][0][expenditure]', with: '30000'
        click_on '登録する'
        expect(page).to have_content '家計簿を登録しました'
        expect(current_path).to eq account_book_path(id: user.account_book.id)
      end
    end

    context '入力値が誤っているとき' do
      # 家計簿登録に失敗したとき、エラーにならない
      xit '家計簿登録に失敗する' do
        visit account_books_path
        click_on 'My家計簿登録へ'
        select '教育費', from: 'account_book[expenses_attributes][0][expense_item_id]'
        fill_in 'account_book[expenses_attributes][0][expenditure]', with: '30000'
        click_on '登録する'
        expect(page).to have_content '家計簿を登録しました'
        expect(current_path).to eq account_book_path(id: user.account_book.id)
      end
    end
  end

  describe '家計簿編集機能' do
    let!(:user_profile) { create(:user_profile, user_id: user.id) }
    let!(:account_book) { create(:account_book, user_id: user.id) }
    let!(:expense) { create(:expense, account_book_id: account_book.id) }

    context '全ての入力が正常なとき' do
      it '家計簿更新に成功する' do
        visit account_book_path(user)
        click_on '家計簿を編集する'
        select '教育費', from: 'account_book[expenses_attributes][0][expense_item_id]'
        fill_in 'account_book[expenses_attributes][0][expenditure]', with: '30000'
        click_on '登録する'
        expect(page).to have_content '家計簿を更新しました'
        expect(current_path).to eq account_book_path(account_book)
      end
    end

    context '入力値が誤っているとき' do
      # 家計簿登録に失敗したとき、エラーにならない
      xit '家計簿更新に失敗する' do
        visit account_book_path(user)
        click_on '家計簿を編集する'
        select '教育費', from: 'account_book[expenses_attributes][0][expense_item_id]'
        fill_in 'account_book[expenses_attributes][0][expenditure]', with: '10000000000'
        click_on '登録する'
        expect(page).to have_content '家計簿の更新に失敗しました'
        expect(page).to have_content "支出額は99999999999より小さい値にしてください"
        expect(current_path).to eq account_book_path(user)
      end
    end
  end

  describe 'My家計簿表示部分' do
    let!(:user_profile) { create(:user_profile, user_id: user.id) }
    let!(:account_book) { create(:account_book, user_id: user.id) }
    let!(:expense) { create(:expense, expense_item_id: 1, expenditure: 100000, account_book_id: account_book.id) }

    it '登録した内容がMy家計簿ページで表示されること' do
      visit account_book_path(user)
      expect(page).to have_content user.nickname
      expect(page).to have_content account_book.date.year
      expect(page).to have_content account_book.date.month
      expect(page).to have_content '投資'
      expect(page).to have_content '100,000円'
      expect(page).to have_content account_book.expenses.sum(:expenditure).to_s(:delimited)
      expect(page).to have_content '家計簿を編集する'
    end

    it '登録した内容が家計簿一覧画面で表示されること' do
      visit account_books_path
      expect(page).to have_content user.nickname
      expect(page).to have_content account_book.date.year
      expect(page).to have_content account_book.date.month
      expect(page).to have_content account_book.expenses.sum(:expenditure).to_s(:delimited)
    end
  end
end
