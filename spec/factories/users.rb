FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password123" }

    trait :admin do
      admin { true }
    end
  end
end
