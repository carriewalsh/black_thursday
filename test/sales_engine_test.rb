require "./test/test_helper"
require "./lib/sales_engine"
require "./lib/merchant_repository"
require "./lib/item_repository"
require "pry"


class SalesEngineTest < MiniTest::Test
  def setup
    @se = SalesEngine.new
    @se.from_csv(items: "./test/item_fixture.csv", merchants: "./test/merch_fixture.csv")
  end


  def test_sales_engine_exists
    assert_instance_of SalesEngine, @se
  end


  def test_sales_engine_starts_with_item_repo_by_default
    assert_instance_of ItemRepository, @se.item_repo
  end


  def test_sales_engine_starts_with_merchant_repo_by_default
    assert_instance_of MerchantRepository, @se.merchant_repo
  end


  # def test_sales_engine_has_item_csv
  #   assert_equal
  # end
end
