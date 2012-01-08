class CommentsController < ApplicationController
  def create
    a = Article.find(params[:comment][:article_id])
    c = a.comments.new(params[:comment])
    c.save
    flash[:notice] = "Your comment was added."
    redirect_to article_path(a)
  end
end