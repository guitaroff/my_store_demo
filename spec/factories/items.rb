FactoryGirl.define do
  factory :item do
    price 10
    weight 10
    real true
    sequence(:name) { |i| "Item #{i}" }
    description "description"
  end
end
