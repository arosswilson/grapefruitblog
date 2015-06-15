class SessionsController < ApplicationController

  def index
    @user = User.new
  end
  def login
    @user = User.find_by(session_params[:username])
    if @user.password = params.password
      session[:user_id] = @user.id
      redirect to @user
    else
      @error_message = true
      redirect :back
    end
  end

  def logout
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end

end
