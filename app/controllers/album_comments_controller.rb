class AlbumCommentsController < ApplicationController
  before_action :set_album_comment, only: [:show, :edit, :update, :destroy]

  # GET /album_comments
  def index
    @album_comments = AlbumComment.all
  end

  # GET /album_comments/1
  def show
  end

  # GET /album_comments/new
  def new
    @album_comment = AlbumComment.new
  end

  # GET /album_comments/1/edit
  def edit
  end

  # POST /album_comments
  def create
    @album_comment = AlbumComment.new(album_comment_params)

    if @album_comment.save
      redirect_to @album_comment, notice: 'Album comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /album_comments/1
  def update
    if @album_comment.update(album_comment_params)
      redirect_to @album_comment, notice: 'Album comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /album_comments/1
  def destroy
    @album_comment.destroy
    redirect_to album_comments_url, notice: 'Album comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_comment
      @album_comment = AlbumComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_comment_params
      params.require(:album_comment).permit(:album_id, :user_id, :publish, :comment)
    end
end
