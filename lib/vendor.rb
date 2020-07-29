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
    require "pry"; binding.pry
  end
end
