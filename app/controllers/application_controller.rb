class ApplicationController < ActionController::Base
  helper_method :current_author
  helper_method :current_tenant

  def current_author
    @current_author ||= Author.find_by(id: session[:author_id])
  end

  def current_tenant
    @current_tenant ||= Tenant.find_by(slug: session[:tenant_slug])
  end

  def require_author
    unless current_author
      redirect_to login_path, notice: "You must be logged in to go there"
    end
  end
end
