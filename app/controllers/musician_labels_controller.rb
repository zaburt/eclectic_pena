class MusicianLabelsController < ApplicationController
  before_action :set_musician_label, only: [:show, :edit, :update, :destroy]

  # GET /musician_labels
  def index
    @musician_labels = MusicianLabel.all
  end

  # GET /musician_labels/1
  def show
  end

  # GET /musician_labels/new
  def new
    @musician_id = params[:musician_id]
    @musician_label = MusicianLabel.new
  end

  # GET /musician_labels/1/edit
  def edit
  end

  # POST /musician_labels
  def create
    @musician_label = MusicianLabel.new(musician_label_params)

    if @musician_label.save
      redirect_to @musician_label, notice: 'Musician label was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /musician_labels/1
  def update
    if @musician_label.update(musician_label_params)
      redirect_to @musician_label, notice: 'Musician label was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /musician_labels/1
  def destroy
    @musician_label.destroy
    redirect_to musician_labels_url, notice: 'Musician label was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musician_label
      @musician_label = MusicianLabel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def musician_label_params
      params.require(:musician_label).permit(:name)
    end
end
