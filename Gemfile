# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '~> 1.4', '>= 1.4.4', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'uglifier', '>= 1.3.0'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'

gem 'bcrypt', '~> 3.1.7'

gem 'devise'
gem 'haml-rails', '~> 1.0'
gem 'pdfkit'
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'
gem 'wkhtmltopdf-binary'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'guard-rspec'
  gem 'pry', '~> 0.12.2'
  gem 'pry-byebug', '~> 3.6'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.62.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
