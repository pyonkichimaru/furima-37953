require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it "image, product_name, explanation, price, category_id, product_condition_id, delevery_charge_id, area_id, send_day_idが存在すれば出品できる" do
        expect(@product).to be_valid
      end
    end  

    context '商品出品ができない場合' do  
      it 'imageが空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
      end  
      it 'product_nameが空では登録できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Product name can't be blank"
      end
      it 'explanationが空では登録できない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'priceが空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end
      it "category_idが空では登録できない" do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
      it 'product_condition_idが空では登録できない' do
        @product.product_condition_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include "Product condition can't be blank"
      end
      it 'delivery_charge_idが空では登録できない' do
        @product.delivery_charge_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include "Delivery charge can't be blank"
      end
      it 'area_idが空では登録できない' do
        @product.area_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include "Area can't be blank"
      end
      it 'send_day_idが空では登録できない' do
        @product.send_day_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include "Send day can't be blank"
      end 

      it '価格に半角数字以外が含まれている場合は出品できない' do
        @product.price = '１'
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is invalid"
      end 
      it '価格が300円未満では出品できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is invalid"
      end 
      it '価格が9_999_999円を超えると出品できない' do
        @product.price = '10_000_000'
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is invalid"  
      end 
      it 'userが紐付いていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end  