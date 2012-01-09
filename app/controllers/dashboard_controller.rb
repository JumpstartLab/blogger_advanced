class DashboardController < ApplicationController
  def show
    @articles = Article.for_dashboard
    @comments = Comment.for_dashboard
  end
end
