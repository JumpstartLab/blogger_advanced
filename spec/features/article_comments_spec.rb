require 'spec_helper'

describe "Article Comments" do
  let(:article){ Fabricate(:article) }

  it "posts a comment" do
    visit article_path(article)
    fill_in "comment_author_name", :with => "Cowboy"
    fill_in "comment_body", :with => "Testing is too hard."
    click_link_or_button "post_comment"
    expect(current_path).to eq article_path(article)
    within('#comments') do
      expect(page).to have_content("Cowboy said")
      expect(page).to have_content("Testing is too hard.")
    end
  end
end