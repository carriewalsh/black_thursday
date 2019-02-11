module FindItemsByMerchID
  def find_all_by_merchant_id(id)
    # binding.pry
    list = @items.find_all do |item|
      item.merchant_id.to_s == id.to_s
    end
    list
    #returns either [] or instances of Item where the supplied Merchant id matches that supplied
  end
end
