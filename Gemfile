source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }



# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma'
# Use Active Model has_secure_password
gem 'bcrypt'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development do
  gem 'foreman'
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'rspec-json_expectations'
  gem 'shoulda-matchers'
end

gem "active_model_serializers"
