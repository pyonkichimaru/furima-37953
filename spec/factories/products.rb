FactoryBot.define do
  factory :product do
    product_name             {"本"}
    explanation              {"説明"}
    price                    {"1000"}
    category_id              {"1"}
    product_condition_id     {"1"}
    delivery_charge_id       {"1"}
    area_id                  {"1"}
    send_day_id              {"1"}

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
