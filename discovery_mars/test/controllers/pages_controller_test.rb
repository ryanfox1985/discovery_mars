require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get track' do
    get :track, track_orders: '5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM'
    assert_response :success
    assert assigns(:land)

    rovers = assigns(:land).rovers.to_a
    assert rovers.any? && rovers.size == 2

    assert rovers[0].x == 1 && rovers[0].y == 3
    assert rovers[1].x == 5 && rovers[1].y == 1
  end
end
