require "csv"

class SalesEngine
  attr_reader :items, :merchants
  def initialize
    # @items = nil
    # @merchants = nil
  end
  def from_csv(info)
    binding.pry
    @items = info[:items]
    @merchants = info[:merchants]
  end
  # def items
  #   @items
  # end

  def get_items
    @items = []
    contents = CSV.open "./test/item_fixture.csv", headers: true, header_converters: :symbol
    contents.each do |row|
      id = row[:id]
      name = row[:name]
      description = row[:description]
      unit_price = row[:unit_price]
      merchant_id = row[:merchant_id]
      created_at = row[:created_at]
      updated_at = row[:updated_at]

      item = Item.new(id: id,name: name,description: description,unit_price: unit_price,merchant_id: merchant_id,created_at: created_at,updated_at: updated_at)
      @items << item
    end
  end

  def get_merchants
    @merchants = []
    contents = CSV.open "./test/merch_fixture.csv", headers: true, header_converters: :symbol
    contents.each do |row|
      name = row[:name]
      id = row[:id]
      merchant = Merchant.new(name: name, id: id)
      @merchants << merchant
    end
    # returns an instsance of MerchantRepository with all the merchant instances loaded
  end

end
