source "http://rubygems.org"

gem "rails", "3.1.3"
gem "jquery-rails"
gem "unicorn"
gem "bcrypt-ruby", "~> 3.0.0"
gem "twitter-bootstrap-rails"
gem "devise"
gem "mini_magick"
gem "will_paginate"
gem "carrierwave"
gem "exception_notification"
gem "delayed_job", "2.1.4"
gem "daemons"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "sass-rails", "~> 3.1.4"
  gem "coffee-rails", "~> 3.1.1"
  gem "uglifier", ">= 1.0.3"
end

group :production do
  gem "mysql2"
end

group :development do
  gem "capistrano"
  gem "annotate", "~>2.4.1.beta1"
  # gem "bullet"
end

group :test do
  gem "rspec"
  gem "capybara"
  gem "database_cleaner"
  gem "mocha"
  gem "selenium"
  gem "selenium-client"
  gem "launchy"
  gem "selenium-webdriver", "~> 2.10.0"
  gem "email_spec"
end

group :development, :test do
  gem "rspec-rails"
  gem "steak"
  gem "sqlite3"
end
