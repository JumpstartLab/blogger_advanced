require 'spec_helper'

describe "front dashboard", :type => :feature do

  it "loads from the root path" do
    visit "/"
    expect(page).to have_content("Dashboard")
  end

  context "recent articles" do
    before :each do
      6.times do |i|
        Fabricate(:article, :title => "Title #{i}")
      end

      visit "/"
    end

  	it "lists the five most recent articles" do
      expect(page).to have_content("Most Recent Articles")
      expect(all(".article").count).to eq(5)
    end

  	it "lists them in reverse chronological order" do
      titles = page.all('li.article').map(&:text)
      titles.each_with_index do |title, i|
        expect(title).to include("Title #{titles.size - i}")
      end
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
      expect(page).to have_content("Most Recent Comments")
      expect(all(".comment").count).to eq(5)
    end

    it "lists them in reverse order" do
      listings = page.all('li.comment').map(&:text)
      listings.each_with_index do |listing, i|
        expect(listing).to include("Body #{listings.size - i}")
      end
    end
  end

  context "#statistics" do
    it "lists the total number of articles" do
      number_of_articles = rand(10)
      number_of_articles.times { Fabricate(:article) }
      visit "/"
      expect(page.find("#total_articles")).to have_content("Total articles: #{number_of_articles}")
    end

    it "lists the total number of comments" do
      number_of_comments = rand(10)
      number_of_comments.times { Fabricate(:comment) }
      visit "/"
      expect(page.find("#total_comments")).to have_content("Total comments: #{number_of_comments}")
    end

    it "displays the total words of all articles" do
      Fabricate(:article, :body => "Four score and seven years...")
      visit "/"
      expect(page.find("#total_article_words")).to have_content("5")
    end

    it "displays the total words of all comments" do
      Fabricate(:comment, :body => "I think that...")
      visit "/"
      expect(page.find("#total_comment_words")).to have_content("3")
    end

    it "displays the total words of all articles and comments" do
      article = Fabricate(:article, :body => "Four score and seven years...")
      comment = Fabricate(:comment, :body => "I think that...", :article => article)
      visit "/"
      expect(page.find("#total_words")).to have_content(comment.word_count + article.word_count)
    end

    it "displays the most popular (most comments) article" do
      articles = (0..3).collect{ Fabricate(:article) }
      target = articles[rand(articles.size)]
      Fabricate(:comment, :article => target)
      visit "/"
      expect(page.find("#most_popular")).to have_content(target.title)
    end


    # it "displays the time since the most recent article"
    # it "displays the time since the most recent comment"

  end
end
