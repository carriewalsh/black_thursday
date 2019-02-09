require "./test/test_helper"
require "./lib/item"
require "./lib/item_repository"
require "./lib/sales_engine"
require "pry"


class ItemTest < MiniTest::Test
  def setup
    @item = Item.new(name: "cool jacket", description: "it's a cool jacket", unit_price: 25.50, created_at: 10-17-2017, updated_at: 11-14-2018, merchant_id: 12334105)
  end

  def test_item_exists
    assert_instance_of Item, @item
  end

  def test_item_has_name
    assert_equal "cool jacket", @item.name
  end

  def test_item_has_description
    assert_equal "it's a cool jacket", @item.description
  end

  def test_item_has_unit_price
    assert_equal 25.50, @item.unit_price
  end

  def test_item_has_creation_date
    assert_equal 10-17-2017, @item.created_at
  end

  def test_item_has_update_date
    assert_equal 11-14-2018, @item.updated_at
  end

  def test_item_has_merchant_id
    assert_equal 12334105, @item.merchant_id
  end
end
