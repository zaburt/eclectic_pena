require 'test_helper'

class AlbumTracksControllerTest < ActionController::TestCase
  setup do
    @album_track = album_tracks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_tracks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_track" do
    assert_difference('AlbumTrack.count') do
      post :create, album_track: { album_id: @album_track.album_id, name: @album_track.name, tracks: @album_track.tracks }
    end

    assert_redirected_to album_track_path(assigns(:album_track))
  end

  test "should show album_track" do
    get :show, id: @album_track
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album_track
    assert_response :success
  end

  test "should update album_track" do
    patch :update, id: @album_track, album_track: { album_id: @album_track.album_id, name: @album_track.name, tracks: @album_track.tracks }
    assert_redirected_to album_track_path(assigns(:album_track))
  end

  test "should destroy album_track" do
    assert_difference('AlbumTrack.count', -1) do
      delete :destroy, id: @album_track
    end

    assert_redirected_to album_tracks_path
  end
end
