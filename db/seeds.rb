# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rails db:seed実行時にSeed Fuが実行される。
SeedFu.seed

# ユーザー作成はパスワードがあるのでSeedFuが使えない
30.times do
  User.create!(
    nickname: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

User.create!(
  nickname: 'guest-user',
  email: 'guest-user@example.com',
  role: :guest,
  password: 'password',
  password_confirmation: 'password'
)

30.times do |i|
  UserProfile.create!(
    user_id: User.find(i+1).id,
    age: rand(13..80),
    job: Faker::Job.field,
    residence: UserProfile::PREFECTURE_NAMES.sample(1),
    total_assets: rand(10_000..100_000_000),
    annual_income: rand(10_000..30_000_000),
    monthly_income: rand(10_000..2_000_000),
    household_member: rand(1..8),
    message: Faker::Quote.famous_last_words
  )
end

30.times do |i|
  AccountBook.create!(
    user_id: User.find(i+1).id,
    date: Date.today
  )
end

300.times do |i|
  Expense.create!(
    account_book_id: rand(1..30),
    expense_item_id: rand(1..19),
    expenditure: rand(1..99_999)
  )
end
