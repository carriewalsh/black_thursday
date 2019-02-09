require "./lib/merchant_repository"

class Merchant < MerchantRepository
  attr_reader :name, :id
  def initialize(info)
    @name = info[:name]
    @id = info[:id]
  end
    # id returns the integer id of the merchant
    # name returns the name of the merchant
end
