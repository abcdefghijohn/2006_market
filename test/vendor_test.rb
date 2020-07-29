require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class VendorTest < Minitest::Test

  def test_item_exists_and_has_attributes
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    assert_instance_of Item, item1
    assert_equal "Tomato", item2.name
    assert_equal 0.5, item2.price
  end

  def test_vendor_exists_and_has_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
    assert_equal "Rocky Mountain Fresh", vendor.name
    assert_equal ({}), vendor.inventory
  end

  def test_it_can_add_items_to_stock_and_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    assert_equal 0, vendor.check_stock(item1)

    vendor.stock(item1, 30)
    expected = {item1=>30}
    assert_equal expected, vendor.inventory

    vendor.stock(item1, 25)
    assert_equal 55, vendor.check_stock(item1)

    vendor.stock(item2, 12)
    expected = {item1=>30, item1=>25, item2=> 12}
    assert_equal expected, vendor.inventory
  end
end
