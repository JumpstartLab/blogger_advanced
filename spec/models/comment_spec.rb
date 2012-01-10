require 'spec_helper'

describe Comment do
  let(:comment) { Fabricate(:comment) }

  it "should be valid with valid attributes" do
    comment.should be_valid
  end

  it "should respond to article" do
    comment.should respond_to(:article)
  end

  it "must have a value in article_id" do
    comment.article_id = nil
    comment.should_not be_valid
  end

  context ".for_dashboard" do
    it "gives the most recent 5 comments" do
      6.times do
        Fabricate(:comment)
      end
      expected = Comment.order('created_at DESC').limit(5).all

      comments = Comment.for_dashboard
      comments.count.should eq(5)
      comments.should eq(expected)
    end
  end

  context ".total_word_count" do
    it "gives the word count for all comments" do
      2.times { Fabricate(:comment, :body => "I think that...") }

      Comment.total_word_count.should eq(6)
    end
  end

  context "#word_count" do
    it "gives the total number of words" do
      comment = Fabricate(:article, :body => "Four score and seven years ago...")
      comment.word_count.should eq(6)
    end
  end
end
