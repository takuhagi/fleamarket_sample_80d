require 'rails_helper'
describe Item do
  describe '#create' do
    it "商品名が空ならば、登録できないかテストする" do
     item = build(:item, name: "")
     item.valid?
     expect(item.errors[:name]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "説明が空ならば、登録できないかテストする" do
     item = build(:item, explanation: "")
     item.valid?
     expect(item.errors[:explanation]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "値段が空ならば、登録できないかテストする" do
     item = build(:item, price:"")
     item.valid?
     expect(item.errors[:price]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "カテゴリーが空ならば、登録できないかテストする" do
     item = build(:item, category_id: "")
     item.valid?
     expect(item.errors[:category_id]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "状態が空ならば、登録できないかテストする" do
     item = build(:item, status_id: "")
     item.valid?
     expect(item.errors[:status_id]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "配送料選択が空ならば、登録できないかテストする" do
     item = build(:item, delivery_fee_id: "")
     item.valid?
     expect(item.errors[:delivery_fee_id]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "都道府県が空ならば、登録できないかテストする" do
     item = build(:item, prefecture_id: "")
     item.valid?
     expect(item.errors[:prefecture_id]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "発送日選択が空ならば、登録できないかテストする" do
     item = build(:item, days_until_shipping_id: "")
     item.valid?
     expect(item.errors[:days_until_shipping_id]).to include("can't be blank")
    end
  end
end
