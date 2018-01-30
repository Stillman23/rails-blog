class CommentsController < ApplicationController
  before_action :verify_admin, only: [:index]
  before_action :set_post, except: [:create, :index]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  # GET /comments
  # GET /comments.json
  def index
    @contacts = Comment.where(message_type: 'contact')
    @subs = Comment.where(message_type: [nil, 'subscribe'])
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @post.comments.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    if params[:message_type] == 'comment'
      @post = Post.find(params[:post_id])

      @comment = @post.comments.new(comment_params)
    else
      @comment = Comment.new(comment_params)
    end

    respond_to do |format|
      if @comment.save
        format.html { redirect_back(fallback_location:root_path)}
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
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
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
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(
      :name, :body, :post_id, :message_type, :email, :subject, :phone
    )
  end

  def verify_admin
    redirect_to login_path unless logged_in?
  end
end
