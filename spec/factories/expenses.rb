FactoryBot.define do
  factory :expense do
    expenditure { 100 }
    association :account_book
    association :expense_item
  end
end
