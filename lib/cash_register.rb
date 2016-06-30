require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @items = Array.new
    @discount = discount
  end

  # this method isn't needed because of the attr_accessor :total
  # def total
  #   @total
  # end

  def add_item(title, price, quantity = 1)
    @last_transaction = price * quantity
    @total += price * quantity
    quantity.times do
      # if I change @items to self.items it still works. Why?
      # apparently there's no need for @ in this case because variable holds
      # an array. We can push/shovel into arrays even if we're only able to read
      # However, in order to assign, we need the @variable_name syntax
      items << title
    end
    # binding.pry
  end

  def apply_discount
    if discount == nil
      "There is no discount to apply."
    else
      @total = total - (total * discount / 100)
      "After the discount, the total comes to $800."
    end
  end

  # like #total above, this isn't needed because of attr_accessor :items
  # def items
  #   #why can't I call self.items?
  #   @items
  # end

  def void_last_transaction
    @total -= last_transaction
  end
end
