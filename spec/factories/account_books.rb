FactoryBot.define do
  factory :account_book do
    date { "2020-12-13" }
    association :user
  end
end
