class AlbumTypesController < ApplicationController
  before_action :set_album_type, only: [:show, :edit, :update, :destroy]

  # GET /album_types
  def index
    @album_types = AlbumType.all
  end

  # GET /album_types/1
  def show
  end

  # GET /album_types/new
  def new
    @album_type = AlbumType.new
  end

  # GET /album_types/1/edit
  def edit
  end

  # POST /album_types
  def create
    @album_type = AlbumType.new(album_type_params)

    if @album_type.save
      redirect_to @album_type, notice: 'Album type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /album_types/1
  def update
    if @album_type.update(album_type_params)
      redirect_to @album_type, notice: 'Album type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /album_types/1
  def destroy
    @album_type.destroy
    redirect_to album_types_url, notice: 'Album type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_type
      @album_type = AlbumType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_type_params
      params.require(:album_type).permit(:name)
    end
end
