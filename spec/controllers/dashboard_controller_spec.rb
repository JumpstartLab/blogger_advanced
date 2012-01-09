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

    it "assigns @article_count" do
      Article.should_receive(:count).and_return(4)
      get :show
      assigns(:article_count).should eq(4)
    end

    it "assigns @comment_count" do
      Comment.should_receive(:count).and_return(4)
      get :show
      assigns(:comment_count).should eq(4)
    end

    it "assigns @article_word_count" do
      Article.should_receive(:total_word_count).and_return(150)
      get :show
      assigns(:article_word_count).should eq(150)
    end

    it "assigns @comment_word_count" do
      Comment.should_receive(:total_word_count).and_return(150)
      get :show
      assigns(:comment_word_count).should eq(150)
    end
  end
end
