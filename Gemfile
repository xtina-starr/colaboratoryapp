source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'
gem 'pg'
gem 'figaro'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'
gem 'binding_of_caller'
gem "httparty"
gem 'therubyracer', platforms: :ruby

# frontend
gem 'bourbon'
gem 'neat'
gem 'bitters'
gem 'refills', git:'git@github.com:thoughtbot/refills.git'

# gem 'net-ssh', "~>2.7"#, git: 'git@github.com:net-ssh/net-ssh.git'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

#authentication
gem 'omniauth'
gem 'omniauth-vimeo'
gem 'omniauth-google-oauth2'
gem 'omniauth-soundcloud'

# API wrapper
gem 'vimeo'
gem 'youtube_it'
gem 'soundcloud'

group :development do
  gem "better_errors"
  gem 'capistrano', '3.1.0'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
end

group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails", "~> 4.2.1"
end

group :test do
  gem "capybara", "~> 2.1.0"
end
