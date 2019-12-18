require 'database_helpers'


require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative './web_helpers.rb'

Capybara.app = MakersBnB

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    p "Cleaning database"
    connection = PG.connect(dbname: 'bnb_test')
    connection.exec("TRUNCATE TABLE rentals, users;")
  end

end
