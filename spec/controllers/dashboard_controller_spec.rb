require 'spec_helper'

describe DashboardController do
  describe "show" do
    it "assigns @articles" do
      articles = stub
      Article.should_receive(:for_dashboard).and_return(articles)
      get :show
      assigns(:articles).should eq(articles)
    end

    it "assigns @comments" do
      comments = stub
      Comment.should_receive(:for_dashboard).and_return(comments)
      get :show
      assigns(:comments).should eq(comments)
    end
  end
end
