class DashboardController < ApplicationController
  def show
    @articles = Article.for_dashboard
    @article_count = Article.count
    @article_word_count = Article.total_word_count

    @comments = Comment.for_dashboard
    @comment_count = Comment.count
  end
end
