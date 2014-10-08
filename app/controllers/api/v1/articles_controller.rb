class Api::V1::ArticlesController < ApplicationController
  force_ssl unless Rails.env.development?

  respond_to :json, :xml

  before_action :authenticate

  def show
    respond_with Article.find(params[:id])
  end

  def index
    respond_with Article.all
  end

  def create
    respond_with Article.create(article_params)
  end

  def update
    respond_with Article.update(params[:id], article_params)
  end

  def destroy
    respond_with Article.destroy(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :author_id)
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(token: token)
    end
  end
end
