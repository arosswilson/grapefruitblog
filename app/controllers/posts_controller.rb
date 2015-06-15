require 'pry'
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def create
    binding.pry
    @post = Post.new post_params
    @user = User.find(@post.user_id)
    if @post.save
      redirect_to @user
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
    @comments = Comment.where(post_id: @post.id)
    @comment = @post.comments.build
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
    params.require(:post).permit(:user_id, :title, :content)
  end
end
