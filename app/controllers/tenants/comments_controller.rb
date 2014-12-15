class Tenants::CommentsController < ApplicationController
  def create
    article = current_author.articles.find(params[:comment][:article_id])
    comment = article.comments.create(comment_params)

    flash[:notice] = "Your comment was added."
    redirect_to tenant_article_path(current_tenant.slug, article)
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :author_name, :body)
  end
end
