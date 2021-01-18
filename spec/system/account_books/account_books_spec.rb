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
      it '家計簿登録に失敗する' do
        visit account_books_path
        click_on 'My家計簿登録へ'
        select '教育費', from: 'account_book[expenses_attributes][0][expense_item_id]'
        fill_in 'account_book[expenses_attributes][0][expenditure]', with: ''
        click_on '登録する'
        expect(page).to have_content '家計簿の登録に失敗しました'
        expect(page).to have_content '支出額を入力してください'
        expect(page).to have_content '支出額は数値で入力してください'
        expect(current_path).to eq account_books_path
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
      it '家計簿更新に失敗する' do
        visit account_book_path(user)
        click_on '家計簿を編集する'
        select '教育費', from: 'account_book[expenses_attributes][0][expense_item_id]'
        fill_in 'account_book[expenses_attributes][0][expenditure]', with: '10000000000'
        click_on '登録する'
        expect(page).to have_content '家計簿の更新に失敗しました'
        expect(page).to have_content "支出額は99999999より小さい値にしてください"
        expect(current_path).to eq account_book_path(account_book)
      end
    end
  end

  describe '家計簿表示部分' do
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

    it '登録した内容が家計簿詳細ページで表示されること' do
      visit dashboard_path(account_book)
      expect(page).to have_content user.nickname
      expect(page).to have_content account_book.date.year
      expect(page).to have_content account_book.date.month
      expect(page).to have_content '投資'
      expect(page).to have_content '100,000円'
      expect(page).to have_content account_book.expenses.sum(:expenditure).to_s(:delimited)
    end

    it '登録した内容が家計簿一覧画面で表示されること' do
      visit account_books_path
      expect(page).to have_content user.nickname
      expect(page).to have_content account_book.date.year
      expect(page).to have_content account_book.date.month
      expect(page).to have_content account_book.expenses.sum(:expenditure).to_s(:delimited)
    end
  end

  describe '家計簿計算部分' do
    let!(:user_profile) { create(:user_profile, user_id: user.id) }
    let!(:account_book) { create(:account_book, user_id: user.id) }
    let!(:expense_1) { create(:expense, expense_item_id: 1, expenditure: 10000, account_book_id: account_book.id) }
    let!(:expense_2) { create(:expense, expense_item_id: 1, expenditure: 5000, account_book_id: account_book.id) }
    let!(:expense_3) { create(:expense, expense_item_id: 2, expenditure: 2000, account_book_id: account_book.id) }
    let!(:expense_4) { create(:expense, expense_item_id: 2, expenditure: 3000, account_book_id: account_book.id) }
    let!(:expense_5) { create(:expense, expense_item_id: 3, expenditure: 4000, account_book_id: account_book.id) }
    let!(:expense_6) { create(:expense, expense_item_id: 4, expenditure: 5000, account_book_id: account_book.id) }

    it '家計簿一覧画面に計算内容が正しく表示される' do
      visit account_books_path
      expect(page).to have_selector 'tspan', text: '29,000円'
    end

    it '家計簿詳細画面に計算内容が支出額順に正しく表示される' do
      visit dashboard_path(account_book)
      expect(page).to have_selector 'tspan', text: '29,000円'
      trs = all('tbody tr')
      expect(trs[0]).to have_content '投資'
      expect(trs[0]).to have_content '15,000円'
      expect(trs[1]).to have_content '貯金'
      expect(trs[1]).to have_content '5,000円'
      expect(trs[2]).to have_content '食費'
      expect(trs[2]).to have_content '5,000円'
      expect(trs[3]).to have_content '住居費'
      expect(trs[3]).to have_content '4,000円'
    end

    it 'My家計簿画面に計算内容が支出額順に正しく表示される' do
      visit account_book_path(account_book)
      expect(page).to have_selector 'tspan', text: '29,000円'
      trs = all('tbody tr')
      expect(trs[0]).to have_content '投資'
      expect(trs[0]).to have_content '15,000円'
      expect(trs[1]).to have_content '貯金'
      expect(trs[1]).to have_content '5,000円'
      expect(trs[2]).to have_content '食費'
      expect(trs[2]).to have_content '5,000円'
      expect(trs[3]).to have_content '住居費'
      expect(trs[3]).to have_content '4,000円'
    end
  end
end
