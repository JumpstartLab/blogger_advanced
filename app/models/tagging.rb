class Tagging < ActiveRecord::Base
  belongs_to :tag, :touch => true
  belongs_to :article, :touch => true

  validates_uniqueness_of :article_id, :scope => :tag_id
end
