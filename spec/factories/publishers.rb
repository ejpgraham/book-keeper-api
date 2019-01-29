FactoryBot.define do
  factory :publisher do
    name { Faker::Company.name }

    factory :publisher_with_books do
      transient do
        books_count 5
      end

      after(:create) do |publisher,evaluator|
        create_list(:book, evaluator.books_count, publisher: publisher)
      end
    end
  end
end
