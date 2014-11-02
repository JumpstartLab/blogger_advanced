require 'rails_helper'

describe Tag do
  let(:tag){ Fabricate(:tag) }

  [:articles, :taggings].each do |obj|
    it "has associated #{obj}" do
      expect(tag).to respond_to(obj)
    end
  end

  it "can be associated with an article" do
    article = Fabricate(:article)
    tag.articles << article
    expect(tag.articles).to include(article)
  end

  context "#to_s" do
    it "is the name" do
      expect(tag.to_s).to eq tag.name
    end
  end
end
