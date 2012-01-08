Fabricator(:tag) do
  name { [Faker::Lorem.words(1), sequence].join }
end