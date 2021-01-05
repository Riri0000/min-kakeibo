require 'rails_helper'

RSpec.describe "Admins", type: :system do
  let(:general) { create :user }
  let(:admin) { create :user, :admin }

  describe '管理画面へのアクセス' do
    context '一般ユーザーの場合' do
      context 'ログイン前' do
        it '管理画面へのアクセスが失敗する' do
          general
          visit rails_admin_path
          expect(current_path).to eq login_path
          expect(page).to have_content 'ログインしてください'
        end
      end
      context 'ログイン後' do
        it '管理画面へのアクセスが失敗する' do
          login(general)
          visit rails_admin_path
          expect(current_path).to eq account_books_path
        end
      end
    end

    context '管理者の場合' do
      context '管理者の場合' do
        context 'ログイン前' do
          it '管理画面へのアクセスが失敗する' do
            admin
            visit rails_admin_path
            expect(current_path).to eq login_path
            expect(page).to have_content 'ログインしてください'
          end
        end
        context 'ログイン後' do
          it '管理画面へのアクセスが成功する' do
            login(admin)
            visit rails_admin_path
            expect(current_path).to eq rails_admin_path
          end
        end
      end
    end
  end
end
