module FindMerchByID
  def find_by_id(id)
    merch = @merchants.find do |merchant|
      merchant.id == id
    end
    merch
    #return either nil or instance of Merchant with matching ID
  end
end
