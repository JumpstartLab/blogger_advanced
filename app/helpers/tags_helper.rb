module TagsHelper
  def article_tags(article)
    article.tags.collect(&:name).join(", ")
  end

  def tag_links(tags)
    link_to("<strong>all</strong>".html_safe, articles_path) + " " +
    tag_list_items(tags)
  end

  def tag_list_items(tags)
    tags.collect do |tag|
      link_to(highlighted_tag_name(tag.name), articles_path(:tag => tag.name))
    end.join(" ").html_safe
  end

  def highlighted_tag_name(tag)
    if params[:tag] && (params[:tag] == tag)
      "<em>#{tag}</em>".html_safe
    else
      tag
    end
  end
end
