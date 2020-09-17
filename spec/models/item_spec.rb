require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品出品できるとき' do
      it '出品画像、商品名、商品の説明、商品の詳細（カテゴリー、商品の状態）、配送について（配送料の負担、発送元の地域、発送までの日数）、販売価格があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'ログインしているユーザーだけが、出品ページへ遷移できること' do
      end
      it '画像は1枚必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it '商品の説明が必須であること' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it '商品の状態についての情報が必須であること' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it '配送料の負担についての情報が必須であること' do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee is not a number')
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it '発送までの日数についての情報が必須であること' do
        @item.day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Day is not a number')
      end
      it '価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300以上であること' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、¥9,999,999以下であること' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格は半角数字のみ入力可能であること' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '商品がユーザーと紐付いていること' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
