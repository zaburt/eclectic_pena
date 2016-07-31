require 'test_helper'

class BandLabelsControllerTest < ActionController::TestCase
  setup do
    @band_label = band_labels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:band_labels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band_label" do
    assert_difference('BandLabel.count') do
      post :create, band_label: { name: @band_label.name }
    end

    assert_redirected_to band_label_path(assigns(:band_label))
  end

  test "should show band_label" do
    get :show, id: @band_label
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @band_label
    assert_response :success
  end

  test "should update band_label" do
    patch :update, id: @band_label, band_label: { name: @band_label.name }
    assert_redirected_to band_label_path(assigns(:band_label))
  end

  test "should destroy band_label" do
    assert_difference('BandLabel.count', -1) do
      delete :destroy, id: @band_label
    end

    assert_redirected_to band_labels_path
  end
end
