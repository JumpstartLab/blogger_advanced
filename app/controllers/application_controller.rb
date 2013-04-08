class ApplicationController < ActionController::Base

  helper_method :current_author

  def current_author
    Author.find session[:author_id]
  end

end
