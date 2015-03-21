class SessionsController < ApplicationController
	before_action :require_logged_out, :only => [:new, :create]
	before_action :require_login, :only => [:logout, :destroy]

  def new
  	@user = User.new
  	render 'users/entry'
  end

	def create
	  if @user = login(session_params[:username], session_params[:password])
	    redirect_back_or_to root_url #, :notice => "Logged in!"
	  else
	    flash.now.alert = "Email or password was invalid"
	    render :new
	  end
	end

	def logout_user # way to have it named logout and call Sorcery method from namespace?
		render :logout
	end

	def destroy
	  logout
	  redirect_to root_url #, :notice => "Logged out!"
	end

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
