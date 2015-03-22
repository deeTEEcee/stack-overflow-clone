class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_logged_out
  	if logged_in?
  		redirect_to root_url
  	end
  end

  def not_authenticated
    redirect_to login_url, :login => 'Login required'
  end

end
