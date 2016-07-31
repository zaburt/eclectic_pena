require 'test_helper'

class AlbumMusiciansControllerTest < ActionController::TestCase
  setup do
    @album_musician = album_musicians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_musicians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_musician" do
    assert_difference('AlbumMusician.count') do
      post :create, album_musician: { album_id: @album_musician.album_id, instrument: @album_musician.instrument, is_guest: @album_musician.is_guest, musician_id: @album_musician.musician_id }
    end

    assert_redirected_to album_musician_path(assigns(:album_musician))
  end

  test "should show album_musician" do
    get :show, id: @album_musician
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album_musician
    assert_response :success
  end

  test "should update album_musician" do
    patch :update, id: @album_musician, album_musician: { album_id: @album_musician.album_id, instrument: @album_musician.instrument, is_guest: @album_musician.is_guest, musician_id: @album_musician.musician_id }
    assert_redirected_to album_musician_path(assigns(:album_musician))
  end

  test "should destroy album_musician" do
    assert_difference('AlbumMusician.count', -1) do
      delete :destroy, id: @album_musician
    end

    assert_redirected_to album_musicians_path
  end
end
