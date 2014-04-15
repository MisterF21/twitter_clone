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
      respond_to do |format|
        format.html do
          UserMailer.signup_confirmation(@user).deliver
          flash[:notice] = "Signup successful."
          redirect_to root_url
        end
        format.js
      end
    else
      flash[:alert] = "Signup failure. Please try again."
      render 'new'
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def show
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      respond_to do |format|
        format.html do
          flash[:notice] = "Edit successful."
          redirect_to root_url
        end
        format.js
      end
    else
      flash[:alert] = "User not updated. Please try again."
      render 'edit'
    end
  end

  def destroy
    @user = User.find params[:id]
    if @user.destroy
      flash[:notice] = "User has been deleted."
      redirect_to root_url
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
