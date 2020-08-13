require 'rails_helper'

describe Profile do
  describe '#create' do

    it "姓が空ならば、登録できないかテストする" do
      profile = build(:profile, family_name: "")
      profile.valid?
      expect(profile.errors[:family_name]).to include("を入力してください")
    end

    it "名が空ならば、登録できないかテストする" do
      profile = build(:profile, first_name: "")
      profile.valid?
      expect(profile.errors[:first_name]).to include("を入力してください")
    end

    it "せいが空ならば、登録できないかテストする" do
      profile = build(:profile, family_name_kana: "")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("を入力してください")
    end

    it "めいが空ならば、登録できないかテストする" do
      profile = build(:profile, first_name_kana: "")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("を入力してください")
    end

    it "郵便番号が空ならば、登録できないかテストする" do
      profile = build(:profile, post_code: "")
      profile.valid?
      expect(profile.errors[:post_code]).to include("を入力してください")
    end

    it "市区町村が空ならば、登録できないかテストする" do
      profile = build(:profile, city: "")
      profile.valid?
      expect(profile.errors[:city]).to include("を入力してください")
    end

    it "番地が空ならば、登録できないかテストする" do
      profile = build(:profile, address_number: "")
      profile.valid?
      expect(profile.errors[:address_number]).to include("を入力してください")
    end

    it "ビルが空ならば、登録できないかテストする" do
      profile = build(:profile, building: "")
      profile.valid?
      expect(profile.errors[:building]).to include("を入力してください")
    end

    it "電話番号が空ならば、登録できないかテストする" do
      profile = build(:profile, phone: "")
      profile.valid?
      expect(profile.errors[:phone]).to include("を入力してください")
    end

  end
end