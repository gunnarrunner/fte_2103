class FoodTruck

  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    each_item = @inventory.select do |inven_item, amount|
      inven_item == item
    end
    each_item.values.map do |amount|
      amount
    end.sum
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    revenue = @inventory.map do |item, quantity|
      item.price * quantity
    end
    revenue.sum
  end
end