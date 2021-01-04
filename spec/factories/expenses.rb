FactoryBot.define do
  factory :expense do
    expenditure { rand(1..99_999) }
    expense_item_id { rand(1..19) }
    association :account_book
  end
end
