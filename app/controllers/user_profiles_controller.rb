class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: %i[edit update destroy]

  def new
    @user_profile = UserProfile.new
  end

  def edit; end

  def create
    @user_profile = current_user.build_user_profile(user_profile_params)
    if @user_profile.save
      # 続けて家計簿の登録を行う動線にする
      redirect_to new_account_book_path(@user_profile.user_id), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def update
    if @user_profile.update(user_profile_params)
      redirect_to account_book_path(@user_profile.user_id), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy; end

  private

  def set_user_profile
    @user_profile = UserProfile.find_by(user_id: current_user.id)
  end

  def user_profile_params
    params.require(:user_profile).permit(:age,
                                         :job,
                                         :residence,
                                         :total_assets,
                                         :annual_income,
                                         :household_member,
                                         :message)
  end
end
