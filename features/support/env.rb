require 'cucumber/rails'
require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'rspec'
require 'factory_bot_rails'
require 'cucumber/rspec/doubles'
# require File.expand_path("../../spec/rails_helper", __FILE__)
# require 'byebug'
# require 'features/support/database_cleaner'

# DatabaseCleaner.clean_with(:deletion) # clean once, now
# DatabaseCleaner.strategy = :transaction
# Cucumber::Rails::Database.javascript_strategy = :deletion

# require 'cucumber/rails/active_record'
# require 'cucumber/rails/world'

Cucumber::Rails::World.use_transactional_fixtures = false
Cucumber::Rails::Database.autorun_database_cleaner = false
DatabaseCleaner.strategy = :truncation
Cucumber::Rails::Database.javascript_strategy = :truncation

Before do
  DatabaseCleaner.clean
end
# begin
#   require 'database_cleaner'
#   require 'database_cleaner/cucumber'

#   DatabaseCleaner.strategy = :truncation
# rescue NameError
#   raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
# end

Capybara.run_server = true
# For GUI-based firefox
Capybara.default_driver = :selenium
# For headless chrome
# Capybara.default_driver = :selenium_chrome_headless
#Set default selector as css
Capybara.default_selector = :css

#Syncronization related settings
module Helpers
  def without_resynchronize
    page.driver.options[:resynchronize] = false
    yield
    page.driver.options[:resynchronize] = true
  end
end
World(Capybara::DSL, Helpers)
World(FactoryBot::Syntax::Methods)
World(Rails.application.routes.url_helpers)
