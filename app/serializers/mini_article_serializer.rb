class MiniArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :tag_names, :comments_count

  def tag_names
    object.tags.pluck(:name)
  end

  def comments_count
    object.comments.count
  end
end
