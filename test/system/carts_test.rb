require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  setup do
    @cart = carts(:one)
  end

  test "destroying a Cart from cart show page" do    
    visit store_path # create new cart        
    all(".add-to-cart-button").first.click            
    find("#empty-cart-btn").click
    a = page.driver.browser.switch_to.alert
    a.accept      
  end
end
