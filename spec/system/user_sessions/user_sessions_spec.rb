require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  describe 'ログイン機能' do
    let(:user) { create(:user) }

    context 'メールアドレスとパスワードが一致しているとき' do
      it 'ログインに成功する' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'password'
        find('#login-button').click
        expect(page).to have_content('ログインしました')
        expect(current_path).to eq account_books_path
      end
    end

    context 'パスワードが誤っているとき' do
      it 'ログインに失敗する' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'wrongpassword'
        find('#login-button').click
        expect(page).to have_content('ログインに失敗しました')
        expect(current_path).to eq login_path
      end
    end

    describe 'ゲストログイン機能' do
      let(:guest) { create(:user, :guest) }

      xit '正常にログインできること' do
        guest
        visit root_path
        click_on 'お試しログイン'
        expect(page).to have_content('ゲストとしてログインしました')
        expect(current_path).to eq account_books_path
      end

      it 'ユーザー更新に失敗すること' do
        login(guest)
        visit edit_user_path(guest)
        click_on '更新する'
        expect(page).to have_content('ゲストユーザーの変更はできません')
        expect(current_path).to eq account_books_path
      end

      it 'ユーザー退会に失敗すること' do
        login(guest)
        visit edit_user_path(guest)
        click_on '退会する'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content('ゲストユーザーの退会はできません')
        expect(current_path).to eq account_books_path
      end
    end
  end
end
