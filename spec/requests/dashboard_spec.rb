require 'spec_helper'

describe "front dashboard" do

  it "loads from the root path" do
    visit "/"
    page.should have_content("Dashboard")
  end

  context "recent articles" do
    before :each do
      6.times do
        Fabricate(:article)
      end

      visit "/"
    end

  	it "lists the five most recent articles" do
      page.should have_content("Articles:")
      all(".article").count.should eq(5)
    end

  	it "lists them in reverse chronological order" do
      titles = Article.for_dashboard.map(&:title)
      titles_on_page = page.all('li.article').map(&:text)
      titles_on_page.should eq(titles)
    end
  end

  context "recent comments" do
    before :each do
      6.times do
        Fabricate(:comment)
      end

      visit "/"
    end

    it "lists the five most recent comments" do
      page.should have_content("Comments:")
      all(".comment").count.should eq(5)
    end

    it "lists them in reverse order" do
      bodies = Comment.for_dashboard.map(&:body)
      bodies_on_page = page.all('li.comment').map(&:text)
      bodies_on_page.should eq(bodies)
    end
  end

  context "statistics" do
    it "lists the total number of articles" do
      number_of_articles = rand(10)
      number_of_articles.times { Fabricate(:article) }

      visit "/"
      page.should have_content("Total articles: #{number_of_articles}")
    end

    it "lists the total number of comments" do
      number_of_comments = rand(10)
      number_of_comments.times { Fabricate(:comment) }

      visit "/"
      page.should have_content("Total comments: #{number_of_comments}")
    end


    it "displays the total words of all articles"
    it "displays the total words of all comments"
    it "displays the time since the most recent article"
    it "displays the time since the most recent comment"
    it "displays the most active (most comments) article"
  end
end
