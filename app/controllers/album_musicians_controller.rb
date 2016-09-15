class AlbumMusiciansController < ApplicationController
  before_action :set_album_musician, only: [:show, :edit, :update, :destroy]

  # GET /album_musicians
  def index
    @album_musicians = AlbumMusician.all
  end

  # GET /album_musicians/1
  def show
  end

  # GET /album_musicians/new
  def new
    @album_musician = AlbumMusician.new
  end

  # GET /album_musicians/1/edit
  def edit
  end

  # POST /album_musicians
  def create
    @album_musician = AlbumMusician.new(album_musician_params)

    if @album_musician.save
      redirect_to @album_musician, notice: 'Album musician was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /album_musicians/1
  def update
    if @album_musician.update(album_musician_params)
      redirect_to @album_musician, notice: 'Album musician was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /album_musicians/1
  def destroy
    @album_musician.destroy
    redirect_to album_musicians_url, notice: 'Album musician was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_album_musician
    @album_musician = AlbumMusician.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def album_musician_params
    params.require(:album_musician).permit(:album_id, :musician_id, :instrument, :is_guest)
  end

end

