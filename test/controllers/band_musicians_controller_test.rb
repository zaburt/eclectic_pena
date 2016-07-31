require 'test_helper'

class BandMusiciansControllerTest < ActionController::TestCase
  setup do
    @band_musician = band_musicians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:band_musicians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band_musician" do
    assert_difference('BandMusician.count') do
      post :create, band_musician: { band_id: @band_musician.band_id, current: @band_musician.current, musician_id: @band_musician.musician_id, since: @band_musician.since, until: @band_musician.until }
    end

    assert_redirected_to band_musician_path(assigns(:band_musician))
  end

  test "should show band_musician" do
    get :show, id: @band_musician
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @band_musician
    assert_response :success
  end

  test "should update band_musician" do
    patch :update, id: @band_musician, band_musician: { band_id: @band_musician.band_id, current: @band_musician.current, musician_id: @band_musician.musician_id, since: @band_musician.since, until: @band_musician.until }
    assert_redirected_to band_musician_path(assigns(:band_musician))
  end

  test "should destroy band_musician" do
    assert_difference('BandMusician.count', -1) do
      delete :destroy, id: @band_musician
    end

    assert_redirected_to band_musicians_path
  end
end
