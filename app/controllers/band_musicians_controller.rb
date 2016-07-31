class BandMusiciansController < ApplicationController
  before_action :set_band_musician, only: [:show, :edit, :update, :destroy]

  # GET /band_musicians
  def index
    @band_musicians = BandMusician.all
  end

  # GET /band_musicians/1
  def show
  end

  # GET /band_musicians/new
  def new
    @band_musician = BandMusician.new
  end

  # GET /band_musicians/1/edit
  def edit
  end

  # POST /band_musicians
  def create
    @band_musician = BandMusician.new(band_musician_params)

    if @band_musician.save
      redirect_to @band_musician, notice: 'Band musician was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /band_musicians/1
  def update
    if @band_musician.update(band_musician_params)
      redirect_to @band_musician, notice: 'Band musician was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /band_musicians/1
  def destroy
    @band_musician.destroy
    redirect_to band_musicians_url, notice: 'Band musician was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band_musician
      @band_musician = BandMusician.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def band_musician_params
      params.require(:band_musician).permit(:band_id, :musician_id, :since, :until, :current)
    end
end
