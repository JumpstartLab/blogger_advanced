# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tags = (0..10).collect{ Fabricate(:tag) }

10.times do
  article = Fabricate(:article)
  article.created_at = article.created_at - (rand(300) + 100).hours
  article.tags = tags.sort_by{ rand }[0..rand(tags.length)]
  article.save
  (rand(10)).times do
  	Fabricate(:comment, :article => article, :created_at => article.created_at + rand(100).hours)
  end
end