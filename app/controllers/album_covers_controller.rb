class AlbumCoversController < ApplicationController
  before_action :set_album_cover, only: [:show, :edit, :update, :destroy]

  # GET /album_covers
  def index
    @album_covers = AlbumCover.all
  end

  # GET /album_covers/1
  def show
  end

  # GET /album_covers/new
  def new
    @album_cover = AlbumCover.new
  end

  # GET /album_covers/1/edit
  def edit
  end

  # POST /album_covers
  def create
    @album_cover = AlbumCover.new(album_cover_params)

    if @album_cover.save
      redirect_to @album_cover, notice: 'Album cover was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /album_covers/1
  def update
    if @album_cover.update(album_cover_params)
      redirect_to @album_cover, notice: 'Album cover was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /album_covers/1
  def destroy
    @album_cover.destroy
    redirect_to album_covers_url, notice: 'Album cover was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_cover
      @album_cover = AlbumCover.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_cover_params
      params.require(:album_cover).permit(:name, :album_id)
    end
end
