class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :author
  has_many :comments
  
  def author
    object.author.name
  end
end
