class ApplicationController < ActionController::Base
  helper :all 
  protect_from_forgery 

  before_filter :fetch_logged_in_user
  before_filter :authorize

  protected

    def fetch_logged_in_user
      return unless session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
    end


    def logged_in?
      ! @current_user.nil?
    end
    helper_method :logged_in?


    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to :controller => 'sessions', :action => 'index'
      end
    end
    
    
    def login_required
      return true if logged_in?
      session[:return_to] = request.request_uri
      redirect_to session_path and return false
    end

end
