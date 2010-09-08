class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Accepted"
      redirect_to properties_path
    else
      flash[:notice] = "Registration Failed"
      render :action => 'new'
    end
  end


  def new
    @user = User.new
  end


  def edit
  end


  def show
  end

  
  def destroy
  end

end
