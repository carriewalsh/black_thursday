require "./test/test_helper"
require "./lib/merchant"
require "./lib/sales_engine"
require "./lib/merchant_repository"
require "./lib/item_repository"
require "./lib/item"
require "pry"

class MerchantTest < Minitest::Test
  def setup
    @se = SalesEngine.new
    @merchant_1 = @se.merchants.find_by_id("12334105")
    # binding.pry
  end

  def test_merchant_exists
    assert_instance_of Merchant, @se.merchants.merchants.first
  end
  def test_merchant_has_name
    assert_equal  "Shopin1901", @se.merchants.merchants.first.name
  end

  def test_merchant_has_id
    assert_equal "12334105", @se.merchants.merchants.first.id
  end

  def test_merchant_can_find_all_items
    # binding.pry
    skip
    assert_equal 3, @merchant_1.items.count
    assert_equal Array, @merchant_1.items.count
    assert_equal "2999", @merchant_1.items.count

  end
end



# def setup
#   @merchant = Merchant.new(name: "JCPenney", id: 12345)
# end
#
# def test_merchant_exists
#   assert_instance_of Merchant, @merchant
# end
# def test_merchant_has_name
#   assert_equal  "JCPenney", @merchant.name
# end
#
# def test_merchant_has_id
#   assert_equal 12345, @merchant.id
# end
