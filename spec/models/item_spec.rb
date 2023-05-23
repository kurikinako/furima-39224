require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品の出品ができるとき' do
      it 'titleとimage、versionとcategory、conditionとpostage、senderとship_date、priceが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'versionが空では登録できない' do
        @item.version = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Version can't be blank")
      end
      it 'categoryが空では登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'conditionが空では登録できない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end
      it 'postageが空では登録できない' do
        @item.postage = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage is not a number')
      end
      it 'senderが空では登録できない' do
        @item.sender = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Sender is not a number')
      end
      it 'ship_dateが空では登録できない' do
        @item.ship_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship date is not a number')
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9,999,999より大きいと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが数値でないと登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'category_idが1以外でないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが1以外でないと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'postage_idが1以外でないと登録できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 1')
      end
      it 'sender_idが1以外でないと登録できない' do
        @item.sender_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Sender must be other than 1')
      end
      it 'ship_date_idが1以外でないと登録できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship date must be other than 1')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
