require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  test "should not save vendor without key" do
    vendor = Vendor.new
    assert_not vendor.save
  end

  test "a vendor should have a unique key" do

  end
end

