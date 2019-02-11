require "./test/test_helper"
require "./lib/merchant"
require "./lib/sales_engine"
require "./lib/merchant_repository"
require "./lib/item_repository"
require "./lib/item"
require "pry"

class ItemRepositoryTest < MiniTest::Test
  def setup
    @se = SalesEngine.new
  end

  def test_item_repo_exists
    assert_instance_of ItemRepository, @se.items
  end

  def test_item_repo_gets_items
    assert_equal 1367, @se.items.all.count
    assert_equal Array, @se.items.all.class
  end

  def test_item_repo_can_find_all
    assert_equal "263395237", @se.items.all.first.id
  end

  def test_item_repo_can_find_by_id
    assert_equal "510+ RealPush Icon Set", @se.items.find_by_id(263395237).name
  end

  def test_item_repo_can_find_item_by_name
    assert_equal "Glitter scrabble frames", @se.items.find_by_name("Glitter scrabble frames").name
    assert_equal Item, @se.items.find_by_name("Glitter scrabble frames").class
  end

  def test_item_repo_can_find_all_with_description
    assert_equal "Tupac", @se.items.find_all_with_description("glitter").last.name
    assert_equal 14, @se.items.find_all_with_description("glitter").count
    assert_equal Array, @se.items.find_all_with_description("glitter").class
  end

  def test_item_repo_can_find_all_by_price
    assert_equal "Disney scrabble frames", @se.items.find_all_by_price(1350).first.name
    assert_equal "1350", @se.items.find_all_by_price(1350).first.unit_price
    assert_equal Array, @se.items.find_all_by_price(1350).class
    assert_equal 1, @se.items.find_all_by_price(1350).count
  end

  def test_item_repo_can_find_all_within_price_range
    assert_equal "510+ RealPush Icon Set", @se.items.find_all_by_price_range(1200..1300).first.name
    assert_equal 56, @se.items.find_all_by_price_range(1200..1300).count
    assert_equal Array, @se.items.find_all_by_price_range(1200..1300).class
  end

  def test_item_repo_can_find_all_by_merchant_id
    assert_equal "510+ RealPush Icon Set", @se.items.find_all_by_merchant_id("12334141").first.name
    assert_equal 1, @se.items.find_all_by_merchant_id(12334141).count
    assert_equal Array, @se.items.find_all_by_merchant_id(12334141).class
  end

end
