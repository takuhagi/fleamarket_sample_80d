require 'rails_helper'

describe User do
  describe '#create' do

    it "ニックネームがないと登録できない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailがないと登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードがないと登録できない" do
      user = build(:user, encrypted_password: "")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("を入力してください")
    end

  end
end