require "csv"
require "./lib/sales_engine"

class MerchantRepository < SalesEngine
  attr_reader :merchants
  def initialize
    @merchants = []
  end

  def all
    @merchants
    #return an array of all known Merchant instances
  end

  def find_by_id(id)
    @merchants.find do |merchant|
      merchant.id.to_i == id
    end
    #return either nil or instance of Merchant with matching ID
  end

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
