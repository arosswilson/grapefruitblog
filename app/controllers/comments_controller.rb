require 'pry'
class CommentsController < ApplicationController

  def index
  end
  def show
    p params
    # @post = Post.find(params[:post_id])
    # @comment = @post.comments.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new comment_params
    @post = Post.find(params[:post_id])
    p params
    if @comment.save
      redirect_to @post
    else
      redirect :back
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.update_attributes comment_params
    @comment.save
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content, :post_id)
  end


end
