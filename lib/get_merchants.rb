module GetMerchants
  def get_merchants
    merchants = []
    contents = CSV.open "./data/merchants.csv", headers: true, header_converters: :symbol
    contents.each do |row|
      name = row[:name]
      id = row[:id]
      merchant = Merchant.new(name: name, id: id)
      merchants << merchant
    end
    # returns an instsance of MerchantRepository with all the merchant instances loaded
    merchants
  end
end
