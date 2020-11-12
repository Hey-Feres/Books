# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Ruby on Rails is a full-stack web framework
gem 'rails', '~> 5.2.3'
# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server
gem 'puma', '~> 3.11'
# Sass adapter for the Rails asset pipeline.
gem 'sass-rails', '~> 5.0'
# Uglifier minifies JavaScript files to be accessible in Ruby
gem 'uglifier', '>= 1.3.0'
# CoffeeScript adapter for the Rails asset pipeline.
gem 'coffee-rails', '~> 4.2'
# Rails engine for Turbolinks 5 support
gem 'turbolinks', '~> 5'
# Create JSON structures via a Builder-style DSL
gem 'jbuilder', '~> 2.5'
# Boot large ruby/rails apps faster
gem 'bootsnap', '>= 1.1.0', require: false
# Prawn is a fast, tiny, and nimble PDF generator for Ruby
gem 'prawn', '2.2.2'
# Upload files in your Ruby applications
gem 'carrierwave'
# Flexible authentication solution for Rails with Warden
gem 'devise'
# Provides the generator settings required for Rails 3+ to use Slim
gem 'slim-rails'
# The PDF::Reader library implements a PDF parser
gem 'pdf-reader'
# RailsAdmin is a engine that provides an interface for managing your data
gem 'rails_admin'

group :development, :test do
  # Byebug is a Ruby debugger.
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Pry is a runtime developer console
  gem 'pry'
end

group :development do
  # Allows Ruby programs to interface with the SQLite3 database engine
  gem 'sqlite3'
  # A debugging tool for your Ruby on Rails applications.
  gem 'web-console', '>= 3.3.0'
  # Listens to file modifications and notifies you about the changegem
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Preloads your application so things like console, rake and tests run faster
  gem 'spring'
  # Makes spring watch files using the listen gem
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Capistrano is a utility and framework for executing commands in parallel
  gem 'capistrano', '~> 3.11', require: false
  # RVM integration for Capistrano
  gem 'capistrano-rvm'
  # Bundler support for Capistrano 3.x
  gem 'capistrano-bundler', '~> 1.5'
  # Rails specific Capistrano tasks
  gem 'capistrano-rails', '~> 1.4', require: false
  # RuboCop is a Ruby code style checking and code formatting tool.
  gem 'rubocop'
end

group :production do
  # A simple, fast Mysql library for Ruby, binding to libmysql
  gem 'mysql2'
end

group :test do
  # Capybara is an integration testing tool for rack based web applications.
  gem 'capybara', '>= 2.15'
  # WebDriver is a tool for writing automated tests of websites
  gem 'selenium-webdriver'
  # Run Selenium tests more easily
  gem 'webdrivers'
end

# Data from the IANA Time Zone database packaged as Ruby modules
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
