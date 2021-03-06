class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  def index
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]['$oid']) if session[:user_id]
  end

  def authorize
  	unless current_user
  		redirect_to login_path
  	end
  end
  
  def login
    if current_user
      redirect_to listings_path
    end
  end

end
