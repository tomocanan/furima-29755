FactoryBot.define do
  factory :item do
    name               { Faker::Name.initials }
    info               { Faker::Lorem.sentence }
    category_id        { 2 }
    status_id          { 2 }
    delivery_fee_id    { 2 }
    prefecture_id      { 2 }
    day_id             { 2 }
    price              { Faker::Number.between(from: 201, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
