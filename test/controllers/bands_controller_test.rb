require 'test_helper'

class BandsControllerTest < ActionController::TestCase
  setup do
    @band = bands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band" do
    assert_difference('Band.count') do
      post :create, band: { biography: @band.biography, country: @band.country, musician_is_band: @band.musician_is_band, name: @band.name, website: @band.website }
    end

    assert_redirected_to band_path(assigns(:band))
  end

  test "should show band" do
    get :show, id: @band
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @band
    assert_response :success
  end

  test "should update band" do
    patch :update, id: @band, band: { biography: @band.biography, country: @band.country, musician_is_band: @band.musician_is_band, name: @band.name, website: @band.website }
    assert_redirected_to band_path(assigns(:band))
  end

  test "should destroy band" do
    assert_difference('Band.count', -1) do
      delete :destroy, id: @band
    end

    assert_redirected_to bands_path
  end
end
