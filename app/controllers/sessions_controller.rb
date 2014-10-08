class SessionsController < ApplicationController
  def new
  end

  def create
    author = Author.find_by_email(params[:email])

    if author && author.authenticate(params[:password])
      session[:author_id] = author.id
      redirect_to account_path, notice: "Logged in as #{current_author.name}"
    else
      flash.now[:notice] = "Your account is invalid. Please Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'Logged out'
  end
end
