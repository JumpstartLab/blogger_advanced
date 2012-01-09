require 'spec_helper'

describe DashboardController do
  describe "show" do
    it "assigns @articles" do
      articles = stub
      Article.should_receive(:for_dashboard).and_return(articles)
      get :show
      assigns(:articles).should eq(articles)
    end
  end
end
