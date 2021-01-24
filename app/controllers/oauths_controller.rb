class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    # 認証をキャンセルしたときの処理
    if params[:denied].present?
      redirect_to root_path, info: 'ログインをキャンセルしました'
      return
    end
    if (@user = login_from(provider))
      redirect_to account_books_path, success: "#{provider.titleize}でログインしました"
    else
      begin
        @user = create_from(provider)
        @user.download_and_attach_profile_image(@user.profile_image)
        reset_session
        auto_login(@user)
        redirect_to new_user_profile_path, success: "#{provider.titleize}でログインしました"
      rescue StandardError
        redirect_to root_path, danger: "#{provider.titleize}のログインに失敗しました"
      end
    end
  end
end
