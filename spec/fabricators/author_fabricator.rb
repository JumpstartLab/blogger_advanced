Fabricator(:author) do
  name { Faker::Name.name }
  email { |attrs| Faker::Internet.email(attrs[:name]) }
  twitter { |attrs| Faker::Internet.user_name(attrs[:name]).gsub('.', '_') }
  website { "http://www.#{Faker::Internet.domain_name}" }
  phone_number { Faker::PhoneNumber.phone_number }
end


