source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.3.5'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.0.1'

# Use propshaft as asset pipeline
gem 'propshaft'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.5'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Walk commits in repositories
gem 'rugged'

# Use GitHub API to fetch repositories
gem 'github_api'

# Use sentry to report errors
gem 'sentry-rails'
gem 'sentry-ruby'

# Use solid queue for executing jobs in the background
gem 'solid_queue'

# Set CORS headers
gem 'rack-cors'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # Use the Puma web server [https://github.com/puma/puma]
  gem 'puma', '~> 6.5'

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'annotaterb', '~> 4.13', require: false
  gem 'brakeman', require: false
  gem 'rubocop-minitest', '~> 0.36.0', require: false
  gem 'rubocop-rails', '~> 2.28', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
