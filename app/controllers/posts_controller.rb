class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    # @posts = Post.all
    @posts = Post.search(params[:search])
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  public
  def remove_all
    Post.where(statusDelete: true).delete_all
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  public
  def select_all
    Post.where(user_id: current_user.id).update_all(:statusDelete => true)
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url}
      format.json { head :no_content }
    end
  end


  public
  def uncheck_all
    Post.where(user_id: current_user.id).update_all(:statusDelete => false)
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url}
      format.json { head :no_content }
    end
  end

  public
  def completed
    @post = Post.find(params[:id])
    @post.statusDelete = !@post.statusDelete
    @post.save
    respond_to do |format|
      format.html { redirect_to posts_url}
      format.json { redirect_to posts_url}
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :priority, :dueDate, :status, :statusDelete, :search)
    end
end