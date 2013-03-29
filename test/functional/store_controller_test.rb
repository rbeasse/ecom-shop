require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get category" do
    get :category
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
