require 'test_helper'

class OrderControllerTest < ActionController::TestCase
  test "should get cart" do
    get :cart
    assert_response :success
  end

  test "should get checkout" do
    get :checkout
    assert_response :success
  end

  test "should get invoice" do
    get :invoice
    assert_response :success
  end

end
