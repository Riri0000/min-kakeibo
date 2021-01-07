require 'rails_helper'

RSpec.describe "UserProfiles", type: :system do
  let(:user) { create(:user) }
  before { login(user) }

  describe 'ユーザープロフィール登録機能' do
    context '全ての入力が正常なとき' do
      it 'ユーザープロフィール登録に成功する' do
        visit new_user_profile_path
        select '50', from: 'user_profile_age'
        fill_in '職業', with: '会社員'
        select '北海道', from: 'user_profile_residence'
        fill_in '総資産', with: '5000000'
        fill_in '年収（額面)', with: '4000000'
        fill_in '月収（手取り)', with: '300000'
        select '親と同居', from: 'user_profile_household_member'
        fill_in 'user_profile[message]', with: 'よろしくおねがいします'
        click_on 'プロフィール登録'
        expect(page).to have_content 'プロフィールを登録しました'
        expect(current_path).to eq new_account_book_path(user)
      end
    end

    context '全ての入力が未入力のとき' do
      it 'ユーザープロフィール登録に成功する' do
        visit new_user_profile_path
        click_on 'プロフィール登録'
        expect(page).to have_content 'プロフィールを登録しました'
        expect(current_path).to eq new_account_book_path(user)
      end
    end

    context '入力値が誤っているとき' do
      it 'ユーザープロフィール登録に失敗する' do
        visit new_user_profile_path
        fill_in '総資産', with: '100_000_000_000'
        fill_in '年収（額面)', with: '1_000_000_000'
        fill_in '月収（手取り)', with: '1_000_000_000'
        fill_in 'user_profile[message]', with: 'あ' * 145
        click_on 'プロフィール登録'
        expect(page).to have_content 'プロフィール登録に失敗しました'
        expect(page).to have_content "総資産は99999999999より小さい値にしてください"
        expect(page).to have_content "年収（額面)は999999999より小さい値にしてください"
        expect(page).to have_content "月収（手取り)は999999999より小さい値にしてください"
        expect(page).to have_content "ひとことは144文字以内で入力してください"
        expect(current_path).to eq user_profiles_path
      end
    end
  end

  describe 'ユーザープロフィール編集機能' do
    before do
      create(:user_profile, user_id: user.id)
      create(:account_book, user_id: user.id)
    end

    context '全ての入力値が正常なとき' do
      it 'ユーザープロフィール更新に成功する' do
        visit account_book_path(user)
        click_on 'プロフィールを編集する'
        select '50', from: 'user_profile_age'
        fill_in '職業', with: '会社員'
        select '北海道', from: 'user_profile_residence'
        fill_in '総資産', with: '5000000'
        fill_in '年収（額面)', with: '4000000'
        fill_in '月収（手取り)', with: '300000'
        select '親と同居', from: 'user_profile_household_member'
        fill_in 'user_profile[message]', with: 'よろしくおねがいします'
        click_on 'プロフィール登録'
        expect(page).to have_content 'プロフィールを更新しました'
        expect(current_path).to eq account_book_path(user)
      end
    end
  end

  describe 'プロフィール表示部分' do
    let!(:user_profile) { create(:user_profile, user_id: user.id) }
    let!(:account_book) { create(:account_book, user_id: user.id) }
    let!(:expense) { create(:expense, account_book_id: account_book.id) }

    it '登録した内容がMy家計簿ページで表示されること' do
      visit account_book_path(user)
      expect(page).to have_content user.nickname
      expect(page).to have_content user_profile.age
      expect(page).to have_content user_profile.job
      expect(page).to have_content show_money(user_profile.total_assets)
      expect(page).to have_content show_money(user_profile.annual_income)
      expect(page).to have_content show_money(user_profile.monthly_income)
      expect(page).to have_content user_profile.residence
      expect(page).to have_content user_profile.household_member_i18n
      expect(page).to have_content user_profile.message
      expect(page).to have_content 'プロフィールを編集する'
    end

    it '登録した内容が家計簿一覧画面で表示されること' do
      visit account_books_path
      expect(page).to have_content user.nickname
      expect(page).to have_content show_money(user_profile.total_assets)
      expect(page).to have_content show_money(user_profile.monthly_income)
    end
  end
end
