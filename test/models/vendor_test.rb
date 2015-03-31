require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  
  def setup
    @vendor = Vendor.new(key: "-111", vendor_type: "vendor_food", status: "open", business_name: "Via Tevere Pizzeria", location: "C1 Authorised Parking Meter - West Side of 400 Burrard St", description: "Pizza")
    @user = users(:michael)
  end

  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "key should be present" do
    @vendor.key = "  "
    assert_not @vendor.save
  end

  test "a vendor should have a unique key" do

  end
  
  test "associated comments should be destroyed" do 
    @user.save
    @vendor.save
    @user.comments.create!(content: "Lorem ipsum", vendor_id: @vendor.id)
    assert_difference 'Comment.count', -1 do
      @vendor.destroy
    end
  end
  
end

