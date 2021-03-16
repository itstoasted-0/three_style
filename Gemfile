source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false


gem 'devise'
gem 'bootstrap-sass'
gem 'faker'
gem 'jquery-rails', '4.3.1'
gem 'will_paginate', '3.1.8'
gem 'will_paginate-bootstrap4'
# 画像投稿機能
gem 'carrierwave', '~> 2.0'
# 画像リサイズ機能
gem "mini_magick"
gem 'rails-i18n', '~> 6.0'
gem 'enum_help'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.0.beta3'
  gem 'rubocop-airbnb'
  gem "factory_bot_rails", "~> 4.10.0"
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'fog'
  #gem 'spring'
  #gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
