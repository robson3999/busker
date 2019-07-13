# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'capybara/rails'
require 'database_cleaner'
require 'factory_bot'
require 'faker'
require 'rspec/rails'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Capybara::DSL
  # config.include Devise::TestHelpers, type: :controller
  # config.include Warden::Test::Helpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include FactoryBot::Syntax::Methods
  config.extend ControllerMacros, type: :controller

  config.before :suite do
    ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
    Capybara.javascript_driver = :webkit

    # Warden.test_mode!
  end

  config.before do |ex|
    DatabaseCleaner.strategy = if ex.metadata[:js] || ex.metadata[:with_db_truncation]
                                 :truncation
                               else
                                 :transaction
                               end
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  Shoulda::Matchers.configure do |conf|
    conf.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
