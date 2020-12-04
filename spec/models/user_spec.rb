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
    user = User.new(nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
  end

  it 'emailがなかったら、ユーザー登録に失敗すること' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it '重複するemailの場合、ユーザー登録に失敗すること' do
    user1 = create(:user)
    user2 = build(:user)
    user2.email = user1.email
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it 'パスワードが８文字以下の場合、ユーザー登録に失敗すること' do
    user = build(:user)
    user.password = 'p' * 7
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
  end

  it 'パスワードが１６文字以上の場合、ユーザー登録に失敗すること' do
    user = build(:user)
    user.password = 'p' * 17
    user.valid?
    expect(user.errors[:password]).to include("is too long (maximum is 16 characters)")
  end
end
