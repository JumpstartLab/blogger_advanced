class Api::V2::ArticlesController < ApplicationController
  respond_to :json

  def show
    respond_with Article.find(params[:id])
  end
end
