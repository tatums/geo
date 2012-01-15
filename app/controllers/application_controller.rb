class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
   
    def require_user
      unless current_user
        store_location
        flash[:alert] = "You must be logged in to access this page"
        redirect_to login_path
        return false
      end
    end

    def store_location
       session[:return_to] = request.url
    end

    def redirect_back_or_default(default, message)
      flash[:notice] = message
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end    
    
end
