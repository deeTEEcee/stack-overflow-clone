source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
gem 'mongoid', '~> 4.0.0'
gem 'sorcery'
gem 'rails-i18n'

gem 'simple_form' ## Warning: not supported by mongoid but it does work
gem 'kaminari'
gem 'redcarpet'

gem 'bootstrap-sass', '~> 3.3.4'
gem 'sass-rails', '>= 3.2'
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
#gem 'coffee-rails', '~> 4.1.0'
# See https://github .com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
#gem 'sdoc', '~> 0.4.0', group: :doc
# gem 'unicorn'
group :development do
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
end

group :development, :test do
  gem "byebug"
  gem "factory_girl_rails"
  # option 1: rspec (needed in development because of rake task generators)
  gem "rspec-rails", "~> 3.2.0"
  gem "bundler-audit", require: false
  # gem "awesome_print"
  # gem "dotenv-rails"
  # gem "pry-rails"
end

group :test do

  gem "poltergeist" # add this once i have more pages that are javascript-involved.
  gem "selenium-webdriver" # use for debugging
  gem "formulaic" # simplify capybara form
  gem 'mongoid-rspec', '~> 2.1.0'
  gem 'capybara', '~> 2.4.4'
  # option 2 (using) : minitest
  # gem "minitest-spec-rails", "~>5.2.0"
  # gem 'capybara_minitest_spec',  "~> 1.0.5" # for capybara integration and spec matchers
  # gem 'mongoid-minitest' #not sure if this is needed
  gem 'pry-byebug'
  # gem 'turn' # for prettier test output
  gem "database_cleaner"
  # gem "timecop" # mock time
  # gem "launchy" # really nice, use this for debugging during the testing sequence if it is a long process
  # gem "shoulda-matchers", require: false # nice for model testing
  # i also think shoulda-context is also good if you happen to have many huge multi-line expectances
  #gem "webmock" # mock http requests, we'll include this when we need it
end
group :production do
  gem 'rails_12factor'
  gem 'factory_girl_rails' # TODO: remove after we confirmed heroku works
end

ruby "2.2.0"
