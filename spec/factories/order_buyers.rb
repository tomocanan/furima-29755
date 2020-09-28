FactoryBot.define do
  factory :order_buyer do
    # number           { "4242424242424242" }
    # cvc              { Faker::Number.number(digits: 3) }
    # exp_month        { Faker::Number.between(from: 1, to: 12) }
    # exp_year         { "21" }
 
    # token            { "0x00007f9d7b3a0078" }
    postal           { "000-0000" }
    area             { 2 }
    city             { "札幌市" }
    address1         { "北区" }
    tell             { Faker::Number.number(digits: 10) }
  
    association :item
    association :user 
  end
end