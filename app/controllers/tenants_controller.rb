class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end
end
