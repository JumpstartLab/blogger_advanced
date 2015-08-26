require 'spec_helper'

describe "Article Comments", :type => :feature, :js => true do

  before(:each) do
    visit new_article_path
    fill_in "article_title", with: "My Article"
    fill_in "article_body", with: "My Article Body"
    click_link_or_button "Save"
    click_link_or_button "My Article"
  end

  it "posts a comment" do
    fill_in "comment_author_name", :with => "Cowboy"
    fill_in "comment_body", :with => "Testing is too hard."
    click_link_or_button "post_comment"
    within('#comments') do
      expect(page).to have_content("Cowboy said")
      expect(page).to have_content("Testing is too hard.")
    end
  end
end
