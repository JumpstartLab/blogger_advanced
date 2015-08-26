class CommentsController < ApplicationController
  def create
    article = Article.find(params[:comment][:article_id])
    comment = article.comments.create(comment_params)

    render partial: "articles/comment", locals: {comment: comment, article: article}
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :author_name, :body)
  end
end
