class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: params[:locale]}.merge options
  end

  def require_logged_out
    if logged_in?
      redirect_to root_url
    end
  end

  def not_authenticated
    flash[:login] = 'Login required'
    redirect_to login_url
  end

end
