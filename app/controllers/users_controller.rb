class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "Signup successful."
      redirect_to root_url
    else
      flash[:alert] = "Signup failure. Please try again."
      render 'new'
    end
  end


private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
