class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def change    
    # replace multiple items in the cart with a single item
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          # remove current items 
          cart.line_items.where(product_id: product_id).delete_all

          # replace with single line item
          line_item = cart.line_items.build(product_id: product_id)
          line_item.quantity = quantity
          line_item.save!
        end
      end
    end

    reversible do |direction|
      direction.down { down }
    end
  end

  def down
    print("Down called")
    # replace items where quantity is above 1 with multiple items of a single quantity
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do 
        LineItem.create cart_id: line_item.cart_id, product_id: line_item.product_id, quantity: 1
      end

      line_item.destroy
    end
  end
end
