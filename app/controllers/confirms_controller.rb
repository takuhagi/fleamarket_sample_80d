class ConfirmsController < ApplicationController

def index
  card = CreditCard.find(11) #仮
  Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
  customer = Payjp::Customer.retrieve(card.customer_id)
  @credit_card = customer.cards.retrieve(card.credit_card_id)
end

def pay
  card = CreditCard.find(11)  #仮
  Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
  Payjp::Charge.create(
    amount: 9000000, #仮
    customer: card.customer_id,
    card: card.credit_card_id,
    :currency => 'jpy',
  )
  redirect_to root_path
end

end
