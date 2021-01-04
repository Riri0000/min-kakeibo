require 'rails_helper'

RSpec.describe '共通系', type: :system do
  let(:user) { create(:user) }

  describe 'ヘッダーの表示' do
    context 'ログイン前' do
      it 'ヘッダーが正しく表示されている' do
        visit root_path
        expect(page).to have_content('ログイン')
        expect(page).to have_content('ユーザー登録')
      end
    end

    context 'ログイン後かつプロフィール登録前' do
      before { login(user) }

      it 'ヘッダーが正しく表示されている' do
        visit account_books_path
        expect(page).to have_content('みんなの家計簿へ')
        expect(page).to have_content('Myプロフィール登録へ')
        click_on 'Menu'
        expect(page).to have_content('ログアウト')
        expect(page).to have_content('お気に入り家計簿')
        expect(page).to have_content('ユーザー情報編集')
      end
    end

    context 'ログイン後かつプロフィール登録後' do
      before do
        login(user)
        create(:user_profile, user_id: user.id)
      end

      it 'ヘッダーが正しく表示されている' do
        visit account_books_path
        expect(page).to have_content('みんなの家計簿へ')
        expect(page).to have_content('My家計簿登録へ')
        click_on 'Menu'
        expect(page).to have_content('ログアウト')
        expect(page).to have_content('お気に入り家計簿')
        expect(page).to have_content('ユーザー情報編集')
      end
    end

    context 'ログイン後かつプロフィール＆家計簿登録後' do
      before do
        login(user)
        create(:user_profile, user_id: user.id)
        create(:account_book, user_id: user.id)
      end

      it 'ヘッダーが正しく表示されている' do
        visit account_books_path
        expect(page).to have_content('みんなの家計簿へ')
        expect(page).to have_content('My家計簿')
        click_on 'Menu'
        expect(page).to have_content('ログアウト')
        expect(page).to have_content('お気に入り家計簿')
        expect(page).to have_content('ユーザー情報編集')
      end
    end
  end
end
