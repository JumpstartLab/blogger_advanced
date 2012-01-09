require 'spec_helper'

describe "front dashboard" do

  it "loads from the root path" do
    visit "/"
    page.should have_content("Dashboard")
  end

  context "recent articles" do
    before :each do
      6.times do |i|
        Fabricate(:article, :title => "Title #{i}")
      end

      visit "/"
    end

  	it "lists the five most recent articles" do
      page.should have_content("Articles:")
      all(".article").count.should eq(5)
    end

  	it "lists them in reverse chronological order" do
      titles = page.all('li.article').map(&:text)
      titles.should eq(["Title 5", "Title 4", "Title 3", "Title 2", "Title 1"])
    end
  end

  context "recent comments" do
    before :each do
      6.times do |i|
        Fabricate(:comment, :body => "Body #{i}")
      end

      visit "/"
    end

    it "lists the five most recent comments" do
      page.should have_content("Comments:")
      all(".comment").count.should eq(5)
    end

    it "lists them in reverse order" do
      bodies = page.all('li.comment').map(&:text)
      bodies.should eq(["Body 5", "Body 4", "Body 3", "Body 2", "Body 1"])
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


    it "displays the total words of all articles" do
      Fabricate(:article, :body => "Four score and seven years...")

      visit "/"

      page.should have_content("Total words: 5")
    end

    it "displays the total words of all comments" do
      Fabricate(:comment, :body => "I think that...")

      visit "/"

      page.should have_content("Total words: 3")
    end
    it "displays the time since the most recent article"
    it "displays the time since the most recent comment"
    it "displays the most active (most comments) article"
  end
end
