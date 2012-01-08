require 'spec_helper'

describe TagsHelper do
  context ".article_tags" do
    it "returns a comma separated list of tags" do
      article = Fabricate(:article)
      tags = [Fabricate(:tag), Fabricate(:tag)]
      article.tags << tags
      article_tags(article).should == "#{tags[0].name}, #{tags[1].name}"
    end
  end
end