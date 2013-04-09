require 'spec_helper'

describe "authors/new" do
  before(:each) do
    assign(:author, stub_model(Author,
      :username => "MyString",
      :email => "MyString",
      :password => "",
      :password_confirmation => ""
    ).as_new_record)
  end

  it "renders new author form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", authors_path, "post" do
      assert_select "input#author_username[name=?]", "author[username]"
      assert_select "input#author_email[name=?]", "author[email]"
      assert_select "input#author_password[name=?]", "author[password]"
      assert_select "input#author_password_confirmation[name=?]", "author[password_confirmation]"
    end
  end
end
