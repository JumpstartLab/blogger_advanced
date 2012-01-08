require 'spec_helper'

describe Comment do
  before(:each) do
    @article = Article.create(:title => "Hello, World", 
                              :body => "Sample Body.")
    @comment = @article.comments.create(:author_name => "Daffy Duck",
                                        :body => "My comment goes here.")
  end

  it "should be valid with valid attributes" do
    @article.should be_valid
    @comment.should be_valid
  end

  it "should respond to article" do
    @comment.should respond_to(:article)
  end

  it "must have a value in article_id" do
    @comment.article_id = nil
    @comment.should_not be_valid
  end

end
