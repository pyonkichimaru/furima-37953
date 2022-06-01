FactoryBot.define do
  factory :buy_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '青山' }
    telephone_number { '09011112222' }
  end
end
