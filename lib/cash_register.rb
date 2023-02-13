class CashRegister
    attr_accessor :discount, :total
  
    def initialize(discount = nil)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = nil
    end
  
    attr_reader :items
  
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      @last_transaction = { title: title, price: price, quantity: quantity }
      quantity.times do
        @items << title
      end
    end
  
    def apply_discount
      if @discount
        @total = @total * (100 - @discount) / 100
        "After the discount, the total comes to $#{@total.round(2)}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      if @last_transaction
        @total -= @last_transaction[:price] * @last_transaction[:quantity]
        @last_transaction = nil
      end
      @total = 0.0 if @total < 0.0
    end
  end
  