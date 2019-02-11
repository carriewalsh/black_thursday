require "./lib/sales_engine"
require "./lib/item"
require "./lib/item_repository"
require "./lib/merchant"
require "./lib/merchant_repository"
require "pry"

@se = SalesEngine.new
@se.item_repo.get_items
@se.merchant_repo.get_merchants
merchant = @se.merchant_repo.find_by_id(12334105)

binding.pry
