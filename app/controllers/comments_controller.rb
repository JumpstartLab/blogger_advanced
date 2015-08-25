class CommentsController < ApplicationController
  def create
    article = Article.find(params[:comment][:article_id])
    comment = article.comments.new(comment_params)

    comment.save!
    render partial: "articles/comment", locals: {comment: comment, article: article}, layout: false
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :author_name, :body)
  end
end
