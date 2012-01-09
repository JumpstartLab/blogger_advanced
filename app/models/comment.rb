class Comment < ActiveRecord::Base
  belongs_to :article

  validates :article_id, :presence => true

  def self.for_dashboard
    Comment.order('created_at DESC').limit(5).all
  end
end
