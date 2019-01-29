FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Name.name }
    publisher
  end
end
