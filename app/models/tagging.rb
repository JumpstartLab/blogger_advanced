class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :article

  validates_uniqueness_of :article_id, :scope => :tag_id
end
