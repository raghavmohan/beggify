require 'test_helper'

class PerformersControllerTest < ActionController::TestCase
  setup do
    @performer = performers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performer" do
    assert_difference('Performer.count') do
      post :create, performer: { first_name: @performer.first_name, last_latitude: @performer.last_latitude, last_longitude: @performer.last_longitude, last_name: @performer.last_name, money_ytd: @performer.money_ytd, name: @performer.name, picture_url: @performer.picture_url, street_name: @performer.street_name }
    end

    assert_redirected_to performer_path(assigns(:performer))
  end

  test "should show performer" do
    get :show, id: @performer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performer
    assert_response :success
  end

  test "should update performer" do
    put :update, id: @performer, performer: { first_name: @performer.first_name, last_latitude: @performer.last_latitude, last_longitude: @performer.last_longitude, last_name: @performer.last_name, money_ytd: @performer.money_ytd, name: @performer.name, picture_url: @performer.picture_url, street_name: @performer.street_name }
    assert_redirected_to performer_path(assigns(:performer))
  end

  test "should destroy performer" do
    assert_difference('Performer.count', -1) do
      delete :destroy, id: @performer
    end

    assert_redirected_to performers_path
  end
end
