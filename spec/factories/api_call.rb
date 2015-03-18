FactoryGirl.define do
  factory :api_call do
    name  Faker::Lorem.word
    description Faker::Lorem.sentence
  end
end