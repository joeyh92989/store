class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors =[]
  end

  def add_vendor(arg)
    @vendors.push(arg)
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(arg)
    @vendors.find_all do |vendor|
      vendor.check_stock(arg) > 0
    end
  end

  def sorted_items_list
    in_stock_items = @vendors.find_all do |vendor|
      vendor.inventory.map do |k ,v|
        vendor.check_stock(k.name) > 0
      end
    end
    item_names = []
    in_stock_items.each do |vendor|
      vendor.inventory.each do |k,v|
        item_names.push(k.name)
      end
    end
    item_names.uniq.sort
  end

  def total_inventory
    total_inventory ={}
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |item|
        total_inventory[item]= {quantity: vendor.inventory.check_stock(item.name), vendors: [vendors_that_sell(item.name)]}
      end
    end
    require 'pry'; binding.pry
  end
end
