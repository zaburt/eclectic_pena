require 'test_helper'

class AlbumLabelsControllerTest < ActionController::TestCase
  setup do
    @album_label = album_labels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_labels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_label" do
    assert_difference('AlbumLabel.count') do
      post :create, album_label: { name: @album_label.name }
    end

    assert_redirected_to album_label_path(assigns(:album_label))
  end

  test "should show album_label" do
    get :show, id: @album_label
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album_label
    assert_response :success
  end

  test "should update album_label" do
    patch :update, id: @album_label, album_label: { name: @album_label.name }
    assert_redirected_to album_label_path(assigns(:album_label))
  end

  test "should destroy album_label" do
    assert_difference('AlbumLabel.count', -1) do
      delete :destroy, id: @album_label
    end

    assert_redirected_to album_labels_path
  end
end
