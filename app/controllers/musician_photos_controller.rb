class MusicianPhotosController < ApplicationController
  before_action :set_musician_photo, only: [:show, :edit, :update, :destroy]

  # GET /musician_photos
  def index
    @musician_id = params[:musician_id]
    @musician_photos = MusicianPhoto.for_musician(@musician_id)
  end

  # GET /musician_photos/1
  def show
  end

  # GET /musician_photos/new
  def new
    @musician_id = params[:musician_id]
    @musician_photo = MusicianPhoto.new
  end

  # GET /musician_photos/1/edit
  def edit
  end

  # POST /musician_photos
  def create
    @musician_photo = MusicianPhoto.new(musician_photo_params)

    if @musician_photo.save
      redirect_to @musician_photo, notice: 'Musician photo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /musician_photos/1
  def update
    if @musician_photo.update(musician_photo_params)
      redirect_to @musician_photo, notice: 'Musician photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /musician_photos/1
  def destroy
    @musician_photo.destroy
    redirect_to musician_photos_url, notice: 'Musician photo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musician_photo
      @musician_photo = MusicianPhoto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def musician_photo_params
      params.require(:musician_photo).permit(:name, :musician_id, :image)
    end
end
