FactoryBot.define do
  factory :ticket do
    name { "Ticket ticket" }
    description { "Ticket ticket description" }
    association :author, factory: :user
  end
end
