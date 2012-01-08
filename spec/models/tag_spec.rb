require 'spec_helper'

describe Tag do
  let(:tag){ Fabricate(:tag) }

  [:articles, :taggings].each do |obj|
    it "has associated #{obj}" do
      tag.should respond_to(obj)
    end 
  end
  
  it "can be associated with an article" do
    article = Fabricate(:article)
    tag.articles << article
    tag.articles.should include(article)
  end
  
  context "#to_s" do
    it "is the name" do
      tag.to_s.should == tag.name
    end
  end
end
