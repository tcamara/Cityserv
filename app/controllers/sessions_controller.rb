class SessionsController < ApplicationController

  def authorize
    
  end
  
  def new
  end
  
  
  def index
    render :layout => false
  end

  
  def create
    @current_user = User.find_by_username_and_password(params[:login], params[:password])

    if @current_user
      session[:user_id] = @current_user.id
      redirect_to properties_path
    else
      flash[:notice] = "Unable to authenticate your information, please try again."
      redirect_to :controller => 'sessions', :action => 'index'
    end
  end


  def destroy
    session[:user_id] = @current_user = nil
  end

end
