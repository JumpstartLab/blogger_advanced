class SessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:username], params[:password])
      redirect_back_or_to(root_path, message: 'Logged in successfully.')
    else
      flash.now.alert = "Login failed."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'Logged out'
  end
end
