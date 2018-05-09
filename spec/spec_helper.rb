
require_relative '../config/environment'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'
require 'rspec'
# these two? 
RACK_ENV = "test"
ENV["RACK_ENV"] = "test"


RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods
  config.include Capybara::DSL
  config.order = 'default'
  # DatabaseCleaner.strategy = :truncation

  # config.before do
  #   DatabaseCleaner.clean
  # end

  # config.after do
  #   DatabaseCleaner.clean
  # end
end

def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.app = app

