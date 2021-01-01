require 'rails_helper'

RSpec.describe User, type: :model do
  it 'nickname, email, password, password_confirmationがあれば正常にユーザー登録できること' do
    user = User.new(
      nickname: 'sample',
      email: 'sample@example.com',
      password: 'samplepassword',
      password_confirmation: 'samplepassword',
    )
    expect(user).to be_valid
  end

  it 'nicknameがなかったら、ユーザー登録に失敗すること' do
    user = build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("は1文字以上で入力してください")
  end

  it 'emailがなかったら、ユーザー登録に失敗すること' do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it '重複するemailの場合、ユーザー登録に失敗すること' do
    user1 = create(:user)
    user2 = build(:user)
    user2.email = user1.email
    user2.valid?
    expect(user2.errors[:email]).to include("はすでに存在します")
  end

  it 'パスワードが8文字未満の場合、ユーザー登録に失敗すること' do
    user = build(:user)
    user.password = 'p' * 7
    user.valid?
    expect(user.errors[:password]).to include("は8文字以上で入力してください")
  end

  it 'パスワードが31文字以上の場合、ユーザー登録に失敗すること' do
    user = build(:user)
    user.password = 'p' * 31
    user.valid?
    expect(user.errors[:password]).to include("は30文字以内で入力してください")
  end
end
