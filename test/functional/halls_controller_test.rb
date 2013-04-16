require 'test_helper'

class HallsControllerTest < ActionController::TestCase
  setup do
    @hall = halls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:halls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hall" do
    assert_difference('Hall.count') do
      post :create, hall: { h: @hall.h, name: @hall.name, w: @hall.w }
    end

    assert_redirected_to hall_path(assigns(:hall))
  end

  test "should show hall" do
    get :show, id: @hall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hall
    assert_response :success
  end

  test "should update hall" do
    put :update, id: @hall, hall: { h: @hall.h, name: @hall.name, w: @hall.w }
    assert_redirected_to hall_path(assigns(:hall))
  end

  test "should destroy hall" do
    assert_difference('Hall.count', -1) do
      delete :destroy, id: @hall
    end

    assert_redirected_to halls_path
  end
end
