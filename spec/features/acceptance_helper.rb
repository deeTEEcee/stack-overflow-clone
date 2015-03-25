require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'pry-byebug'
# require 'capybara/poltergeist'
# Capybara.default_driver = :poltergeist # for javascript if ever needed
# Capybara.default_driver = :selenium # for debugging
# Capybara.default_wait_time = 8
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
RSpec.configure do |config|
  config.include Helper
end
