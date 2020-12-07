FactoryBot.define do
  factory :user_profile do
    age { 1 }
    job { "MyString" }
    total_assets { 1 }
    annual_income { 1 }
    monthly_income { 1 }
    household_member { 1 }
    message { "MyText" }
    association :user
  end
end