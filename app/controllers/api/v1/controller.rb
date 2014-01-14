class Api::V1::Controller < ApplicationController
  respond_to :json

  before_filter :authenticated_api_user

  def authenticated_api_user
    true
  end  
end
