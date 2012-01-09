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
      recent_titles = Article.for_dashboard.map(&:title).map{|t| Regexp.quote(t) }
      title_regex = Regexp.new(recent_titles.join(".*?"), Regexp::MULTILINE)
      page.html.should match(title_regex)
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

    it "lists them in reverse order"
  end

  context "statistics" do
    it "lists the total number of articles"
    it "lists the total number of comments"
    it "displays the total words of all articles"
    it "displays the total words of all comments"
    it "displays the time since the most recent article"
    it "displays the time since the most recent comment"
    it "displays the most active (most comments) article"
  end
end
