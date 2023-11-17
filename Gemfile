source "https://rubygems.org"

ruby "3.2.2"


gem "rails", "~> 7.1.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem 'rubocop', '>= 1.0', '< 2.0'
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false
group :development, :test do
  gem "debug", platforms: %i[mri windows]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

group :development, :test do
  gem 'rspec-rails'
end

gem 'factory_bot_rails', group: [:development, :test]

# Then run:
# bundle install

group :development, :test do
  # The RSpec testing framework
  gem 'rspec-rails'

  # Capybara, the library that allows us to interact with the browser using Ruby
  gem 'capybara'

  # The following gems aids with the nuts and bolts
  # of interacting with the browser.
  gem 'webdrivers'
end