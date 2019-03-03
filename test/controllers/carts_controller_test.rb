require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
#class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get carts_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_url
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post carts_url, params: { cart: {} }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should show cart" do
    get cart_url(@cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_cart_url(@cart)
    assert_response :success
  end

  test "should update cart" do
    patch cart_url(@cart), params: { cart: {  } }
    assert_redirected_to cart_url(@cart)
  end

  # cannot destroy cart now without a 'session' this has been moved to system tests
  # test "should destroy cart" do
  #   get store_url # create new cart        
  #   assert_difference('Cart.count', -1) do
  #     #click_button 'Empty cart'
  #   #  session[:cart_id] = @cart.id
  #     @cart.id = 1
  #     delete cart_url(@cart)
  #   end

  #   assert_redirected_to store_path
  # end
end
