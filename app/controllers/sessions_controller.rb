class SessionsController < ApplicationController
  def new
  end

  def create
    author = Author.find_by_email(params[:email])

    if author && author.authenticate(params[:password])
      session[:author_id] = author.id
      redirect_to account_path, :notice => "Logged in as #{current_author.name}"
    else
      redirect_to root_path, flash.notice = "Your account is invalid. Please Try Again."
    end
  end

  def destroy
    session.clear
    redirect_to root_path, :notice => 'Logged out'
  end
end
