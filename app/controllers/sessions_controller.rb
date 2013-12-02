class SessionsController < ApplicationController

  def new
  end

  def create
    author = Author.find_or_create_by_name(params[:session][:login_name].downcase)
    session[:author_id] = author.id
    redirect_to articles_path, :notice => "Logged in as #{current_author.name}"
  end

  def destroy
    session.clear
    redirect_to root_path, :notice => 'Logged out'
  end
end
