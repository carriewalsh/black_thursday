require "./lib/item_repository"

class Item < ItemRepository
  include FindMerchByID
  attr_reader :id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id
  def initialize(info)
    @id = info[:id]
    @name = info[:name]
    @description = info[:description]
    @unit_price = info[:unit_price]
    @created_at = info[:created_at]
    @updated_at = info[:updated_at]
    @merchant_id = info[:merchant_id]
  end

  def merchant
    find_by_id(@id)
  end
  #returns integer id of the item
  #returns the name of the item
  #returns the description of the item
  #returns the price of the item formatted as a BigDecimal
  #returns a Time instance for the date the item was first created
  #returns a Time instance for the date the item was last modified
  #returns the integer Merchant id of the item

end



# i = Item.new({
#   :name        => "Pencil",
#   :description => "You can use it to write things",
#   :unit_price  => BigDecimal.new(10.99,4),
#   :created_at  => Time.now,
#   :updated_at  => Time.now,
# })
