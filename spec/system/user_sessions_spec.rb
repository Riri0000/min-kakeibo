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
        expect(page).to have_selector '.alert-success', text: 'ログインしました'
        expect(current_path).to eq root_path
      end
    end

    context 'パスワードが誤っているとき' do
      it 'ログインに失敗する' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'wrongpassword'
        find('#login-button').click
        expect(page).to have_selector '.alert-danger', text: 'ログインに失敗しました'
        expect(current_path).to eq login_path
      end
    end
  end
end
