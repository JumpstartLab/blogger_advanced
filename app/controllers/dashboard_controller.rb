class DashboardController < ApplicationController
  def show
    @articles = Article.for_dashboard
  end
end
