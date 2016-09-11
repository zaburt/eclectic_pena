class MusiciansController < ApplicationController
  before_action :set_musician, only: [:show, :edit, :update, :destroy]

  # GET /musicians
  def index
    # @musicians = Musician.all

    respond_to do |format|
      format.html
      format.json { render json: MusiciansDatatable.new(Musician, view_context) }
    end
  end

  # GET /musicians/1
  def show
  end

  # GET /musicians/new
  def new
    @musician = Musician.new
  end

  # GET /musicians/1/edit
  def edit
    @edit_labels = params[:edit_labels]
  end

  # POST /musicians
  def create
    @musician = Musician.new(musician_params)

    if @musician.save
      redirect_to @musician, notice: 'Musician was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /musicians/1
  def update
    if @musician.update(musician_params)
      redirect_to @musician, notice: 'Musician was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /musicians/1
  def destroy
    @musician.destroy
    redirect_to musicians_url, notice: 'Musician was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musician
      @musician = Musician.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def musician_params
      params.require(:musician).permit(:name, :birthdate, :country, :website, :biography, :musician_label_ids => [])
    end
end
