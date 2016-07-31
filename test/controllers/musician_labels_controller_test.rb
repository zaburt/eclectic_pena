require 'test_helper'

class MusicianLabelsControllerTest < ActionController::TestCase
  setup do
    @musician_label = musician_labels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:musician_labels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create musician_label" do
    assert_difference('MusicianLabel.count') do
      post :create, musician_label: { name: @musician_label.name }
    end

    assert_redirected_to musician_label_path(assigns(:musician_label))
  end

  test "should show musician_label" do
    get :show, id: @musician_label
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @musician_label
    assert_response :success
  end

  test "should update musician_label" do
    patch :update, id: @musician_label, musician_label: { name: @musician_label.name }
    assert_redirected_to musician_label_path(assigns(:musician_label))
  end

  test "should destroy musician_label" do
    assert_difference('MusicianLabel.count', -1) do
      delete :destroy, id: @musician_label
    end

    assert_redirected_to musician_labels_path
  end
end
