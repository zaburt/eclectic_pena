class BandLabelsController < ApplicationController
  before_action :set_band_label, only: [:show, :edit, :update, :destroy]

  # GET /band_labels
  def index
    @band_labels = BandLabel.all
  end

  # GET /band_labels/1
  def show
  end

  # GET /band_labels/new
  def new
    @band_label = BandLabel.new
  end

  # GET /band_labels/1/edit
  def edit
  end

  # POST /band_labels
  def create
    @band_label = BandLabel.new(band_label_params)

    if @band_label.save
      redirect_to @band_label, notice: 'Band label was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /band_labels/1
  def update
    if @band_label.update(band_label_params)
      redirect_to @band_label, notice: 'Band label was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /band_labels/1
  def destroy
    @band_label.destroy
    redirect_to band_labels_url, notice: 'Band label was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band_label
      @band_label = BandLabel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def band_label_params
      params.require(:band_label).permit(:name)
    end
end
