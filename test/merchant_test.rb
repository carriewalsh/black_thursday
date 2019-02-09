require "./test/test_helper"
require "./lib/merchant"

class MerchantTest < Minitest::Test
  def setup
    @merchant = Merchant.new(name: "JCPenney", id: 12345)
  end

  def test_merchant_exists
    assert_instance_of Merchant, @merchant
  end
  def test_merchant_has_name
    assert_equal  "JCPenney", @merchant.name
  end

  def test_merchant_has_id
    assert_equal 12345, @merchant.id
  end
end
