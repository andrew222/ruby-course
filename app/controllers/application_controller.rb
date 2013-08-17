class ApplicationController < ActionController::Base
  helper_method :current_user
  before_filter :require_user

  protect_from_forgery

  private
  
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

	private

	def require_user
	  unless session[:user_id]
	    flash[:error] = "You must be logged in to access this section"
	    redirect_to log_in_url # halts request cycle
	  end
	end
end
