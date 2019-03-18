ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  # Add more helper methods to be used by all tests here...

  def login_as(user)
    post login_path, params: { name: users(user).name, password: 'secret' }
    #session[:user_id] = users(user).id
  end

  def logout
    #session.delete :user_id
  end

  def setup    
    login_as :one if defined? login_path
  end
end
