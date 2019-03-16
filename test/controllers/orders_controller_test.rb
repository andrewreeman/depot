require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do

    # create cart and add a line item to it
    cart = Cart.new
    cart.save!  
    post line_items_url, 
    params: { 
      line_item: { cart_id: cart.id}, product_id: products(:ruby).id 
    }, 
    xhr: true                 

    # should be allowed on the order page and not redirected
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { address: '64 Burkvale Avenue', email: 'sally@hotmails.com', name: 'Sally Sallster', pay_type: "Credit Card"} }
    end

    assert_redirected_to store_url
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type } }
    assert_response :success    
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end

  test "requires items in cart" do
    get new_order_url
    assert_redirected_to store_url
    assert_equal flash[:notice], 'Your cart is empty'
  end
end
