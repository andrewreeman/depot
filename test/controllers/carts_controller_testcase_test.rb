require 'test_helper'

# for tests that require the session
class CartsControllerTestCaseTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
    @controller = CartsController.new
  end


  test "should destroy cart" do    
    assert_difference('Cart.count', -1) do      
        session[:cart_id] = @cart.id      
        delete :destroy, params: {id: @cart}
    end

    assert_redirected_to store_path
  end
end
