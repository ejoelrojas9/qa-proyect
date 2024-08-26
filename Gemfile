source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "rails", "~> 7.0.5"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "devise"
gem "figaro"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
# Use Sass to process CSS
gem "sassc-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
  gem "byebug"
  gem 'rake'
  gem 'selenium-webdriver'
  gem 'webdrivers', '~> 5.0', require: false
  gem 'rspec'
  gem 'byebug'
  gem 'faker'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
end
