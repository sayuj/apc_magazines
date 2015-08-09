class CommentsController < ApplicationController
  before_action :set_magazine, :set_article
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = @article.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @article.comments.new
    @comment.parent_id = params[:parent_id] if params[:parent_id]
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to magazine_article_path(@magazine, @article), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to magazine_article_path(@magazine, @article), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if @comment.sub_comments
      message = 'This comment cannot be deleted; there are sub comments associated.'
    else
      @comment.destroy
      message = 'Comment was successfully destroyed.'
    end
    respond_to do |format|
      format.html { redirect_to magazine_article_path(@magazine, @article), notice: message }
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_magazine
    @magazine = Magazine.find(params[:magazine_id])
  end

  def set_article
    @article = @magazine.articles.find(params[:article_id]) if @magazine
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:comment, :parent_id)
  end
end
