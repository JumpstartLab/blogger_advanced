class Api::V1::ArticlesController < ApplicationController
  respond_to :json, :xml

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
end
