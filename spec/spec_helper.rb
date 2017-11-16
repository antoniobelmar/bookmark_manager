ENV['RACK_ENV'] = 'test'

require './app/data_mapper_setup'
require './app/app.rb'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'

require './spec/features/web_helpers.rb'


Capybara.app = Bookmark

RSpec.configure do |config|
  require 'data_mapper'

    config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

 config.before(:each) do
    DatabaseCleaner.start
  end

 config.after(:each) do
    DatabaseCleaner.clean
  end

end
