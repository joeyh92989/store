class Vendor
  attr_reader :name,
              :inventory
  
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(arg)
    @inventory[arg]
  end

  def stock(item, volume)
    @inventory[item] += volume
  end

  def potential_revenue
    @inventory.sum do |k, v|
      (k.price).to_f * v
    end
  end
end
