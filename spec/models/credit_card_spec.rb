require 'rails_helper'

describe CreditCard do
  describe '#create' do

    it "is invalid without a card" do
      credit_card = build(:credit_card, credit_card_id: "")
      credit_card.valid?
      expect(credit_card.errors[:credit_card_id]).to include("can't be blank")
    end

    it "is invalid without an customer" do
      credit_card = build(:credit_card, customer_id: "")
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("can't be blank")
    end

  end
end