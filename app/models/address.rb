class Address < ApplicationRecord

  #validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  belongs_to :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
