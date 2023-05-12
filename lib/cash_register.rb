class CashRegister
    attr_accessor :total, :discount, :items, :last_price

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item (title, price, quantity = 1)
        self.last_price = price * quantity
        items.fill(title, items.size, quantity)
        quantity > 0 ? self.total += (quantity * price) : self.total += price
    end

    def apply_discount
       self.discount > 0 ? "After the discount, the total comes to $#{(self.total -= (self.total * self.discount/100))}." : "There is no discount to apply."
    end

    def void_last_transaction
        if self.items.length == 0
            self.total = 0.0
        elsif self.items.length > 0
            self.items.pop
            (self.total -= self.last_price)
        end
    end
end
