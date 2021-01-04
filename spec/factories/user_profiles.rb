FactoryBot.define do
  factory :user_profile do
    age { rand(13..80) }
    job { Faker::Job.field }
    residence { UserProfile::PREFECTURE_NAMES.sample(1) }
    total_assets { rand(10_000..100_000_000) }
    annual_income { rand(10_000..30_000_000) }
    monthly_income { rand(10_000..2_000_000) }
    household_member { rand(1..8) }
    message { Faker::Quote.famous_last_words }
    association :user
  end
end
