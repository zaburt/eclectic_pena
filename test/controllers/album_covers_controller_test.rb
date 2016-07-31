require 'test_helper'

class AlbumCoversControllerTest < ActionController::TestCase
  setup do
    @album_cover = album_covers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_covers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_cover" do
    assert_difference('AlbumCover.count') do
      post :create, album_cover: { album_id: @album_cover.album_id, name: @album_cover.name }
    end

    assert_redirected_to album_cover_path(assigns(:album_cover))
  end

  test "should show album_cover" do
    get :show, id: @album_cover
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album_cover
    assert_response :success
  end

  test "should update album_cover" do
    patch :update, id: @album_cover, album_cover: { album_id: @album_cover.album_id, name: @album_cover.name }
    assert_redirected_to album_cover_path(assigns(:album_cover))
  end

  test "should destroy album_cover" do
    assert_difference('AlbumCover.count', -1) do
      delete :destroy, id: @album_cover
    end

    assert_redirected_to album_covers_path
  end
end
