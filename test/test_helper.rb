ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def cookies_helper(user_token)
    my_cookies = ActionDispatch::Request.new(Rails.application.env_config.deep_dup).cookie_jar
    my_cookies.encrypted[:authorization] = user_token
    cookies[:authorization] = my_cookies[:authorization]
  end
end
