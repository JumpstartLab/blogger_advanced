class ApplicationController < ActionController::Base
  helper_method :current_author

  def current_author
    Author.find_by_id session[:author_id]
  end

  def require_author
    unless current_author
      redirect_to login_path, notice: "You must be logged in to go there"
    end
  end

end
