class CommentsController < ApplicationController
  def create
    article = Article.find(params[:comment][:article_id])
    comment = article.comments.create(params[:comment])
    flash[:notice] = "Your comment was added."
    redirect_to article_path(article)
  end
end