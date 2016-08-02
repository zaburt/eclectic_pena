require 'test_helper'

class AlbumCommentsControllerTest < ActionController::TestCase
  setup do
    @album_comment = album_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_comment" do
    assert_difference('AlbumComment.count') do
      post :create, album_comment: { album_id: @album_comment.album_id, comment: @album_comment.comment, publish: @album_comment.publish, user_id: @album_comment.user_id }
    end

    assert_redirected_to album_comment_path(assigns(:album_comment))
  end

  test "should show album_comment" do
    get :show, id: @album_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album_comment
    assert_response :success
  end

  test "should update album_comment" do
    patch :update, id: @album_comment, album_comment: { album_id: @album_comment.album_id, comment: @album_comment.comment, publish: @album_comment.publish, user_id: @album_comment.user_id }
    assert_redirected_to album_comment_path(assigns(:album_comment))
  end

  test "should destroy album_comment" do
    assert_difference('AlbumComment.count', -1) do
      delete :destroy, id: @album_comment
    end

    assert_redirected_to album_comments_path
  end
end
