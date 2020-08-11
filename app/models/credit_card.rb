class CreditCard < ApplicationRecord
  validates :credit_card_id,:customer_id, presence: true
end
