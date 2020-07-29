class Vendor
  attr_reader :name, :inventory, :stock
  def initialize(name)
    @name = name
    @inventory = {}
    @stock = 0
  end

  def check_stock(item)
    @stock
  end

  def stock(item, quantity)
    @inventory[item] = quantity
    @stock += quantity
  end

  def potential_revenue
    total = 0
    @inventory.each do |item|
      total += item[0].price * item[1]
    end
    total 
  end
end
