FactoryBot.define do
  factory :item do
    title              { Faker::Commerce.product_name }
    version            { Faker::Lorem.paragraph }
    category           { Category.where.not(id: 1).sample }
    condition          { Condition.where.not(id: 1).sample }
    postage            { Postage.where.not(id: 1).sample }
    sender             { Sender.where.not(id: 1).sample }
    ship_date          { ShipDate.where.not(id: 1).sample }
    price              { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
