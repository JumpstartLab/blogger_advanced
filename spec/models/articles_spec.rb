require 'spec_helper'

describe Article do
  let(:article) { Fabricate(:article) }
  
  [:title, :body].each do |attribute|
    it "is not valid without a #{attribute}" do
      article.update_attributes(attribute => nil)
      subject.should_not be_valid
    end
  end
  
  context "when it has invalid attributes" do
    it "raises an execption when hard saving" do
      article.title = nil
      expect{article.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  it "must have a unique title" do
    article.save
    second = article.dup
    second.should_not be_valid
  end
  
  it "returns the title when converted to a string" do
    article.to_s.should == article.title
  end

  it "responds to comments" do
    article.should respond_to(:comments)
  end

  it "responds to .valid_ids with a set of all current article IDs" do
    Article.valid_ids.should == Article.select(:id).collect{|a| a.id}
  end

  context ".for_dashboard" do
    it "gives the most recent 5 articles" do
      6.times do
        Fabricate(:article)
      end
      expected = Article.order('created_at DESC').limit(5).all

      articles = Article.for_dashboard
      articles.count.should eq(5)
      articles.should eq(expected)
    end
  end

  context ".total_word_count" do
    it "gives the word count for all articles" do
      2.times { Fabricate(:article) }

      count = Article.all.inject(0) {|total, a| total += a.word_count }

      Article.total_word_count.should eq(count)
    end
  end

  context "#word_count" do
    it "gives the total number of words" do
      article.word_count.should eq(article.body.split.count)
    end
  end
end
