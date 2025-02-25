class Event

  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.keys.any? do |truck_item|
        truck_item == item
      end
    end
  end

  def total_inventory
    total = {}
    quantity = {}
    # food_truck = {}
    total[all_items] = quantity
    quantity["quantity"] = quantity_of_item
    
  end

  def all_items
    @food_trucks.flat_map do |food_truck|
      food_truck.inventory.keys
    end.uniq
  end

  def quantity_of_item
    items_quantity = @food_trucks.map do |food_truck| 
      food_truck.inventory
    end

    all_item_quantity = items_quantity.reduce({}) do |names, money|
      names.merge(money) { |_, a, b, c| a + b}
    end
    all_item_quantity.keys
  end
end