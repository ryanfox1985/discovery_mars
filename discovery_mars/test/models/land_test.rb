require 'test_helper'

class LandTest < ActiveSupport::TestCase
  
  test "parse orders" do
    orders = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
    l = Land.parse_order_from_text orders
    p l
    p l.rovers.to_a
    assert true
  end
end
