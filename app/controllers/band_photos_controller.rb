class BandPhotosController < ApplicationController
  before_action :set_band_photo, only: [:show, :edit, :update, :destroy]

  # GET /band_photos
  def index
    @band_photos = BandPhoto.all
  end

  # GET /band_photos/1
  def show
  end

  # GET /band_photos/new
  def new
    @band_id = params[:band_id]
    @band_photo = BandPhoto.new
  end

  # GET /band_photos/1/edit
  def edit
  end

  # POST /band_photos
  def create
    @band_photo = BandPhoto.new(band_photo_params)

    if @band_photo.save
      redirect_to @band_photo, notice: 'Band photo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /band_photos/1
  def update
    if @band_photo.update(band_photo_params)
      redirect_to @band_photo, notice: 'Band photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /band_photos/1
  def destroy
    @band_photo.destroy
    redirect_to band_photos_url, notice: 'Band photo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band_photo
      @band_photo = BandPhoto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def band_photo_params
      params.require(:band_photo).permit(:name, :band_id, :image)
    end
end
