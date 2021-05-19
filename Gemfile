source 'https://rubygems.org'
git_source(:github) {|repo| "https://github.com/#{repo}.git"}

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

gem "nokogiri", ">= 1.10.4"

# For registration by email
gem 'devise_invitable'
# IMG
gem 'paperclip'
# Boostrap
gem 'bootstrap', '~> 4.3.1'
# JQuery
gem 'jquery-rails'
# Use SCSS for stylesheets
gem 'autoprefixer-rails'
# Authentication
gem 'devise'
# Avoid polling
gem 'wdm', '~> 0.1.0' if Gem.win_platform?
# Messages spanish
gem 'rails-i18n', '~> 5.1' # For 5.0.x, 5.1.x and 5.2.x
# For pagination
gem 'kaminari'
# Theme for pagination
gem 'bootstrap4-kaminari-views'
# Rails best practices
gem 'rails_best_practices'
# Bullet N+1
# gem 'bullet', group: 'development'
# For search
gem 'ransack', github: 'activerecord-hackery/ransack'
# Simple form
gem 'simple_form'

gem 'country_select', '~> 4.0'

# Reports
gem 'reports_kit'

gem 'haml'

# For invoices
gem 'invoicing'
# For pdf generator
gem 'prawn'
gem 'prawn-table'

# For working with json
gem 'httparty'

# For search in orders
gem "select2-rails"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # For tests
  # For creates data for example in tests
  gem 'factory_bot_rails'
  gem "rspec-rails", "~> 3.5"
  gem 'capybara'
  gem 'webdrivers', '~> 3.0'
  gem "database_cleaner"
  # For generate random data
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem "shoulda-matchers", require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  # Use postgresql as the database for Active Record
end
