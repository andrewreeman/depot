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

  test "should fail login" do
    dave = users(:one)

    post login_path, params: {:name => dave.name, :password => 'wrong'}
    assert_redirected_to login_path    
  end

  test "should logout" do
    delete logout_path
    assert_redirected_to store_path
  end

end
