FactoryGirl.define do
  factory :link do
    url { Faker::Internet.url }
  end

  factory :invalid_link, class: Link do
    url nil
  end
end
