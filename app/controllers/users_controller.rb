class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :set_user, only: %i[edit update destroy]

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
    @user.update(user_params)
    if @user.save
      redirect_to account_books_path, success: t('.success')
    else
      flash[:error] = t('.fail')
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
end
