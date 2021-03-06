require "bundler/setup"
require "blink"
require "rspec/mocks"


RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  def random_string
    ('a'..'z').to_a.shuffle[0,8].join
  end

  def poll command
    # wait for the command to finish
    # can setup polling on this later
    sleep 5
  end
end
