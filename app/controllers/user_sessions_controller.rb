class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to account_books_path, success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.logout')
  end

  def guest_login
    user = User.find_by(role: :guest)
    auto_login(user)
    redirect_to account_books_path, success: t('.success')
  end
end
