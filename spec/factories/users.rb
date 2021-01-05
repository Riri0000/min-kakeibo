FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    sequence(:email) { |n| "sample#{n}@example.com" }
    role { :general }
    password { 'password' }
    password_confirmation { 'password' }
  end

  trait :admin do
    sequence(:nickname) { |n| "admin-#{n}" }
    role { :admin }
  end
end
