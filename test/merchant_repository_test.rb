require "./test/test_helper"
require "./lib/merchant_repository"
require "./lib/sales_engine"
require "./lib/item_repository"
require "./lib/merchant"
require "pry"

class MerchantRepositoryTest < Minitest::Test
  def setup
    @se = SalesEngine.new
    @se.merchant_repo.get_merchants
  end


  def test_merchant_repo_exists
    assert_instance_of MerchantRepository, @se.merchant_repo
  end


  def test_merchant_repo_gets_merchants
    assert_equal 4, @se.merchant_repo.all.count
    assert_equal Array, @se.merchant_repo.all.class
  end


  def test_merchant_repo_can_find_all
    assert_equal "Shopin1901", @se.merchant_repo.all.first.name
  end


  def test_merchant_repo_can_find_by_id
    assert_equal "Shopin1901", @se.merchant_repo.find_by_id(12334105).name
  end


  def test_merchant_repo_can_find_by_name
    assert_equal "Shopin1901", @se.merchant_repo.find_by_name("Shopin1901").name
  end


  def test_merchant_can_find_all_by_name
    assert_equal ["Shopin1901","Candisart","LolaMarleys"], @se.merchant_repo.find_all_by_name("s")
  end
end
