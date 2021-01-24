FactoryBot.define do
  factory :user_profile do
    age { rand(13..80) }
    job { Faker::Job.field }
    residence { UserProfile::PREFECTURE_NAMES.sample(1) }
    total_assets { rand(1..31) }
    annual_income { rand(1..10) }
    monthly_income { rand(1..20) }
    household_member { rand(1..8) }
    message { Faker::Quote.famous_last_words }
    association :user
  end
end
