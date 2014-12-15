module TagsHelper
  def article_tags(article)
    article.tags.collect(&:name).join(", ")
  end

  def tag_links(tags, tenant)
    link_to("<strong>all</strong>".html_safe, tenant_articles_path(tenant.slug)) + " " +
    tag_list_items(tags, tenant)
  end

  def tag_list_items(tags, tenant)
    tags.collect do |tag|
      link_to(highlighted_tag_name(tag.name), tenant_articles_path(tenant.slug, tag: tag.name))
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
