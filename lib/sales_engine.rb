require "csv"

class SalesEngine
  attr_reader :item_repo, :merchant_repo
  def initialize
    @item_repo = ItemRepository.new
    @merchant_repo = MerchantRepository.new
  end
  def from_csv(info)
    # :items = info[:items]
    # :merchants = info[:merchants]
  end


  def get_items
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
