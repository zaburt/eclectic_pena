class BandUrlsController < ApplicationController
  before_action :set_band_url, only: [:show, :edit, :update, :destroy]

  # GET /band_urls
  def index
    @band_id = params[:band_id]
    @band_urls = BandUrl.for_band(@band_id)
  end

  # GET /band_urls/1
  def show
  end

  # GET /band_urls/new
  def new
    @band_id = params[:band_id]
    @band_url = BandUrl.new
  end

  # GET /band_urls/1/edit
  def edit
  end

  # POST /band_urls
  def create
    @band_url = BandUrl.new(band_url_params)

    if @band_url.save
      redirect_to @band_url, notice: 'Band url was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /band_urls/1
  def update
    if @band_url.update(band_url_params)
      redirect_to @band_url, notice: 'Band url was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /band_urls/1
  def destroy
    @band_url.destroy
    redirect_to band_urls_url, notice: 'Band url was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_band_url
    @band_url = BandUrl.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def band_url_params
    params.require(:band_url).permit(:url, :band_id, :description, :date)
  end

end

