class Comment < ActiveRecord::Base
  belongs_to :article

  validates :article_id, :presence => true

  def self.for_dashboard
    order('created_at DESC').limit(5).all
  end

  def word_count
    body.split.count
  end

  def self.total_word_count
    all.inject(0) {|total, a| total += a.word_count }
  end

  def self.all_for_article_id(id)
    CommentService.comments_for_article_id(id)
  end
end

class CommentService
  def self.comments_for_article_id(id)
    data = JSON.parse(Faraday.get("http://localhost:3001/comments?article_id=#{id}").body)
    ProxyComment.parse_collection(data)
  end
end

class ProxyComment
  attr_reader :author_name, :body, :article_id, :created_at

  def initialize(input)
    input = HashWithIndifferentAccess.new(input)
    @author_name = input[:author_name]
    @body = input[:body]
    @article_id = input[:article_id]
    @created_at = Date.parse(input[:created_at])
  end

  def self.parse_collection(comments)
    cos = comments.collect{|c| ProxyComment.new(c)}
  end
end