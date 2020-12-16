class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    # 認証をキャンセルしたときの処理
    if params[:dinied].present?
      redirect_to root_path, info: 'ログインをキャンセルしました'
      return
    end
    if (@user = login_from(provider))
      redirect_to root_path, success: "#{provider.titleize}でログインしました"
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to root_path, success: "#{provider.titleize}でログインしました"
      rescue StandardError
        # binding.pry
        redirect_to root_path, error: "#{provider.titleize}のログインに失敗しました"
      end
    end
  end
end
