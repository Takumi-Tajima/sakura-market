FactoryBot.define do
  factory :item do
    name { Faker::JapaneseMedia::Naruto.character }
    price { Faker::Number.number(digits: 4) }
    description { Faker::Lorem.sentence(word_count: 25) }
    hidden { false }
  end
end
