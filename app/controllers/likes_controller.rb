# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :set_article
  def create
    @article.liked = true
    @article.save!
    render json: @article
  end

  def destroy
    @article.liked = false
    @article.save!
    render json: @article
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
