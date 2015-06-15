class UsersController < ApplicationController
  def index
     "hi"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.password = params[:password]
      session[:user_id] = @user.id
      redirect_to @user
    end

  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
