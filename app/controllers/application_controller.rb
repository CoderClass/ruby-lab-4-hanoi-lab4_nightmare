class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
  	@current_user if @current_user
  	if session[:username]
  		@current_user = session[:username]
  	end
  end
end
