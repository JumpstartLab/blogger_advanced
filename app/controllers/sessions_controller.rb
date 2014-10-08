class SessionsController < ApplicationController
  def new
  end

  def create
    session[:author_id] = Author.random.id
    redirect_to account_path, :notice => "Logged in as #{current_author.name}"
  end

  def destroy
    session.clear
    redirect_to root_path, :notice => 'Logged out'
  end
end
