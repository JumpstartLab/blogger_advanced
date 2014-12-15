class Tenants::SessionsController < ApplicationController
  def new
    @tenant = Tenant.find_by(slug: params[:slug])

    unless @tenant
      redirect_to root_path, notice: "The tenant does not exist."
    end
  end

  def create
    @tenant = Tenant.find_by(slug: params[:slug])
    author  = @tenant.authors.find_by_email(params[:email])

    if author && author.authenticate(params[:password])
      session[:author_id], session[:tenant_slug] = author.id, @tenant.slug

      redirect_to tenant_account_path(@tenant.slug), notice: "Logged in as #{current_author.name}"
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
