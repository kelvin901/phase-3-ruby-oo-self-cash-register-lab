class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(item, price, quantity = 1)
    quantity.times { @items << item }
    @last_transaction = price * quantity
    @total += @last_transaction
  end

  def apply_discount
    if @discount > 0
      discount_amount = @total * @discount / 100.0
      @total -= discount_amount
      "Brigitte,after  successfully applying for a #{@discount}% discount, the total is $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end

register = CashRegister.new(20)  

register.add_item("Item 1", 10)       
register.add_item("Item 2", 5, 3)     

puts register.apply_discount  

register.void_last_transaction 

puts register.total  
