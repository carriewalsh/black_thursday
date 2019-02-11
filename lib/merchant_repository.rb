require "csv"
require "./lib/sales_engine"
require "./lib/get_merchants"
require "./lib/find_merchant_by_id"
require "./lib/find_items_by_merchant_id"

class MerchantRepository < SalesEngine
  include FindMerchByID
  include FindItemsByMerchID
  include GetMerchants
  attr_reader :merchants, :items
  def initialize
    @merchants = get_merchants
    # @items = self.find_all_by_merchant_id(@id)
  end

  def all
    @merchants
    #return an array of all known Merchant instances
  end

  # def find_by_id(id)
  #   @merchants.find do |merchant|
  #     merchant.id.to_i == id
  #   end
  #   #return either nil or instance of Merchant with matching ID
  # end

  def find_by_name(name)
    @merchants.find do |merchant|
      merchant.name.downcase == name.downcase
    end
    #returns either nil or an instance of Merchant having done a *case insensitive* search
  end

  def find_all_by_name(frag)
    list = @merchants.find_all do |merchant|
      merchant.name.downcase.include?(frag.downcase)
    end
    list.map do |item|
      item.name
    end
    #returns either [] or one or more matches which contain the supplied name fragment, *case insensitive*
  end
end
