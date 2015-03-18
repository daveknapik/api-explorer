FactoryGirl.define do
  factory :resource do
    name  Faker::Lorem.word
    path "/foo/bar"
    http_method "get"
    api_call
  end
end