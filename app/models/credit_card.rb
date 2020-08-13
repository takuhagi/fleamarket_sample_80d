class CreditCard < ApplicationRecord
  belongs_to :user
  validates :credit_card_id,:customer_id, presence: true
end
