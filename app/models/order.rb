class Order < ApplicationRecord    
    PAYMENT_TYPES = ["Cheque", "Credit Card", "Purchase Order"]    

    has_many :line_items, dependent: :destroy
    
    validates :name, :address, :email, presence: true
    validates :pay_type, inclusion: PAYMENT_TYPES        

    def add_line_items_from_cart(cart)
        print("Adding line items from cart")
        cart.line_items.each do |item|
            print("Nulling off cart id in line item")
            item.cart_id = nil            
            line_items << item
        end
    end
end
