Fabricator(:comment) do
  author_name { Faker::Name.name }
  body { Faker::Lorem.paragraph }
  article
end
