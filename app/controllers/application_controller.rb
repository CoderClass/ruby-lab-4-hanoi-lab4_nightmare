class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
  	@current_user if @current_user
  	if session[:user_name]
  		@current_user = session[:user_name]
  	end
  end
end
