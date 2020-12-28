require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'ユーザー登録機能' do
    context '全ての入力が正常なとき' do
      it 'ユーザー登録に成功する' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'Test-user'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        find('#register-button').click
        expect(page).to have_content 'ユーザー登録しました'
        expect(current_path).to eq account_books_path
      end
    end

    context '各項目が未入力の場合' do
      it 'ユーザー登録に失敗する' do
        visit new_user_path
        fill_in 'ユーザー名', with: ''
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: ''
        fill_in 'パスワード確認', with: ''
        find('#register-button').click
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'ユーザー名を入力してください'
        expect(page).to have_content 'ユーザー名は1文字以上で入力してください'
        expect(page).to have_content 'メールアドレスを入力してください'
        expect(page).to have_content 'パスワードは8文字以上で入力してください'
        expect(page).to have_content 'パスワード確認を入力してください'
        expect(current_path).to eq users_path
      end
    end

    context 'emailが重複している場合' do
      it 'ユーザー登録に失敗する' do
        existed_user = create(:user)
        visit new_user_path
        fill_in 'ユーザー名', with: 'Test-user'
        fill_in 'メールアドレス', with: existed_user.email
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        find('#register-button').click
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'メールアドレスはすでに存在します'
        expect(current_path).to eq users_path
      end
    end

    context 'password-confirmationが一致しない場合' do
      it 'ユーザー登録に失敗する' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'Test-user'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'wrongpassword'
        find('#register-button').click
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'パスワード確認とパスワードの入力が一致しません'
        expect(current_path).to eq users_path
      end
    end

    context 'passwordが8文字未満の場合' do
      it 'ユーザー登録に失敗する' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'Test-user'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'p' * 7
        fill_in 'パスワード確認', with: 'p' * 7
        find('#register-button').click
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'パスワードは8文字以上で入力してください'
        expect(current_path).to eq users_path
      end
    end

    context 'passwordが17文字以上の場合' do
      it 'ユーザー登録に失敗する' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'Test-user'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'p' * 17
        fill_in 'パスワード確認', with: 'p' * 17
        find('#register-button').click
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'パスワードは16文字以内で入力してください'
        expect(current_path).to eq users_path
      end
    end
  end
end
