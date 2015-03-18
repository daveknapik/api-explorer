FactoryGirl.define do
  factory :parameter do
    name  Faker::Lorem.word
    description Faker::Lorem.sentence
    parameter_type "string"
    url_parameter false
    required false
    resource

    factory :url_parameter do
      url_parameter true
      required true
    end

    factory :required_parameter do
      required true
    end
  end
end