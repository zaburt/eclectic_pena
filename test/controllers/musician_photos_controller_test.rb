require 'test_helper'

class MusicianPhotosControllerTest < ActionController::TestCase
  setup do
    @musician_photo = musician_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:musician_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create musician_photo" do
    assert_difference('MusicianPhoto.count') do
      post :create, musician_photo: { musician_id: @musician_photo.musician_id, name: @musician_photo.name }
    end

    assert_redirected_to musician_photo_path(assigns(:musician_photo))
  end

  test "should show musician_photo" do
    get :show, id: @musician_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @musician_photo
    assert_response :success
  end

  test "should update musician_photo" do
    patch :update, id: @musician_photo, musician_photo: { musician_id: @musician_photo.musician_id, name: @musician_photo.name }
    assert_redirected_to musician_photo_path(assigns(:musician_photo))
  end

  test "should destroy musician_photo" do
    assert_difference('MusicianPhoto.count', -1) do
      delete :destroy, id: @musician_photo
    end

    assert_redirected_to musician_photos_path
  end
end
