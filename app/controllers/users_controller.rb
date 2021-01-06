class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :set_user, only: %i[edit update destroy]
  before_action :check_guest, only: %i[update destroy]

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to account_books_path, success: t('.success')
    else
      flash[:error] = t('.fail')
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to account_books_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to root_path, success: t('.success')
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  def check_guest
    return unless current_user.guest?

    redirect_to account_books_path, info: t('.info')
  end
end
