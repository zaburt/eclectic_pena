require 'test_helper'

class AlbumTypesControllerTest < ActionController::TestCase
  setup do
    @album_type = album_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_type" do
    assert_difference('AlbumType.count') do
      post :create, album_type: { name: @album_type.name }
    end

    assert_redirected_to album_type_path(assigns(:album_type))
  end

  test "should show album_type" do
    get :show, id: @album_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album_type
    assert_response :success
  end

  test "should update album_type" do
    patch :update, id: @album_type, album_type: { name: @album_type.name }
    assert_redirected_to album_type_path(assigns(:album_type))
  end

  test "should destroy album_type" do
    assert_difference('AlbumType.count', -1) do
      delete :destroy, id: @album_type
    end

    assert_redirected_to album_types_path
  end
end
