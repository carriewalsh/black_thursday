require "./test/test_helper"
require "./lib/merchant"
require "./lib/sales_engine"
require "./lib/merchant_repository"
require "./lib/item_repository"
require "./lib/item"
require "pry"


class ItemTest < MiniTest::Test
  def setup
    @se = SalesEngine.new
  end

  def test_item_exists
    assert_instance_of Item, @se.items.items.first
  end

  def test_item_has_name
    assert_equal "510+ RealPush Icon Set", @se.items.items.first.name
  end

  def test_item_has_description
    assert_equal "Glazed with protection", @se.items.items[264].description
  end

  def test_item_has_unit_price
    assert_equal "7500", @se.items.items[264].unit_price
  end

  def test_item_has_creation_date
    assert_equal "2016-01-11 16:56:35 UTC", @se.items.items[264].created_at
  end

  def test_item_has_update_date
    assert_equal "1982-03-06 20:06:06 UTC", @se.items.items[264].updated_at
  end

  def test_item_has_merchant_id
    assert_equal "12334614", @se.items.items[264].merchant_id
  end

  def test_item_list_can_be_found_by_merchant_id
    skip
    assert_equal "Shopin1901", @se.items.items.first.merchant.name
  end
end
