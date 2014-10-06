class CommentSerializer < ActiveModel::Serializer
  attributes :commenter, :comment
  
  def commenter
    object.author_name
  end
  
  def comment
    object.body
  end
end
