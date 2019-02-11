require "./test/test_helper"
require "./lib/merchant"
require "./lib/sales_engine"
require "./lib/merchant_repository"
require "./lib/item_repository"
require "./lib/item"
require "pry"

class MerchantRepositoryTest < Minitest::Test
  def setup
    @se = SalesEngine.new
  end


  def test_merchant_repo_exists
    assert_instance_of MerchantRepository, @se.merchants
  end


  def test_merchant_repo_gets_merchants
    assert_equal 475, @se.merchants.all.count
    assert_equal Array, @se.merchants.all.class
  end


  def test_merchant_repo_can_find_all
    assert_equal "Shopin1901", @se.merchants.all.first.name
  end


  def test_merchant_repo_can_find_by_id
    assert_equal "Shopin1901", @se.merchants.find_by_id("12334105").name
  end


  def test_merchant_repo_can_find_by_name
    assert_equal "Shopin1901", @se.merchants.find_by_name("Shopin1901").name
  end


  def test_merchant_can_find_all_by_name
    assert_equal ["ExecutiveGiftShoppe", "MattsNerdShoppe"], @se.merchants.find_all_by_name("Shoppe")
  end


  def test_merchant_can_find_all_items_by_merchant_id
    skip
    merch = @se.merchants.find_by_id("12334105")
    assert_equal Array, merch.items.class
    assert_equal 3, merch.items.count
    assert_equal "2999", merch.items.first.unit_price

  end
end
