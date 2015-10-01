FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "user #{i}" }
    sequence(:email) { |i| "ex#{i}@email.com" }
    password "password"
  end
end
