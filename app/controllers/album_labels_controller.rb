class AlbumLabelsController < ApplicationController
  before_action :set_album_label, only: [:show, :edit, :update, :destroy]

  # GET /album_labels
  def index
    @album_labels = AlbumLabel.all
  end

  # GET /album_labels/1
  def show
  end

  # GET /album_labels/new
  def new
    @album_label = AlbumLabel.new
  end

  # GET /album_labels/1/edit
  def edit
  end

  # POST /album_labels
  def create
    @album_label = AlbumLabel.new(album_label_params)

    if @album_label.save
      redirect_to @album_label, notice: 'Album label was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /album_labels/1
  def update
    if @album_label.update(album_label_params)
      redirect_to @album_label, notice: 'Album label was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /album_labels/1
  def destroy
    @album_label.destroy
    redirect_to album_labels_url, notice: 'Album label was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_label
      @album_label = AlbumLabel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_label_params
      params.require(:album_label).permit(:name)
    end
end
