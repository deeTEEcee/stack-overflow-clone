class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_logged_out
  	if logged_in?
  		redirect_back_or_to root_url
  	end
  end

end
