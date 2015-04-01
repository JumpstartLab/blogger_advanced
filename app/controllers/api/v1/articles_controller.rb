class Api::V1::ArticlesController < ApplicationController
  def show
    render json: ArticleSerializer.new(Article.find(params[:id]))
  end

  def index
    render json: Article.all, each_serializer: MiniArticleSerializer
  end
end
