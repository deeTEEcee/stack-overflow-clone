class UsersController < ApplicationController
  before_action :require_logged_out, :only=> [:new, :create]

  def new
    @user = User.new
    render :entry
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up"
    else
      render :entry
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
