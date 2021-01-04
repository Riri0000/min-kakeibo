FactoryBot.define do
  factory :user, aliases: [:owner] do
    nickname { 'SampleUser' }
    sequence(:email) { |n| "sample#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
