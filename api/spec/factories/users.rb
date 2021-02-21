FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TestName:#{n}" }
    sequence(:email) { |n| "TestAddress#{n}@example.com" }
    password { 'ExamplePassword' }
    password_confirmation { 'ExamplePassword' }
  end
end
