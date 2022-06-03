require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      product=FactoryBot.create(:product)
      @buy_address = FactoryBot.build(:buy_address, product_id: product.id, user_id: user.id)
    end

    context '商品購入できる場合' do
      it "post_code, prefecture_id, city, house_number, telephone_numberが存在すれば出品できる" do
        expect(@buy_address).to be_valid
      end
      it "building_nameは空でも購入できる" do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end  
    end  

    context '商品購入ができない場合' do  
      it 'post_codeが空では登録できない' do
        @buy_address.post_code = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end  
      it 'prefectureを選択していないと登録できない' do
        @buy_address. prefecture_id= 0
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空では登録できない' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberが空では登録できない' do
        @buy_address.house_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "House number can't be blank"
      end
      it "telephone_numberが空では登録できない" do
        @buy_address.telephone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Telephone number can't be blank"
      end 
      it "telephone_numberが10桁未満では登録できない" do
        @buy_address.telephone_number = '000000000'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Telephone number is invalid"
      end 
      it "telephone_numberが11桁を超えると登録できない" do
        @buy_address.telephone_number = '111111111111'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Telephone number is invalid"
      end 
      it "telephone_numberが半角以外では登録できない" do
        @buy_address.telephone_number = '０００'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Telephone number is invalid"
      end 
      it "tokenが空では登録できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が半角ハイフンを含む形でなければ購入できない" do
        @buy_address.post_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'userが紐付いていなければ購入できない' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'productが紐付いていなければ購入できない' do
        @buy_address.product_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end  
