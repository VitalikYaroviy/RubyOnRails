source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'
gem 'rails', '~> 5.2.0'
gem 'pg', group: :production

gem 'activeadmin'
gem 'autoprefixer-rails'
gem 'bootstrap', '~> 4.0.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'filterrific'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'rspec_junit_formatter'
gem 'puma', '~> 3.11'
gem 'simplecov', require: false, group: :test
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails_12factor'
  gem 'sass-rails', '~> 5.0'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'pry'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'rails-controller-testing'
  gem 'rspec-collection_matchers', group: :test
  gem 'rubocop-rspec'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'faker'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
