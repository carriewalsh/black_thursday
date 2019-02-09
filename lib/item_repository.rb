
require "./lib/sales_engine"
class ItemRepository < SalesEngine
  def initialize
  end


  def all
    @items
    # returns an array of all known Item instances
  end

  def find_by_id(number)
    @items.find do |item|
      item.id.to_i == number
    end
    # returns either nil or an instance of Item with matching idea
  end

  def find_by_name(name)
    @items.find do |item|
      item.name == name
    end
    # returns either nil or an instance of Item having done a *case insensitive* search
  end

  def find_all_with_description(description)
    description.downcase!
    description = description.split
    intersection = @items.find_all do |item|
      (item.description.downcase.split & description).count != 0
    end
    # returns either [] or instances of Item where the supplied string appears in the item description *case insensitive*
  end

  def find_all_by_price(price)
    @items.find_all do |item|
      item.unit_price.to_s == price.to_s
    end
    #returns either [] or instances of Item where the supplied price exactly matches
  end

  def find_all_by_price_range(range)
    min = range.first
    max = range.last
    @items.find_all do |item|

      item.unit_price.to_i.between?(min,max)
    end
    #returns either [] or instances of Item where the supplied price is in the supplied range (a single ruby range instance is passed in)
  end

  def find_all_by_merchant_id(id)
    @items.find_all do |item|
      item.merchant_id.to_s == id.to_s
    end
    #returns either [] or instances of Item where the supplied Merchant id matches that supplied
  end
end
