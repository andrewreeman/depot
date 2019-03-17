require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do    
    get login_path
    assert_response :success
  end

  test "should login" do    
    dave = users(:one)        

    post login_path, params: {:name => dave.name, :password => 'secret'}
    assert_redirected_to admin_url    
  end

end
