FactoryGirl.define do
  factory :binder do
    name { Faker::Company.name }
    description { Faker::Hacker.say_something_smart }
    export_path { Faker::Company.logo }
  end

  factory :invalid_binder, class: Binder do
    name nil
  end
end
