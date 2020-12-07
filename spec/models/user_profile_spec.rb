require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  it '全て有効な値であれば、正常に登録できること' do
    user_profile = build(:user_profile)
    expect(user_profile).to be_valid
    expect(user_profile.errors).to be_empty
  end

  it 'message以外は未入力であっても登録できること' do
    user = create(:user)
    user_profile = user.build_user_profile(
      message: 'message_test'
    )
    expect(user_profile).to be_valid
    expect(user_profile.errors).to be_empty
  end

  it 'messageが144字以上のときは登録できないこと' do
    user_profile = build(:user_profile)
    user_profile.message = 'm' * 145
    user_profile.valid?
    expect(user_profile.errors[:message]).to include("は144文字以内で入力してください")
  end

  it 'jobが20字以上のときは登録できないこと' do
    user_profile = build(:user_profile)
    user_profile.job = 'j' * 21
    user_profile.valid?
    expect(user_profile.errors[:job]).to include("は20文字以内で入力してください")
  end
end
