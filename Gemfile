source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.2.3"
# Use mysql as the database for Active Record
gem "mysql2", ">= 0.4.4", "< 0.6.0"
# Use Puma as the app server
gem "puma", "~> 4.0"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "mini_racer", platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"
# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use ActiveStorage variant
# gem "mini_magick", "~> 4.8"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

#Login
gem "devise"
gem "cancancan"

#bootstrap
gem "bootstrap", ">= 4.3.1"
gem "toastr-rails"

#jquery
gem "jquery-rails"

#datatables
gem "jquery-datatables"

#font-awesome
gem "font-awesome-rails"

#validate date
gem "validates_timeliness", "~> 5.0.0.alpha3"

#config variable
gem "figaro"

#import excel
gem "rubyzip", ">= 1.2.1"
gem "axlsx", git: "https://github.com/randym/axlsx.git", ref: "c8ac844"
gem "axlsx_rails"
gem "roo", "~> 2.7.0"
gem "active_storage_drag_and_drop"
gem "paperclip", "~> 6.0.0"
gem "sidekiq"
gem "sidekiq-cron", "~> 1.1"

#select-2
gem "select2-rails"

#bootstrap - date & time picker
gem "bootstrap-datepicker-rails"

#dynamic form
gem "cocoon"

#export pdf
gem "wicked_pdf"
gem "wkhtmltopdf-binary"

#pass variable to js
gem "gon"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem "chromedriver-helper"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
