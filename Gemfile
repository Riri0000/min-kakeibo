source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'mini_racer', platforms: :ruby
# aws S3
gem 'aws-sdk-s3', require: false
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# gem 'mini_magick'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# 開発環境とテスト環境のみ対象
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # RSpec
  gem 'factory_bot_rails'
  gem 'rspec-rails'

  # Code analyze
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rails_best_practices'
  gem 'rubocop-rspec'

  # Debugger
  gem 'pry-byebug'
  gem 'pry-rails'

  # Provides a better error page for Rails
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'binding_of_caller', '~> 0.8.0'

  gem 'faker'
end

group :development do
  # N+1問題
  gem 'bullet'

  # 自動デプロイ
  gem 'capistrano'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-puma', '< 5'
  gem 'capistrano-nginx'
  gem 'capistrano-yarn'

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# テスト環境のみ
group :test do
  gem 'capybara'
  gem 'webdrivers'
  # CircleCIで使用
  gem 'rspec_junit_formatter'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

####### View関連 #######

# グラフ生成用
gem 'chartkick'
# 画像生成(ogp)
gem 'cloudinary'
# パンくずリスト
gem 'gretel'
# ページネーション
gem 'kaminari'
# slim
gem 'slim-rails'
gem 'html2slim'
# 日本円表記
gem 'ya_kansuji', '~> 0.2.0'

####### その他 #######

# ネストしたフォーム＆複数レコードを一度に登録できる
gem 'cocoon'
# meta-tag整理用
gem 'meta-tags'
# 国際化対応
gem 'rails-i18n', '~> 6.0.0'
gem 'enum_help'
# 管理機能
gem 'cancancan'
gem 'rails_admin'
# 検索機能
gem 'ransack'
# Seed管理
gem 'seed-fu', '~> 2.3'
# ログイン認証
gem 'sorcery', '~> 0.15.0'
