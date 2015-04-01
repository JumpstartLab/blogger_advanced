class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :author_name

  def author_name
    object.author.name
  end
end
