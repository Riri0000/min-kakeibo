class UserProfilesController < ApplicationController
  def new
    @user_profile = UserProfile.new
  end

  def create
    @user_profile = current_user.build_user_profile(user_profile_params)
    if @user_profile.save
      # 続けて家計簿の登録を行う動線にする
      redirect_to user_profile_path(@user_profile), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def show
    @user_profile = UserProfile.find(params[:id])
  end

  private

  def user_profile_params
    params.require(:user_profile).permit(:age, :job, :total_assets, :annual_income, :monthly_income, :household_member, :message)
  end
end
