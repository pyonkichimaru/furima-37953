class Product < ApplicationRecord
  

  belongs_to :user
  #has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :product_condition
  belongs_to :send_day
  belongs_to_active_hash :area



  validates :title, :text, presence: true
  validates :area_id, numericality:              { other_than: 0 , message: "can't be blank"} 
  validates :category_id, numericality:          { other_than: 0 , message: "can't be blank"} 
  validates :delivery_id, numericality:          { other_than: 0 , message: "can't be blank"} 
  validates :product_condition_id, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :send_id, numericality:              { other_than: 0 , message: "can't be blank"} 
end
