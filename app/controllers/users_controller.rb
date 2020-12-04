class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)

    if @user.save
      # 一覧画面へリダイレクト（まだ作ってないので、とりあえずrootへ)＆サクセスメッセージ
      flash[:success] = 'ユーザー登録しました'
      redirect_to root_path
    else
      flash[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end
end
