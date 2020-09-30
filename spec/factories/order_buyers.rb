FactoryBot.define do
  factory :order_buyer do
    postal           { '000-0000' }
    area             { 2 }
    city             { '札幌市' }
    address1         { '北区' }
    tell             { Faker::Number.number(digits: 10) }

    association :item
    association :user
  end
end
