source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 4.0.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.1.2'

# Use propshaft as asset pipeline
gem 'propshaft', '~> 1.3.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.6.3'

# Walk commits in repositories
gem 'rugged', '~> 1.9.0'

# Use GitHub API to fetch repositories
gem 'github_api', '~> 0.19.0'

# Use sentry to report errors
gem 'sentry-rails', '~> 6.2.0'
gem 'sentry-ruby', '~> 6.2.0'

# Use solid queue for executing jobs in the background
gem 'solid_queue', '~> 1.3.0'

# Set CORS headers
gem 'rack-cors', '~> 3.0.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.21.1', require: false

group :development, :test do
  # Use the Puma web server [https://github.com/puma/puma]
  gem 'puma', '~> 7.1'

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', '~> 1.11.1', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'annotaterb', '~> 4.20', require: false
  gem 'brakeman', '~> 7.1.2', require: false
  gem 'rubocop', '~> 1.82.1', require: false
  gem 'rubocop-minitest', '~> 0.38.2', require: false
  gem 'rubocop-rails', '~> 2.34', require: false
  gem 'web-console', '~> 4.2.1'
end

group :test do
  gem 'capybara', '~> 3.40.0'
  gem 'selenium-webdriver', '~> 4.39.0'
end
