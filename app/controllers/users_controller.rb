class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[index new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # 一覧画面へリダイレクト（まだ作ってないので、とりあえずrootへ)＆サクセスメッセージ
      redirect_to root_path, success: t('.success')
    else
      flash[:danger] = t('.fail')
      render :new
    end
  end

  def edit; end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
end
