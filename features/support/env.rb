require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'rspec'
require 'byebug'

Capybara.run_server = false
# For GUI-based firefox
# Capybara.default_driver = :selenium
# For headless chrome
Capybara.default_driver = :selenium_chrome_headless
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