class Product < ApplicationRecord
  

  belongs_to :user
  #has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :send_day
  belongs_to_active_hash :area

  validates :product_name,       presence: true
  validates :explanation,        presence: true
  validates :image,              presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}

  validates :area_id, numericality:              { other_than: 0 , message: "can't be blank"} 
  validates :category_id, numericality:          { other_than: 0 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality:   { other_than: 0 , message: "can't be blank"} 
  validates :product_condition_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :send_day_id, numericality:          { other_than: 0 , message: "can't be blank"} 
end
