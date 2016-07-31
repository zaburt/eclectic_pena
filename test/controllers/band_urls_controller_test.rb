require 'test_helper'

class BandUrlsControllerTest < ActionController::TestCase
  setup do
    @band_url = band_urls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:band_urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band_url" do
    assert_difference('BandUrl.count') do
      post :create, band_url: { band_id: @band_url.band_id, date: @band_url.date, description: @band_url.description, url: @band_url.url }
    end

    assert_redirected_to band_url_path(assigns(:band_url))
  end

  test "should show band_url" do
    get :show, id: @band_url
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @band_url
    assert_response :success
  end

  test "should update band_url" do
    patch :update, id: @band_url, band_url: { band_id: @band_url.band_id, date: @band_url.date, description: @band_url.description, url: @band_url.url }
    assert_redirected_to band_url_path(assigns(:band_url))
  end

  test "should destroy band_url" do
    assert_difference('BandUrl.count', -1) do
      delete :destroy, id: @band_url
    end

    assert_redirected_to band_urls_path
  end
end
