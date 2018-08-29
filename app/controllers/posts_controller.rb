class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.search(params[:search])
    @posts = []
    @post.each do |post|
      @posts.push(post) if post.user == current_user
    end
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html {redirect_to @post}
        format.json {render :show, status: :created, location: @post}
      else
        format.html {render :new}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html {redirect_to @post}
        format.json {render :show, status: :ok, location: @post}
      else
        format.html {render :edit}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to posts_url}
      format.json {head :no_content}
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  public

  def completed
    @post = Post.find(params[:id])
    @post.statusDelete = !@post.statusDelete
    @post.save
    respond_to do |format|
      format.html {redirect_to posts_url}
      format.json {redirect_to posts_url}
    end
  end

  def done
    @post = Post.find(params[:id])
    @post.status = !@post.status
    @post.save
    respond_to do |format|
      format.js
      format.html {redirect_to posts_url}
      format.json {head :no_content}
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :priority, :dueDate, :status, :statusDelete, :search)
  end
end
