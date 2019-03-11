class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy

    def add_product(product)
        print("Add product called for cart with id #{self.id}")
        current_item = line_items.find_by(product_id: product.id)

        if current_item
            current_item.quantity += 1
        else
            current_item = line_items.build(product_id: product.id)
        end            
        print("Current item is #{current_item}")
        current_item
    end

    def total_price
        line_items.to_a.sum { |item| item.total_price } 
    end
end
