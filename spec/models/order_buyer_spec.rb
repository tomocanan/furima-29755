require 'rails_helper'

RSpec.describe Buyer, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
    end

    context '商品購入できるとき' do
      it 'クレジットカードのトークンと配送先情報(郵便番号、都道府県、市区町村、番地、電話番号)があれば購入できる' do
        expect(@order_buyer).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '配送先情報の郵便番号が空だと購入できない' do
        @order_buyer.postal = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
      end
      it '配送先情報の郵便番号にハイフンが入っていないと購入できない' do
        @order_buyer.postal = '0000000'
        @order_buyer.valid?
        sleep 3
        expect(@order_buyer.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
      end
      it '配送先情報の都道府県が空だと購入できない' do
        @order_buyer.area = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages)
      end
      it '配送先情報の市区町村が空だと購入できない' do
        @order_buyer.city = ''
        @order_buyer.valid?
        sleep 3
        expect(@order_buyer.errors.full_messages)
      end
      it '配送先情報の番地が空だと購入できない' do
        @order_buyer.address1 = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages)
      end
      it '配送先情報の電話番号が空だと購入できない' do
        @order_buyer.tell = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages)
      end
      it '電話番号にハイフンが入っていると購入できない' do
        @order_buyer.tell = '000-0000-00'
        @order_buyer.valid?
        sleep 3
        expect(@order_buyer.errors.full_messages)
      end
    end
  end
end
