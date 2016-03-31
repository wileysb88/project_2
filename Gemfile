source 'https://rubygems.org'

gem 'sinatra', '~> 1.4', '>= 1.4.7', require: 'sinatra/base'
gem 'sequel', '~> 4.32'
gem 'json'
gem 'thin', '~> 1.6', '>= 1.6.4'
gem 'bcrypt', '~> 3.1', '>= 3.1.11'

group :development, :test do
  gem 'sqlite3', '~> 1.3', '>= 1.3.11'
  gem 'rerun', '~> 0.11.0'
end

group :production do
  gem 'pg', '~> 0.18.4'
end
