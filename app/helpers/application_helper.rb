module ApplicationHelper
  def link_to_article(article)
    link_to article.title, article_path(article, :username => article.author.name)
  end
end
