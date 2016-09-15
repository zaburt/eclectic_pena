class AlbumTracksController < ApplicationController
  before_action :set_album_track, only: [:show, :edit, :update, :destroy]

  # GET /album_tracks
  def index
    @album_id = params[:album_id]

    respond_to do |format|
      format.html
      format.json { render json: AlbumTracksDatatable.new(AlbumTrack, view_context) }
    end
  end

  # GET /album_tracks/1
  def show
  end

  # GET /album_tracks/new
  def new
    @album_track = AlbumTrack.new
  end

  # GET /album_tracks/1/edit
  def edit
  end

  # POST /album_tracks
  def create
    @album_track = AlbumTrack.new(album_track_params)

    if @album_track.save
      redirect_to @album_track, notice: 'Album track was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /album_tracks/1
  def update
    if @album_track.update(album_track_params)
      redirect_to @album_track, notice: 'Album track was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /album_tracks/1
  def destroy
    @album_track.destroy
    redirect_to album_tracks_url, notice: 'Album track was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_album_track
    @album_track = AlbumTrack.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def album_track_params
    params.require(:album_track).permit(:name, :album_id, :tracks)
  end

end

