json.(@article, :title, :body)

json.author do
  json.name @article.author.name
  json.twitter @article.author.twitter
end