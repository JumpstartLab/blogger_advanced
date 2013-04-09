class ApplicationController < ActionController::Base

  def require_login
    unless current_user
      redirect_to login_path, notice: "You must be logged in to go there"
    end
  end

end
