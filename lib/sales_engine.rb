require "csv"

class SalesEngine
  attr_reader :items, :merchants
  def initialize
    @items = ItemRepository.new
    @merchants = MerchantRepository.new
    # binding.pry
  end
  def from_csv(info)
    # :items = info[:items]
    # :merchants = info[:merchants]
  end

end
