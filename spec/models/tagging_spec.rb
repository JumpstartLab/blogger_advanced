require 'spec_helper'

describe Tagging do
  let(:tagging) { Tagging.new }
  
  [:tag, :article].each do |obj|
    context "with a #{obj}" do
      before(:each) do
        tagging.send(obj.to_s + "=", Fabricate(obj))
      end

      it "has an associated #{obj}" do
        tagging.send(obj).should be_instance_of(obj.to_s.classify.constantize)
      end
    end
  end
  
  context "validations" do
    context "for a given article_id" do
      before(:each) do
        tagging.update_attributes(:article_id => 1, :tag_id => 2)
      end
      
      it "can have multiple tags" do
        tagging2 = Tagging.new(:article_id => tagging.article_id,
                               :tag_id => tagging.tag_id + 1)
        tagging2.should be_valid                       
      end
      
      it "cannot repeat the same tag_id" do
        tagging2 = Tagging.new(:article_id => tagging.article_id,         
                               :tag_id => tagging.tag_id)
        tagging2.should_not be_valid
      end
    end
  end
end
