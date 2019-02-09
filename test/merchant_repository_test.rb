require "./test/test_helper"
require "./lib/merchant_repository"
require "pry"

class MerchantRepositoryTest < Minitest::Test
  def setup
    @merch_repo = MerchantRepository.new("./test/merch_fixture.csv") #the argument for this is a file

  end

  def test_merchant_repo_exists
    assert_instance_of MerchantRepository, @merch_repo
  end

  def test_merchant_repo_gets_merchants
    assert_equal 4, @merch_repo.all.count
    assert_equal Array, @merch_repo.all.class
  end

  def test_merchant_repo_can_find_all
    assert_equal "Shopin1901", @merch_repo.all.first.name
  end

  def test_merchant_repo_can_find_by_id
    assert_equal "Shopin1901", @merch_repo.find_by_id(12334105).name
  end

  def test_merchant_repo_can_find_by_name
    assert_equal "Shopin1901", @merch_repo.find_by_name("Shopin1901").name
  end

  def test_merchant_can_find_all_by_name
    assert_equal ["Shopin1901","Candisart","LolaMarleys"], @merch_repo.find_all_by_name("s")
  end
end
