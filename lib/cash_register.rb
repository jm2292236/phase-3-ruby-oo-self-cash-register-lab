require 'pry'

class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :last_transaction

    def initialize discount = 0
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item item, price, quantity = 1
        self.total += price * quantity
        
        # Add the item description to the items array as many as quantity times
        quantity.times do
            items << item
        end
        
        # Record the last transaction
        self.last_transaction = price * quantity
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            discount_amount = total * (discount.to_f / 100)
            self.total = total - discount_amount.to_i
            "After the discount, the total comes to $#{total}."
        end
    end

    def void_last_transaction
        self.total = total - last_transaction
        items << "VOIDED TRANSACTION"
    end
end


# TESTS
# ==================================
register = CashRegister.new
# register.add_item "Tomatoes", 0.99
# register.add_item "Mangoes", 1.99, 3
# register.add_item "Yogurt", 0.99, 2
# p register.total
# p register.items
# register.void_last_transaction
# p register.total
# p register.items
# register.add_item "Papaya", 3
# p register.total
# p register.items
