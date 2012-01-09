

describe "front dashboard" do

  it "loads from the root path" do
    visit "/"
    page.should have_content("Dashboard")
  end

  context "recent articles" do
  	it "lists the five most recent articles"

  	it "lists them in reverse chronological order"

  end

  context "recent comments" do
    it "lists the five most recent comments"

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