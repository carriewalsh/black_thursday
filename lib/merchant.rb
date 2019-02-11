require "./lib/merchant_repository"
require "./lib/find_items_by_merchant_id"

class Merchant < MerchantRepository
  include FindItemsByMerchID
  attr_reader :name, :id, :items
  def initialize(info)
    @name = info[:name]
    @id = info[:id]
    # @merch_items = @items.find_all_by_merchant_id(@id)
  end
    # id returns the integer id of the merchant
    # name returns the name of the merchant
end
