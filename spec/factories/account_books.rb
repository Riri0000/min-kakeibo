FactoryBot.define do
  factory :account_book do
    from = Date.parse("2015/01/01")
    to   = Date.parse("2021/01/01")
    date { Random.rand(from..to) }
    monthly_income { rand(1..100000) }
    association :user
  end
end
