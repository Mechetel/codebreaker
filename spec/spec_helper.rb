require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
  add_filter 'spec/'
end
SimpleCov.minimum_coverage 95
require 'bundler/setup'
require 'codebreaker'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.filter_run_when_matching :focus
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
