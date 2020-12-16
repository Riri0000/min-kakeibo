class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      # 仮実装でroot_pathへ遷移。最終形はポスト一覧画面。
      redirect_back_or_to root_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.logout')
  end
end
