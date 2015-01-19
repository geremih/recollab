source "https://rubygems.org"

gem "rails", "4.1.1"


group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Compressor of JavaScript assets
gem "uglifier", ">= 1.3.0"

# Use CoffeeScript for .js.coffee assets and views
gem "coffee-rails", "~> 4.0.0"

# Use jQuery as the JavaScript library
gem "jquery-rails"

gem 'sass-rails', github: 'rails/sass-rails'
gem 'bower-rails'

# User authentication
gem "devise", "3.2.4"
gem "haml-rails"
gem "omniauth-facebook"
gem "kaminari"
gem "ransack"
gem "dynamic_form"

group :test, :development do
  gem "rspec-rails"
  gem "awesome_print"
end

group :development do
  gem "chronic"
  gem "admin_view"
end

group :development, :test do
  gem 'sqlite3'
end


group :test do
  gem "factory_girl_rails"
  gem "cucumber-rails", :require => false
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem "capybara"
  gem "shoulda"
  gem "email_spec"
  gem "guard-rspec"
end

group :production, :development do
  gem "thin"
end
