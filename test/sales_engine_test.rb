require "./test/test_helper"
require "./lib/sales_engine"


class SalesEngineTest < MiniTest::Test
  def setup
    @se = SalesEngine.new
    @se.from_csv(items: "./test/item_fixture.csv", merchants: "./test/merch_fixture.csv")
  end

  def test_sales_engine_exists
    assert_instance_of SalesEngine, @se
  end

  def test_sales_engine_starts_with_no_items
    se = SalesEngine.new
    assert_nil se.items
  end

  def test_sales_engine_starts_with_no_merchants
    se = SalesEngine.new
    assert_nil se.merchants
  end

  def test_sales_engine_can_get_item_repo
    assert_instance_of ItemRepository, @se.items
  end

  def test_sales_engine_can_get_merch_repo
    assert_instance_of MerchantRepository, @se.merchants
  end

end
