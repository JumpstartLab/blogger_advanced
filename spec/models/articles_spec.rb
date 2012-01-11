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
      2.times { Fabricate(:article, :body => "I think that...") }

      Article.total_word_count.should eq(6)
    end
  end

  context "#word_count" do
    it "gives the total number of words" do
      article = Fabricate(:article, :body => "Four score and seven years ago...")
      article.word_count.should eq(6)
    end
  end

  context ".most_popular" do
    it "returns the article with the most comments" do
      articles = (0..5).collect{ Fabricate(:article) }
      Comment.destroy_all      
      target = articles[rand(articles.length)]
      Fabricate(:comment, :article => target)
      Article.most_popular.should == target
    end
  end

  context ".search_by_tag_name" do
    context "when given no parameter" do
      it "should return all the articles" do
        articles, tag = Article.search_by_tag_name(nil)
        articles.should == Article.all
      end
    end

    context "when given a tag name" do
      context "and the tag exists" do
        it "should return the articles associated with that tag and the tag" do
          tag = Fabricate(:tag)
          tag.articles = [Fabricate(:article), Fabricate(:article)]
          Article.search_by_tag_name(tag.name).should == [tag.articles, tag]
        end
      end

      context "but the tag does not exist" do
        it "should return an empty list of articles and no tag" do
          bad_name = Fabricate(:tag).name + "_no_exist"
          Article.search_by_tag_name(bad_name).should == [[], nil]
        end
      end
    end
  end
end
