class BuyAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :product_id, :user_id, :price, :token

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid"}
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

 
  def save
    buy = Buy.create(product_id: product_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id)
  end
end