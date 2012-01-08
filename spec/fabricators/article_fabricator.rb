Fabricator(:article) do
  title { [Faker::Lorem.words(6), sequence].join(" ").titleize }
  body  { Faker::Lorem.paragraph }
end

Fabricator(:article_with_comments, :from => :article) do
  comments(:count => 3){|article, index| Fabricate(:comment, :article => article)}
end