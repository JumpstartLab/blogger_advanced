class DashboardController < ApplicationController
  def show
    @articles = Article.for_dashboard
    @article_count = Article.count

    @comments = Comment.for_dashboard
  end
end
