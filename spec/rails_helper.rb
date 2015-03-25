# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'coffee_script'

RSpec.configure do |config|
  config.include AbstractController::Translation
  config.include Formulaic::Dsl, type: :feature
  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:suite) do
    DatabaseCleaner.clean
  end
end
