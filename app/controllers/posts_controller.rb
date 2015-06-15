class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to root_url
    else
      redirect :back
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end

  def update
    @post.update_attributes post_params
    if @post.save
      redirect_to @post
    else
      redirect :back
    end
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:author, :title, :content)
  end
end
