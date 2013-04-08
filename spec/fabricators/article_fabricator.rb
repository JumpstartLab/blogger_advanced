Fabricator(:article) do
  title { [Faker::Lorem.words(6), sequence].join(" ").titleize }
  body  { Faker::Lorem.paragraph }
  author { Author.random }
end

Fabricator(:article_with_comments, :from => :article) do
  comments(:count => rand((5..30))){|article, index| Fabricate(:comment, :article => article)}
end
