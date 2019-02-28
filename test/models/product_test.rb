require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new

    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?        
  end

  test "product price must be positive" do
    product = Product.new(title: "My title", description: "12345678910", image_url: "ef.jpg")

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
    
    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 9    
    assert product.valid?
  end

  test "image url must end in jpg, png or gif" do 
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/z/y.fred.gif }
    bad = %w{ fred.doc fred.gif/more fred fred.gif.more }
    
    ok.each do |image_url|            
      assert new_product(image_url).valid?, "#{image_url} should validate"            
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} should not be validate"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(
      title: products(:ruby).title,
      description: "12345678910",
      price: 1.14,
      image_url: "fred.gif"
    )

    assert product.invalid?
    assert_equal [I18n.translate("errors.messages.taken")], product.errors[:title]    
  end

  test "product description must be over 10 characters" do 
    product = Product.new(
      title: "title",
      description: "words",
      price: 2.3,
      image_url: "test.gif"
    )

    assert product.invalid?
    assert product.errors[:description].any?

    product.description = "12345678910ekg"
    assert product.valid?
  end


  def new_product(image_url)
      Product.new(title: "tteroigre", description: "12345678910", price: 1, image_url: image_url)
  end
end
