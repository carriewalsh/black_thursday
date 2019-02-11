require "./test/test_helper"
require "./lib/merchant"
require "./lib/sales_engine"
require "./lib/merchant_repository"
require "./lib/item_repository"
require "./lib/item"
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
    assert_instance_of ItemRepository, @se.items
  end


  def test_sales_engine_starts_with_merchant_repo_by_default
    assert_instance_of MerchantRepository, @se.merchants
  end


  def test_item_list_can_be_found_by_merchant_id
    skip
    # @se.
  end

end
