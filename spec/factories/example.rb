FactoryGirl.define do
  factory :example do
    name  Faker::Lorem.word
    description Faker::Lorem.sentence
    resource
  end
end